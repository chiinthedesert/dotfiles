import QtQuick
import Quickshell
import "../components"

PopupWindow {
    id: root

    required property var theme

    property var anchorItem: null

    property string percentageText: "—"
    property color percentageColor: theme.fg

    property string statusText: "—"
    property string timeLabel: "Remaining"
    property string timeText: "—"
    property string rateText: "—"

    property bool healthVisible: false
    property string healthText: "—"

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
        if (!visible)
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

            DetailRow {
                theme: root.theme
                width: content.width
                name: "Battery"
                value: root.percentageText
                valueColor: root.percentageColor
            }

            MenuSeparator {
                theme: root.theme
                width: content.width
                height: root.theme.separatorHeight
            }

            DetailRow {
                theme: root.theme
                width: content.width
                name: "Status"
                value: root.statusText
            }

            DetailRow {
                theme: root.theme
                width: content.width
                name: root.timeLabel
                value: root.timeText
            }

            DetailRow {
                theme: root.theme
                width: content.width
                name: "Rate"
                value: root.rateText
            }

            DetailRow {
                visible: root.healthVisible
                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                name: "Health"
                value: root.healthText
            }
        }
    }
}
