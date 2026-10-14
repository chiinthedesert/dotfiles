import QtQuick

Text {
    required property var theme

    textFormat: Text.PlainText
    color: theme.fg

    font.family: theme.fontFamily
    font.pixelSize: theme.fontSize
    font.weight: Font.Normal
    font.hintingPreference: Font.PreferFullHinting

    renderType: Text.NativeRendering
    verticalAlignment: Text.AlignVCenter
}
