# lsblk-mount.yazi

A mount manager for [Yazi](https://github.com/sxyazi/yazi), providing disk mount, unmount, and eject
functionality for removable drives — a fork of the official
[yazi-rs/plugins:mount](https://github.com/yazi-rs/plugins/tree/main/mount.yazi) plugin, rewritten
around `lsblk`'s JSON tree output instead of regex-parsed device names.

## Why a fork?

The upstream plugin splits device names like `/dev/sda1` with a table of regex patterns to figure out
which partitions belong to which disk. That works, but it's fragile on non-standard device naming
(LVM, some NVMe/eMMC layouts) and doesn't expose anything beyond the raw device path.

This fork asks `lsblk` for a structured device tree instead (`lsblk -J -o NAME,PATH,LABEL,FSTYPE,MOUNTPOINT,SIZE,TYPE`)
and walks it recursively, so parent disks and their partitions nest correctly regardless of naming
scheme.

### What's different from upstream

- **Device discovery**: `lsblk -J` tree parsing instead of regex splitting on `/dev/*` names.
- **Mountpoint column**: the table shows where each partition is currently mounted (if at all),
  highlighted so mounted partitions are visible at a glance.
- **Error feedback**: mount/unmount/eject failures now show a notification instead of failing
  silently — including a specific hint when the failure looks like a missing Polkit authentication
  agent, which is a common silent-failure cause on minimal window manager setups (Hyprland, sway,
  etc. without a full desktop environment).
- **Safer eject**: eject first unmounts, then powers off the device, instead of a single
  power-off call.
- Linux-only for now (the `lsblk`/`udisksctl` dependency is Linux-specific; upstream's macOS
  `diskutil` path was not ported).

## Requirements

- Linux with [`udisksctl`](https://github.com/storaged-project/udisks) and `lsblk`, both provided by
  [`util-linux`](https://github.com/util-linux/util-linux) — the same requirements as upstream.
- A running Polkit authentication agent (most desktop environments ship one; minimal WM setups may
  need to start one manually, e.g. `polkit-gnome-authentication-agent-1` or `lxpolkit`).

## Installation

```sh
# Yazi package manager
ya pkg add PHONE1X/lsblk-mount.yazi

# or with git
git clone https://github.com/PHONE1X/lsblk-mount.yazi.git ~/.config/yazi/plugins/lsblk-mount.yazi
```

> Only install one of this plugin or the upstream `mount.yazi` — they both register as `plugin mount`
> style entries and will conflict if both are added under the same name.

Yazi refers to a plugin by its **folder name** under `plugins/`, not the repo name. If you're
migrating from upstream `mount.yazi` and want to keep your existing `plugin mount` keybind
unchanged, clone into a folder called `mount.yazi` instead:

```sh
git clone https://github.com/PHONE1X/lsblk-mount.yazi.git ~/.config/yazi/plugins/mount.yazi
```

`ya pkg add` always uses the upstream repo name for the folder, so use `git clone` with a custom
destination if you want a different local folder name.

## Usage

Add this to your `~/.config/yazi/keymap.toml`:

```toml
[[mgr.prepend_keymap]]
on  = "M"
run = "plugin lsblk-mount"
desc = "Open the drive mount manager"
```

Inside the plugin:

| Key         | Action                  |
| ----------- | ------------------------ |
| `j` / `↓`   | Move down                |
| `k` / `↑`   | Move up                  |
| `l` / `→` / `Enter` | Enter the mount point (if mounted) |
| `m`         | Mount the selected partition |
| `u`         | Unmount the selected partition |
| `e`         | Eject the disk (unmount, then power off) |
| `q` / `Esc` | Close                    |

## Credits

Based on [yazi-rs/plugins:mount](https://github.com/yazi-rs/plugins/tree/main/mount.yazi),
MIT-licensed by the Yazi project. See [LICENSE](./LICENSE).
