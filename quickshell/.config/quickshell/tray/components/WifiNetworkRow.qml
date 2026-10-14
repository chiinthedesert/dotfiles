import QtQuick
import "."

Item {
    id: root

    required property var theme
    required property var modelData

    signal connectRequested(var network)

    function signalGlyph(strength): string {
        if (strength >= 0.75)
            return "󰤨"

        if (strength >= 0.5)
            return "󰤥"

        if (strength >= 0.25)
            return "󰤢"

        return "󰤟"
    }

    height: theme.rowHeight

    opacity:
        modelData.stateChanging
            ? theme.disabledOpacity
            : 1

    Rectangle {
        anchors.fill: parent
        color: mouse.containsMouse ? root.theme.hover : "transparent"
    }

    Row {
        id: row

        anchors {
            fill: parent
            leftMargin: root.theme.rowPaddingX
            rightMargin: root.theme.rowPaddingX
        }

        spacing: 0

        MenuText {
            theme: root.theme
            width: root.theme.wifiGlyphWidth
            height: row.height

            text: root.signalGlyph(root.modelData.signalStrength)

            color:
                root.modelData.connected
                    ? root.theme.green
                    : root.theme.fg

            font.pixelSize: root.theme.wifiIconSize
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        Item {
            width: root.theme.wifiNameGap
            height: 1
        }

        MenuText {
            theme: root.theme

            width: Math.max(
                0,
                row.width
                    - root.theme.wifiGlyphWidth
                    - root.theme.wifiNameGap
                    - root.theme.rowGap
                    - root.theme.infoWidth
            )

            height: row.height
            text: root.modelData.name

            color:
                root.modelData.connected
                    ? root.theme.green
                    : root.theme.fg

            elide: Text.ElideRight
        }

        Item {
            width: root.theme.rowGap
            height: 1
        }

        MenuText {
            theme: root.theme
            width: root.theme.infoWidth
            height: row.height

            text:
                root.modelData.connected
                    ? "✓"
                    : root.modelData.stateChanging
                        ? "..."
                        : `${Math.round(root.modelData.signalStrength * 100)}%`

            color:
                root.modelData.connected
                    ? root.theme.green
                    : root.theme.muted

            horizontalAlignment: Text.AlignRight
        }
    }

    MouseArea {
        id: mouse

        anchors.fill: parent
        enabled: !root.modelData.stateChanging
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onClicked:
            root.connectRequested(root.modelData)
    }
}
