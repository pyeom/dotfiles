#!/bin/bash

WALLPAPER_DIR="~/.config/wallpapers/"
SPECIFIC_IMAGE=($(find ~/.config/wallpapers/ -type f \( -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.gif" \)))
RANDOM_IMAGE=${SPECIFIC_IMAGE[RANDOM % ${#SPECIFIC_IMAGE[@]}]}
waypaper --wallpaper "$RANDOM_IMAGE"
wal -i "$RANDOM_IMAGE"
swaync-client --reload-css
cat ~/.cache/wal/colors-kitty.conf > ~/.config/kitty/current-theme.conf
