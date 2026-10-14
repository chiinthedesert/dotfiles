import QtQuick
import Quickshell
import "../components"

PopupWindow {
    id: root

    required property var theme

    property var anchorItem: null
    property var menuModel: null

    property int submenuDepth: 0
    property string submenuTitle: ""

    signal leaveSubmenu()
    signal enterSubmenu(var entry)
    signal actionRequested(var entry)
    signal hidden()

    visible: false
    grabFocus: true
    color: "transparent"

    implicitWidth: theme.popupWidth
    implicitHeight: frame.implicitHeight

    anchor.item: root.anchorItem

    anchor.edges:
        Edges.Top
        | Edges.Right

    anchor.gravity:
        Edges.Bottom
        | Edges.Right

    anchor.adjustment: PopupAdjustment.All
    anchor.margins.right: theme.popupGap

    onVisibleChanged: {
        if (visible)
            menuList.positionViewAtBeginning()
        else
            root.hidden()
    }

    Rectangle {
        id: frame

        anchors.fill: parent

        implicitHeight:
            content.implicitHeight
            + root.theme.popupPadding * 2

        color: root.theme.surface
        border.width: root.theme.borderWidth
        border.color: root.theme.border

        Column {
            id: content

            x: root.theme.popupPadding
            y: root.theme.popupPadding

            width:
                parent.width
                - root.theme.popupPadding * 2

            spacing: 0

            Item {
                visible: root.submenuDepth > 0
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                MenuLine {
                    anchors.fill: parent
                    theme: root.theme

                    leading: "‹"
                    leadingColor: root.theme.pink
                    label: root.submenuTitle
                    hovered: backMouse.containsMouse
                }

                MouseArea {
                    id: backMouse

                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor

                    onClicked:
                        root.leaveSubmenu()
                }
            }

            MenuSeparator {
                visible: root.submenuDepth > 0
                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.separatorHeight
                        : 0
            }

            ListView {
                id: menuList

                width: content.width

                height: Math.min(
                    contentHeight,
                    root.theme.popupListMaxHeight
                )

                clip: true
                boundsBehavior: Flickable.StopAtBounds
                interactive: contentHeight > height

                model: root.menuModel

                onModelChanged:
                    positionViewAtBeginning()

                delegate: MenuEntry {
                    width: menuList.width
                    theme: root.theme

                    onEnterSubmenu: entry =>
                        root.enterSubmenu(entry)

                    onActionRequested: entry =>
                        root.actionRequested(entry)
                }
            }
        }
    }
}
