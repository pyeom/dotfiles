#!/usr/bin/env bash

# Get list of input sources
sources=$(pactl list short sources | grep -v monitor | awk '{print $2}')

# Get current default source
current_source=$(pactl get-default-source)

# Create menu options with current selection marked
menu=""
while IFS= read -r source; do
    if [ "$source" = "$current_source" ]; then
        menu+="* $source\n"
    else
        menu+="  $source\n"
    fi
done <<< "$sources"

# Show rofi menu
selected=$(echo -e "$menu" | rofi -dmenu -i -p "Audio Input" | sed 's/^[* ] //')

# Set the selected source as default
if [ -n "$selected" ]; then
    pactl set-default-source "$selected"

    # Move all currently recording streams to the new source
    pactl list short source-outputs | while read -r stream; do
        stream_id=$(echo "$stream" | awk '{print $1}')
        pactl move-source-output "$stream_id" "$selected" 2>/dev/null
    done
fi
