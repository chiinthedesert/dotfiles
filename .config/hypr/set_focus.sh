#!/bin/bash
sleep 1 # Give Hyprland a moment to initialize

# Find a window on workspace 1 (or your preferred workspace)
WINDOW_ID=$(hyprctl clients -j | jq -r '.[] | select(.workspace.id == 1) | .id')

if [ -n "$WINDOW_ID" ]; then
    hyprctl dispatch focuswindow $WINDOW_ID
else
    # Optionally, focus on a specific monitor if no window is found
    MONITOR_NAME=$(hyprctl monitors -j | jq -r '.[] | select(.focused == false) | .name')
    if [ -n "$MONITOR_NAME" ]; then
        hyprctl dispatch focusmonitor "$MONITOR_NAME"
    fi
fi
