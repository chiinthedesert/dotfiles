import QtQuick

QtObject {
    // Forestbones
    readonly property color bg: "#2c343a"
    readonly property color surface: "#3b464e"
    readonly property color hover: "#4e5b65"
    readonly property color pressed: "#615b51"
    readonly property color border: "#45525c"

    readonly property color fg: "#e7dcc4"
    readonly property color muted: "#b2a790"

    readonly property color pink: "#d69ab7"
    readonly property color green: "#a9c181"
    readonly property color yellow: "#ddbd7f"
    readonly property color red: "#e67c7f"

    // Typography
    readonly property string fontFamily: "JetBrainsMono Nerd Font"
    readonly property int fontSize: 13

    // Common
    readonly property int borderWidth: 2
    readonly property real disabledOpacity: 0.45

    // Sidebar geometry: every item gets exactly the same slot.
    readonly property int sidebarWidth: 42
    readonly property int sidebarPaddingY: 8
    readonly property int sidebarGap: 4
    readonly property int sidebarItemSize: 30

    // Content sizes are independent from slot geometry.
    readonly property int trayIconSize: 22
    readonly property int wifiIconSize: 18
    readonly property int batteryFontSize: 13
    readonly property int clockFontSize: 15
    readonly property int clockHeight: 44

    // Popups
    readonly property int popupWidth: 220
    readonly property int popupPadding: 4
    readonly property int popupGap: 6
    readonly property int popupListMaxHeight: 300

    // Rows
    readonly property int rowHeight: 30
    readonly property int rowPaddingX: 3
    readonly property int rowGap: 4
    readonly property int glyphWidth: 14
    readonly property int wifiGlyphWidth: 20
    readonly property int wifiNameGap: 7
    readonly property int infoWidth: 38

    // Separators
    readonly property int separatorHeight: 7
    readonly property int separatorInset: 4
}
