#!/bin/bash

# Then, check for the monitor and launch the correct one
if hyprctl monitors | grep -q "HDMI-A-1"; then
    waybar -c ~/.config/waybar/config-hdmi.jsonc &
else
    waybar -c ~/.config/waybar/config-internal.jsonc -s ~/.config/waybar/style-internal.css &
fi
