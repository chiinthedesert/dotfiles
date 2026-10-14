import Quickshell
import Quickshell.Services.UPower

Scope {
    id: root

    // Prefer the real laptop battery for detailed statistics. UPower's
    // DisplayDevice is an aggregate and can omit rate/time information.
    readonly property var physicalDevice: {
        const devices = UPower.devices.values

        for (let i = 0; i < devices.length; ++i) {
            const candidate = devices[i]

            if (
                candidate.ready
                && candidate.isLaptopBattery
                && candidate.isPresent
            ) {
                return candidate
            }
        }

        return null
    }

    readonly property var displayDevice: UPower.displayDevice

    readonly property var device:
        physicalDevice !== null
            ? physicalDevice
            : displayDevice

    readonly property bool available:
        device !== null
        && device.ready
        && device.isLaptopBattery
        && device.isPresent

    // Quickshell normalizes UPower Percentage from 0..100 to 0..1.
    readonly property real fraction:
        available ? device.percentage : 0

    readonly property int percentage:
        available
            ? Math.round(fraction * 100)
            : -1

    readonly property bool charging:
        available
        && device.state === UPowerDeviceState.Charging

    readonly property bool full:
        available
        && device.state === UPowerDeviceState.FullyCharged

    readonly property string statusText:
        available
            ? UPowerDeviceState.toString(device.state)
            : "—"

    readonly property real energyRemaining: {
        if (!available)
            return 0

        if (charging) {
            return Math.max(
                0,
                device.energyCapacity - device.energy
            )
        }

        return Math.max(0, device.energy)
    }

    readonly property real reportedTime: {
        if (!available || full)
            return 0

        return charging
            ? device.timeToFull
            : device.timeToEmpty
    }

    readonly property real reportedRate:
        available
            ? Math.abs(device.changeRate)
            : 0

    // Some UPower backends expose only rate or only time. Derive the
    // missing value when energy statistics are available.
    readonly property real effectiveRate: {
        if (reportedRate > 0.01)
            return reportedRate

        if (reportedTime > 0 && energyRemaining > 0)
            return energyRemaining / (reportedTime / 3600)

        return 0
    }

    readonly property real effectiveTime: {
        if (reportedTime > 0)
            return reportedTime

        if (effectiveRate > 0.01 && energyRemaining > 0)
            return energyRemaining / effectiveRate * 3600

        return 0
    }

    readonly property string timeLabel:
        charging ? "To full" : "Remaining"

    readonly property string timeText:
        full ? "—" : formatDuration(effectiveTime)

    readonly property string rateText:
        effectiveRate > 0.01
            ? `${effectiveRate.toFixed(1)} W`
            : "—"

    readonly property bool healthVisible:
        available && device.healthSupported

    // UPower Capacity is already exposed as 0..100.
    readonly property string healthText:
        healthVisible
            ? `${Math.round(device.healthPercentage)}%`
            : "—"

    function formatDuration(seconds): string {
        if (!seconds || seconds <= 0)
            return "—"

        const hours = Math.floor(seconds / 3600)
        const minutes = Math.floor((seconds % 3600) / 60)

        return hours > 0
            ? `${hours}h ${minutes}m`
            : `${minutes}m`
    }
}
