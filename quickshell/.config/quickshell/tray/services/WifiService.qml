import QtQml
import Quickshell
import Quickshell.Networking

Scope {
    id: root

    property bool popupOpen: false
    property var pendingNetwork: null
    property var scannedDevice: null

    property bool needsPassword: false
    property string errorText: ""

    signal passwordRequested()
    signal connectedSuccessfully()

    readonly property var device: {
        const devices = Networking.devices.values

        for (let i = 0; i < devices.length; ++i) {
            if (devices[i].type === DeviceType.Wifi)
                return devices[i]
        }

        return null
    }

    readonly property bool available:
        device !== null

    readonly property bool enabled:
        Networking.wifiEnabled

    readonly property bool hardwareEnabled:
        Networking.wifiHardwareEnabled

    readonly property var connectedNetwork: {
        if (!device)
            return null

        const networks = device.networks.values

        for (let i = 0; i < networks.length; ++i) {
            if (networks[i].connected)
                return networks[i]
        }

        return null
    }

    readonly property bool connected:
        connectedNetwork !== null

    readonly property string glyph: {
        if (!hardwareEnabled || !enabled)
            return "󰤭"

        if (!connectedNetwork)
            return "󰤯"

        return signalGlyph(connectedNetwork.signalStrength)
    }

    readonly property var networks:
        networkModel

    ScriptModel {
        id: networkModel

        values: {
            if (!root.device || !root.enabled)
                return []

            return [...root.device.networks.values].sort((a, b) => {
                if (a.connected !== b.connected)
                    return b.connected - a.connected

                return b.signalStrength - a.signalStrength
            })
        }
    }

    Connections {
        target: Networking

        function onWifiEnabledChanged() {
            root.syncScanner()
        }

        function onWifiHardwareEnabledChanged() {
            root.syncScanner()
        }
    }

    Connections {
        target: root.pendingNetwork

        function onConnectionFailed(reason) {
            if (
                reason === ConnectionFailReason.NoSecrets
                && root.pendingNetwork
                && root.isPskNetwork(root.pendingNetwork)
            ) {
                root.needsPassword = true
                root.errorText = ""
                root.passwordRequested()
                return
            }

            root.errorText = ConnectionFailReason.toString(reason)
        }

        function onStateChanged() {
            if (root.pendingNetwork && root.pendingNetwork.connected) {
                root.connectedSuccessfully()
            }
        }
    }

    onDeviceChanged:
        syncScanner()

    function signalGlyph(strength): string {
        if (strength >= 0.75)
            return "󰤨"

        if (strength >= 0.5)
            return "󰤥"

        if (strength >= 0.25)
            return "󰤢"

        return "󰤟"
    }

    function isPskNetwork(network): bool {
        return (
            network.security === WifiSecurityType.WpaPsk
            || network.security === WifiSecurityType.Wpa2Psk
            || network.security === WifiSecurityType.Sae
        )
    }

    function syncScanner(): void {
        const nextDevice = root.device
        const shouldScan =
            root.popupOpen
            && root.enabled
            && nextDevice !== null

        if (
            root.scannedDevice
            && root.scannedDevice !== nextDevice
        ) {
            root.scannedDevice.scannerEnabled = false
        }

        if (nextDevice)
            nextDevice.scannerEnabled = shouldScan

        root.scannedDevice = shouldScan
            ? nextDevice
            : null
    }

    function beginPopupSession(): void {
        root.popupOpen = true
        root.pendingNetwork = null
        root.needsPassword = false
        root.errorText = ""
        root.syncScanner()
    }

    function endPopupSession(): void {
        root.popupOpen = false
        root.syncScanner()

        root.pendingNetwork = null
        root.needsPassword = false
        root.errorText = ""
    }

    function toggleEnabled(): void {
        Networking.wifiEnabled = !Networking.wifiEnabled
    }

    function connectNetwork(network): void {
        if (!network)
            return

        if (network.connected) {
            root.connectedSuccessfully()
            return
        }

        root.pendingNetwork = network
        root.needsPassword = false
        root.errorText = ""

        // Try stored NetworkManager settings first.
        network.connect()
    }

    function submitPassword(password): void {
        if (!root.pendingNetwork || !password)
            return

        root.errorText = ""
        root.needsPassword = false

        root.pendingNetwork.connectWithPsk(password)
    }
}
