import QtQuick

Rectangle {
    id: root

    required property var theme

    property int acceptedButtons: Qt.LeftButton

    signal clicked(var event)
    signal wheel(var event)

    width: theme.sidebarItemSize
    height: theme.sidebarItemSize

    color:
        mouse.pressed
            ? theme.pressed
            : mouse.containsMouse
                ? theme.border
                : "transparent"

    MouseArea {
        id: mouse

        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: root.acceptedButtons

        onClicked: event => root.clicked(event)
        onWheel: event => root.wheel(event)
    }
}
