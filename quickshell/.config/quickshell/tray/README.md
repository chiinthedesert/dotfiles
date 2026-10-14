# Quickshell tray

This archive is intentionally ROOTLESS: `shell.qml`, `Theme.qml`, `components/`,
`popups/`, and `services/` are at the top level.

Install into the existing named config directory:

```fish
rm -rf ~/.config/quickshell/tray
mkdir -p ~/.config/quickshell/tray
unzip quickshell-tray-v5.zip -d ~/.config/quickshell/tray
```

Expected layout:

```text
~/.config/quickshell/tray/
├── shell.qml
├── Theme.qml
├── components/
├── popups/
└── services/
```

Start/test:

```fish
qs -c tray
qs -c tray ipc call tray toggle
```

v6 fix:
- WifiService.qml explicitly imports QtQml because Connections is a QtQml type.
- No layout or behavior changes from v5.

v7 changes:
- Battery details prefer the physical UPower laptop battery instead of the aggregate DisplayDevice.
- Remaining time is derived from energy/rate when UPower does not report a time estimate.
- Rate is derived from energy/time when UPower does not report a rate.
- Wi-Fi sidebar glyph now renders inside a fixed centered content box.
- Wi-Fi network rows use a wider glyph box plus an explicit gap before the SSID.

v8 changes:
- Reverted StatusButton glyph/text layout to the v6 approach that centered correctly.
- Removed the v7 fixed 24px text wrapper; Wi-Fi and battery Text items now keep implicit size and are centered directly.
- Kept v7 battery-service improvements and Wi-Fi popup spacing changes.

v9 changes:
- Restored the thin separator between application tray items and built-in status items.
- Added a compact 24-hour clock at the bottom of the sidebar as HH / mm on two lines.
- Battery and clock text in the sidebar are bold.
- Popup/menu typography remains normal weight.
- Wi-Fi glyph stays normal weight so its icon shape is not altered.

v10 changes:
- Moved the clock to the top of the sidebar.
- Clock is now its own section with a separator directly below it.
- Application tray remains a separate middle section.
- Wi-Fi and battery remain together in the system-status section.

v11 changes:
- Clock is no longer constrained to the normal 30x30 status-button slot.
- Clock section height is 44px and clock text is 15px bold.
- Wi-Fi, tray icons, and battery keep their existing 30px item slots.
