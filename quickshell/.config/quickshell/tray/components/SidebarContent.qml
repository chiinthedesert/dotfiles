import QtQuick
import "."
import Quickshell.Services.SystemTray

Column {
    id: root

    required property var theme

    property bool wifiVisible: false
    property string wifiLabel: ""
    property color wifiColor: theme.fg

    property bool batteryVisible: false
    property string batteryLabel: ""
    property color batteryColor: theme.fg

    property date now: new Date()

    readonly property bool hasTrayItems:
        SystemTray.items.values.some(
            item => item.status !== Status.Passive
        )

    signal trayMenuRequested(var item, var anchor)
    signal wifiRequested(var anchor)
    signal batteryRequested(var anchor)
    signal closePopupsRequested()

    spacing: theme.sidebarGap

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: root.now = new Date()
    }

    // Time
    Item {
        width: root.theme.sidebarItemSize
        height: root.theme.clockHeight

        MenuText {
            theme: root.theme
            anchors.centerIn: parent

            text: Qt.formatDateTime(root.now, "HH\nmm")
            color: root.theme.fg

            font.pixelSize: root.theme.clockFontSize
            font.weight: Font.Bold

            horizontalAlignment: Text.AlignHCenter
            lineHeight: 1.0
            lineHeightMode: Text.ProportionalHeight
        }
    }

    MenuSeparator {
        theme: root.theme
        width: root.theme.sidebarItemSize
        height: 1
    }

    // Application tray
    Repeater {
        model: SystemTray.items

        delegate: TrayButton {
            theme: root.theme

            onRequestMenu: (item, anchor) =>
                root.trayMenuRequested(item, anchor)

            onRequestClosePopups:
                root.closePopupsRequested()
        }
    }

    MenuSeparator {
        visible: root.hasTrayItems
        theme: root.theme
        width: root.theme.sidebarItemSize
        height: visible ? 1 : 0
    }

    // System status
    StatusButton {
        id: wifiButton

        visible: root.wifiVisible
        width: visible ? root.theme.sidebarItemSize : 0
        height: visible ? root.theme.sidebarItemSize : 0

        theme: root.theme
        label: root.wifiLabel
        foreground: root.wifiColor
        textSize: root.theme.wifiIconSize

        onTriggered:
            root.wifiRequested(wifiButton)
    }

    StatusButton {
        id: batteryButton

        visible: root.batteryVisible
        width: visible ? root.theme.sidebarItemSize : 0
        height: visible ? root.theme.sidebarItemSize : 0

        theme: root.theme
        label: root.batteryLabel
        foreground: root.batteryColor
        textSize: root.theme.batteryFontSize
        textWeight: Font.Bold

        onTriggered:
            root.batteryRequested(batteryButton)
    }
}
