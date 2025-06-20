#!/usr/bin/env bash

# Immediately kill any old Waybar instances
killall -q waybar

# A minimal pause to prevent race conditions before starting a new instance
sleep 0.2

# Check if "HDMI-A-1" exists and launch Waybar accordingly
if hyprctl monitors | grep -q "HDMI-A-1"; then
    waybar -c ~/.config/waybar/hyprland/config.jsonc -s ~/.config/waybar/hyprland/style.css &
else
    waybar -c ~/.config/waybar/hyprland/config-internal.jsonc -s ~/.config/waybar/hyprland/style-internal.css&
fi

