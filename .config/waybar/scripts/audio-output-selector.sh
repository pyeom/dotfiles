#!/usr/bin/env bash

# Get list of output sinks
sinks=$(pactl list short sinks | awk '{print $2}')

# Get current default sink
current_sink=$(pactl get-default-sink)

# Create menu options with current selection marked
menu=""
while IFS= read -r sink; do
    if [ "$sink" = "$current_sink" ]; then
        menu+="* $sink\n"
    else
        menu+="  $sink\n"
    fi
done <<< "$sinks"

# Show rofi menu
selected=$(echo -e "$menu" | rofi -dmenu -i -p "Audio Output" | sed 's/^[* ] //')

# Set the selected sink as default
if [ -n "$selected" ]; then
    pactl set-default-sink "$selected"

    # Move all currently playing streams to the new sink
    pactl list short sink-inputs | while read -r stream; do
        stream_id=$(echo "$stream" | awk '{print $1}')
        pactl move-sink-input "$stream_id" "$selected" 2>/dev/null
    done
fi
