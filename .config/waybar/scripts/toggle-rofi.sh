#!/usr/bin/env bash

# Enhanced toggle script for Rofi with visual feedback

# Check if rofi is running
if pgrep -x rofi > /dev/null; then
    # Close rofi
    pkill rofi
else
    # Open rofi
    ~/.config/rofi/scripts/dynamic-island-launcher.sh
fi
