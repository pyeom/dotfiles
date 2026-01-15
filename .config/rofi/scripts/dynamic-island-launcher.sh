#!/usr/bin/env bash

# Dynamic Island Launcher
# Creates an animated expansion effect from Waybar clock

# Check if rofi is already running - toggle behavior
if pgrep -x rofi > /dev/null; then
    pkill rofi
    exit 0
fi

# Launch rofi with the integrated theme
# Using Hyprland's layer animations for smooth appearance
rofi -show drun -theme ~/.config/rofi/dynamic-island-integrated.rasi &

# Get rofi PID
ROFI_PID=$!
