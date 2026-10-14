import QtQuick
import "."

SidebarButton {
    id: root

    property string label: ""
    property color foreground: theme.fg
    property int textSize: theme.fontSize
    property int textWeight: Font.Normal

    signal triggered()

    MenuText {
        theme: root.theme
        anchors.centerIn: parent

        text: root.label
        color: root.foreground
        font.pixelSize: root.textSize
        font.weight: root.textWeight
    }

    onClicked: root.triggered()
}
