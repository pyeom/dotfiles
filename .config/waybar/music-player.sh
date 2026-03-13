#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
CONFIG_FILE="$CONFIG_DIR/music-player-config"
STYLE_FILE="$CONFIG_DIR/music-player-style.css"

# Check if music player is already running
if pgrep -f "waybar.*music-player-config" > /dev/null; then
    # If running, kill it
    pkill -f "waybar.*music-player-config"
else
    # If not running, start it
    waybar -c "$CONFIG_FILE" -s "$STYLE_FILE" &
fi
