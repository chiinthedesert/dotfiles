import QtQuick
import Quickshell
import "../components"

PopupWindow {
    id: root

    required property var theme

    property var anchorItem: null
    property var networkModel: null

    property bool hardwareEnabled: false
    property bool wifiEnabled: false
    property bool needsPassword: false
    property string errorText: ""

    signal toggleWifi()
    signal connectRequested(var network)
    signal passwordSubmitted(string password)
    signal hidden()

    function focusPassword(): void {
        Qt.callLater(() => {
            passwordInput.forceActiveFocus()
        })
    }

    function clearPassword(): void {
        passwordInput.text = ""
    }

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
        if (visible) {
            networkList.positionViewAtBeginning()
        } else {
            clearPassword()
            root.hidden()
        }
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

            Item {
                width: content.width
                height: root.theme.rowHeight

                Rectangle {
                    anchors.fill: parent

                    color:
                        wifiToggleMouse.containsMouse
                            ? root.theme.hover
                            : "transparent"
                }

                Row {
                    anchors {
                        fill: parent
                        leftMargin: root.theme.rowPaddingX
                        rightMargin: root.theme.rowPaddingX
                    }

                    MenuText {
                        theme: root.theme
                        width: parent.width - 44
                        height: parent.height
                        text: "Wi-Fi"
                    }

                    MenuText {
                        theme: root.theme
                        width: 44
                        height: parent.height

                        text:
                            root.wifiEnabled
                                ? "on"
                                : "off"

                        color:
                            root.wifiEnabled
                                ? root.theme.green
                                : root.theme.muted

                        horizontalAlignment: Text.AlignRight
                    }
                }

                MouseArea {
                    id: wifiToggleMouse

                    anchors.fill: parent
                    enabled: root.hardwareEnabled
                    hoverEnabled: true

                    cursorShape:
                        enabled
                            ? Qt.PointingHandCursor
                            : Qt.ArrowCursor

                    onClicked:
                        root.toggleWifi()
                }
            }

            MenuSeparator {
                theme: root.theme
                width: content.width
                height: root.theme.separatorHeight
            }

            MenuText {
                visible: !root.hardwareEnabled
                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                text: "Wi-Fi hardware disabled"
                color: root.theme.muted
                horizontalAlignment: Text.AlignHCenter
            }

            MenuText {
                visible:
                    root.wifiEnabled
                    && root.networkModel
                    && root.networkModel.values.length === 0

                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                text: "Scanning…"
                color: root.theme.muted
                horizontalAlignment: Text.AlignHCenter
            }

            ListView {
                id: networkList

                visible:
                    root.wifiEnabled
                    && root.networkModel !== null

                width: content.width

                height:
                    visible
                        ? Math.min(
                            contentHeight,
                            root.theme.popupListMaxHeight
                          )
                        : 0

                clip: true
                boundsBehavior: Flickable.StopAtBounds
                interactive: contentHeight > height

                model: root.networkModel

                delegate: WifiNetworkRow {
                    width: networkList.width
                    theme: root.theme

                    onConnectRequested: network =>
                        root.connectRequested(network)
                }
            }

            MenuSeparator {
                visible: root.needsPassword
                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.separatorHeight
                        : 0
            }

            Row {
                visible: root.needsPassword
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                spacing: root.theme.rowGap

                Rectangle {
                    width: parent.width - 48
                    height: parent.height

                    color: root.theme.bg
                    border.width: 1
                    border.color: root.theme.border

                    Text {
                        anchors {
                            left: parent.left
                            leftMargin: 6
                            verticalCenter: parent.verticalCenter
                        }

                        visible: passwordInput.text.length === 0
                        text: "password"
                        color: root.theme.muted

                        font.family: root.theme.fontFamily
                        font.pixelSize: root.theme.fontSize
                    }

                    TextInput {
                        id: passwordInput

                        anchors {
                            fill: parent
                            leftMargin: 6
                            rightMargin: 6
                        }

                        color: root.theme.fg
                        selectionColor: root.theme.pink
                        selectedTextColor: root.theme.bg

                        font.family: root.theme.fontFamily
                        font.pixelSize: root.theme.fontSize

                        renderType: Text.NativeRendering
                        echoMode: TextInput.Password
                        verticalAlignment: TextInput.AlignVCenter

                        onAccepted:
                            root.passwordSubmitted(text)
                    }
                }

                Rectangle {
                    width: 44
                    height: parent.height

                    color:
                        joinMouse.containsMouse
                            ? root.theme.hover
                            : "transparent"

                    MenuText {
                        theme: root.theme
                        anchors.centerIn: parent
                        text: "join"
                        color: root.theme.green
                    }

                    MouseArea {
                        id: joinMouse

                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onClicked:
                            root.passwordSubmitted(passwordInput.text)
                    }
                }
            }

            MenuText {
                visible: root.errorText !== ""
                theme: root.theme
                width: content.width

                height:
                    visible
                        ? root.theme.rowHeight
                        : 0

                text: root.errorText
                color: root.theme.red
                elide: Text.ElideRight
            }
        }
    }
}
