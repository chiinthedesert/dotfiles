import QtQuick
import "."

Item {
    id: root

    required property var theme

    property string leading: ""
    property string label: ""
    property string trailing: ""

    property color leadingColor: theme.fg
    property color trailingColor: theme.fg

    property bool hovered: false

    Rectangle {
        anchors.fill: parent
        color: root.hovered ? root.theme.hover : "transparent"
    }

    Row {
        id: row

        anchors {
            fill: parent
            leftMargin: root.theme.rowPaddingX
            rightMargin: root.theme.rowPaddingX
        }

        spacing: root.theme.rowGap

        MenuText {
            theme: root.theme
            width: root.theme.glyphWidth
            height: row.height
            text: root.leading
            color: root.leadingColor
            horizontalAlignment: Text.AlignHCenter
        }

        MenuText {
            theme: root.theme

            width: Math.max(
                0,
                row.width
                    - root.theme.glyphWidth * 2
                    - root.theme.rowGap * 2
            )

            height: row.height
            text: root.label
            elide: Text.ElideRight
        }

        MenuText {
            theme: root.theme
            width: root.theme.glyphWidth
            height: row.height
            text: root.trailing
            color: root.trailingColor
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
