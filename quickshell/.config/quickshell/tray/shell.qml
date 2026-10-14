pragma ComponentBehavior: Bound
//@ pragma AppId chi.tray

import QtQuick
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.SystemTray

import "components" as Components
import "popups" as Popups
import "services" as Services

ShellRoot {
    id: root

    Theme {
        id: theme
    }

    Services.BatteryService {
        id: battery
    }

    Services.WifiService {
        id: wifi

        onPasswordRequested:
            wifiPopup.focusPassword()

        onConnectedSuccessfully:
            wifiPopup.visible = false
    }

    // ============================================================
    // Global state
    // ============================================================

    property bool trayVisible: false

    property var trayMenuAnchor: null
    property var activeTrayItem: null
    property var submenuStack: []

    property var wifiAnchor: null
    property var batteryAnchor: null

    readonly property int submenuDepth:
        submenuStack.length

    readonly property string submenuTitle:
        submenuDepth > 0
            ? submenuStack[submenuDepth - 1].title
            : ""

    readonly property var currentMenu:
        submenuDepth > 0
            ? submenuStack[submenuDepth - 1].opener.children
            : rootMenu.children

    readonly property color wifiColor:
        wifi.connected
            ? theme.green
            : wifi.enabled
                ? theme.yellow
                : theme.muted

    readonly property color batteryColor: {
        if (!battery.available)
            return theme.muted

        if (battery.charging)
            return theme.green

        if (battery.fraction <= 0.20)
            return theme.red

        if (battery.fraction <= 0.40)
            return theme.yellow

        return theme.fg
    }

    readonly property var targetScreen: {
        const monitor = Hyprland.focusedMonitor

        if (monitor) {
            for (
                let i = 0;
                i < Quickshell.screens.length;
                ++i
            ) {
                const screen = Quickshell.screens[i]

                if (screen.name === monitor.name)
                    return screen
            }
        }

        return Quickshell.screens.length > 0
            ? Quickshell.screens[0]
            : null
    }

    // ============================================================
    // IPC
    // ============================================================

    IpcHandler {
        target: "tray"

        function toggle(): void {
            root.setTrayVisible(!root.trayVisible)
        }

        function show(): void {
            root.setTrayVisible(true)
        }

        function hide(): void {
            root.setTrayVisible(false)
        }
    }

    function setTrayVisible(value): void {
        if (!value)
            closeAllPopups()

        trayVisible = value
    }

    // ============================================================
    // Popup orchestration
    // ============================================================

    function closeAllPopups(): void {
        trayMenu.visible = false
        wifiPopup.visible = false
        batteryPopup.visible = false
    }

    function openWifi(anchor): void {
        trayMenu.visible = false
        batteryPopup.visible = false

        wifiAnchor = anchor
        wifi.beginPopupSession()
        wifiPopup.visible = true
    }

    function openBattery(anchor): void {
        trayMenu.visible = false
        wifiPopup.visible = false

        batteryAnchor = anchor
        batteryPopup.visible = true
    }

    // ============================================================
    // Tray DBus menu
    // ============================================================

    QsMenuOpener {
        id: rootMenu

        menu:
            root.activeTrayItem
                ? root.activeTrayItem.menu
                : null
    }

    Component {
        id: submenuComponent

        QsMenuOpener {}
    }

    function cleanText(value): string {
        return String(value || "").replace(/&/g, "")
    }

    function resetSubmenus(): void {
        const stack = submenuStack
        submenuStack = []

        for (
            let i = stack.length - 1;
            i >= 0;
            --i
        ) {
            stack[i].opener.destroy()
        }
    }

    function clearTrayMenuState(): void {
        resetSubmenus()
        activeTrayItem = null
        trayMenuAnchor = null
    }

    function enterSubmenu(entry): void {
        const opener = submenuComponent.createObject(
            root,
            { menu: entry }
        )

        if (!opener)
            return

        const stack = submenuStack.slice()

        stack.push({
            opener: opener,
            title: cleanText(entry.text)
        })

        submenuStack = stack
    }

    function leaveSubmenu(): void {
        if (submenuDepth === 0)
            return

        const stack = submenuStack.slice()
        const current = stack.pop()

        submenuStack = stack
        current.opener.destroy()
    }

    function openTrayMenu(item, anchor): void {
        if (!item || !item.hasMenu)
            return

        wifiPopup.visible = false
        batteryPopup.visible = false

        resetSubmenus()
        activeTrayItem = item
        trayMenuAnchor = anchor

        if (trayMenu.visible)
            trayMenu.anchor.updateAnchor()
        else
            trayMenu.visible = true
    }

    function triggerMenuAction(entry): void {
        entry.triggered()

        // Let DBusMenu dispatch before destroying its QsMenuOpener.
        Qt.callLater(() => {
            trayMenu.visible = false
        })
    }

    // ============================================================
    // Main sidebar window
    // ============================================================

    PanelWindow {
        id: panel

        screen: root.targetScreen

        visible:
            root.trayVisible
            && root.targetScreen !== null

        anchors {
            left: true
            top: true
        }

        margins {
            left: 0

            top:
                panel.screen
                    ? Math.max(
                        0,
                        (
                            panel.screen.height
                            - panel.implicitHeight
                        ) / 2
                    )
                    : 0
        }

        aboveWindows: true
        exclusionMode: ExclusionMode.Ignore
        focusable: false

        color: "transparent"

        implicitWidth: theme.sidebarWidth

        implicitHeight:
            sidebar.implicitHeight
            + theme.sidebarPaddingY * 2

        Rectangle {
            anchors.fill: parent
            color: theme.bg
            border.width: theme.borderWidth
            border.color: theme.border
        }

        Components.SidebarContent {
            id: sidebar

            anchors.centerIn: parent
            theme: theme

            wifiVisible: wifi.available
            wifiLabel: wifi.glyph
            wifiColor: root.wifiColor

            batteryVisible: battery.available
            batteryLabel:
                battery.percentage >= 0
                    ? String(battery.percentage)
                    : "?"
            batteryColor: root.batteryColor

            onTrayMenuRequested:
                (item, anchor) =>
                    root.openTrayMenu(item, anchor)

            onWifiRequested:
                anchor => root.openWifi(anchor)

            onBatteryRequested:
                anchor => root.openBattery(anchor)

            onClosePopupsRequested:
                root.closeAllPopups()
        }

        Popups.TrayMenuPopup {
            id: trayMenu

            theme: theme
            anchorItem: root.trayMenuAnchor
            menuModel: root.currentMenu
            submenuDepth: root.submenuDepth
            submenuTitle: root.submenuTitle

            onLeaveSubmenu:
                root.leaveSubmenu()

            onEnterSubmenu:
                entry => root.enterSubmenu(entry)

            onActionRequested:
                entry => root.triggerMenuAction(entry)

            onHidden:
                root.clearTrayMenuState()
        }

        Popups.WifiPopup {
            id: wifiPopup

            theme: theme
            anchorItem: root.wifiAnchor

            hardwareEnabled: wifi.hardwareEnabled
            wifiEnabled: wifi.enabled
            networkModel: wifi.networks
            needsPassword: wifi.needsPassword
            errorText: wifi.errorText

            onToggleWifi:
                wifi.toggleEnabled()

            onConnectRequested:
                network => wifi.connectNetwork(network)

            onPasswordSubmitted:
                password => wifi.submitPassword(password)

            onHidden: {
                wifi.endPopupSession()
                root.wifiAnchor = null
            }
        }

        Popups.BatteryPopup {
            id: batteryPopup

            theme: theme
            anchorItem: root.batteryAnchor

            percentageText:
                battery.percentage >= 0
                    ? `${battery.percentage}%`
                    : "—"

            percentageColor: root.batteryColor
            statusText: battery.statusText
            timeLabel: battery.timeLabel
            timeText: battery.timeText
            rateText: battery.rateText
            healthVisible: battery.healthVisible
            healthText: battery.healthText

            onHidden:
                root.batteryAnchor = null
        }
    }
}
