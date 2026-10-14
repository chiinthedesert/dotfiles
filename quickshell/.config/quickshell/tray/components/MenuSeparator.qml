import QtQuick

Item {
    id: root

    required property var theme

    Rectangle {
        anchors {
            left: parent.left
            right: parent.right
            verticalCenter: parent.verticalCenter

            leftMargin: root.theme.separatorInset
            rightMargin: root.theme.separatorInset
        }

        height: 1
        color: root.theme.border
    }
}
