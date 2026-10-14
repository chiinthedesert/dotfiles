import QtQuick
import "."

Item {
    id: root

    required property var theme

    property string name: ""
    property string value: ""
    property color valueColor: theme.fg

    height: theme.rowHeight

    Row {
        anchors {
            fill: parent
            leftMargin: root.theme.rowPaddingX
            rightMargin: root.theme.rowPaddingX
        }

        MenuText {
            theme: root.theme
            width: parent.width * 0.42
            height: parent.height
            text: root.name
            color: root.theme.muted
        }

        MenuText {
            theme: root.theme
            width: parent.width * 0.58
            height: parent.height
            text: root.value
            color: root.valueColor
            horizontalAlignment: Text.AlignRight
            elide: Text.ElideRight
        }
    }
}
