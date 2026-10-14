import QtQuick
import "."
import Quickshell.Services.SystemTray
import Quickshell.Widgets

SidebarButton {
    id: root

    required property var modelData

    signal requestMenu(var item, var anchor)
    signal requestClosePopups()

    visible:
        modelData.status !== Status.Passive

    width:
        visible
            ? theme.sidebarItemSize
            : 0

    height:
        visible
            ? theme.sidebarItemSize
            : 0

    acceptedButtons:
        Qt.LeftButton
        | Qt.RightButton
        | Qt.MiddleButton

    IconImage {
        anchors.centerIn: parent
        implicitSize: root.theme.trayIconSize
        source: root.modelData.icon
    }

    onClicked: event => {
        const item = root.modelData

        if (event.button === Qt.RightButton) {
            if (item.hasMenu)
                root.requestMenu(item, root)

            return
        }

        if (event.button === Qt.MiddleButton) {
            root.requestClosePopups()
            item.secondaryActivate()
            return
        }

        if (item.onlyMenu && item.hasMenu) {
            root.requestMenu(item, root)
        } else {
            root.requestClosePopups()
            item.activate()
        }
    }

    onWheel: event => {
        const horizontal =
            Math.abs(event.angleDelta.x)
            > Math.abs(event.angleDelta.y)

        const delta = horizontal
            ? event.angleDelta.x
            : event.angleDelta.y

        root.modelData.scroll(delta, horizontal)
        event.accepted = true
    }
}
