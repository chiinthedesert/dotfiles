import QtQuick
import Quickshell
import "."

Item {
    id: root

    required property var theme
    required property var modelData

    signal enterSubmenu(var entry)
    signal actionRequested(var entry)

    readonly property bool separator:
        modelData.isSeparator

    readonly property string label:
        separator
            ? ""
            : String(modelData.text || "").replace(/&/g, "")

    readonly property string leadingMark: {
        if (separator)
            return ""

        if (modelData.buttonType === QsMenuButtonType.RadioButton) {
            return modelData.checkState === Qt.Checked ? "●" : "○"
        }

        if (modelData.buttonType === QsMenuButtonType.CheckBox) {
            if (modelData.checkState === Qt.Checked)
                return "✓"

            if (modelData.checkState === Qt.PartiallyChecked)
                return "−"
        }

        return ""
    }

    readonly property string trailingMark:
        !separator && modelData.hasChildren
            ? "›"
            : ""

    height:
        separator
            ? theme.separatorHeight
            : theme.rowHeight

    opacity:
        separator || modelData.enabled
            ? 1
            : theme.disabledOpacity

    MenuSeparator {
        anchors.fill: parent
        theme: root.theme
        visible: root.separator
    }

    MenuLine {
        anchors.fill: parent

        theme: root.theme
        visible: !root.separator

        leading: root.leadingMark
        leadingColor: root.theme.green

        label: root.label

        trailing: root.trailingMark
        trailingColor: root.theme.pink

        hovered:
            mouse.containsMouse
            && root.modelData.enabled
    }

    MouseArea {
        id: mouse

        anchors.fill: parent

        enabled:
            !root.separator
            && root.modelData.enabled

        hoverEnabled: true

        cursorShape:
            enabled
                ? Qt.PointingHandCursor
                : Qt.ArrowCursor

        onClicked: {
            const entry = root.modelData

            if (entry.hasChildren) {
                root.enterSubmenu(entry)
                return
            }

            root.actionRequested(entry)
        }
    }
}
