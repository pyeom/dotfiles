#!/bin/bash

# Usage: ./volume-control.sh [output|input|both] [up|down|mute|toggle-mute-both]

# Check if pactl is installed
if ! command -v pactl &> /dev/null; then
    echo "pactl (PulseAudio) is not installed. Please install it first."
    exit 1
fi

# Default sink (output) and source (input)
SINK=$(pactl get-default-sink)
SOURCE=$(pactl get-default-source)

# Function to change output volume
output_volume() {
    case $1 in
        up)
            pactl set-sink-volume "$SINK" +5%
            ;;
        down)
            pactl set-sink-volume "$SINK" -5%
            ;;
        toggle)
            pactl set-sink-mute "$SINK" toggle
            ;;
        *)
            echo "Invalid action for output volume. Use 'up', 'down', or 'mute'."
            exit 1
            ;;
    esac
}

# Function to change input volume
input_volume() {
    case $1 in
        up)
            pactl set-source-volume "$SOURCE" +5%
            ;;
        down)
            pactl set-source-volume "$SOURCE" -5%
            ;;
        toggle)
            pactl set-source-mute "$SOURCE" toggle
            ;;
        *)
            echo "Invalid action for input volume. Use 'up', 'down', or 'mute'."
            exit 1
            ;;
    esac
}

# Function to toggle mute both input and output
toggle_mute_both() {
    pactl set-sink-mute "$SINK" toggle
    pactl set-source-mute "$SOURCE" toggle
}

# Main script logic
if [[ $# -lt 1 ]]; then
    echo "Usage: $0 [output|input|both] [up|down|mute|toggle-mute-both]"
    exit 1
fi

case $1 in
    output)
        if [[ $# -ne 2 ]]; then
            echo "Usage: $0 output [up|down|mute]"
            exit 1
        fi
        output_volume "$2"
        ;;
    input)
        if [[ $# -ne 2 ]]; then
            echo "Usage: $0 input [up|down|mute]"
            exit 1
        fi
        input_volume "$2"
        ;;
    both)
        if [[ $# -ne 2 ]]; then
            echo "Usage: $0 both [toggle-mute-both]"
            exit 1
        fi
        if [[ "$2" == "toggle-mute-both" ]]; then
            toggle_mute_both
        else
            echo "Invalid action for 'both'. Use 'toggle-mute-both'."
            exit 1
        fi
        ;;
    *)
        echo "Invalid option. Use 'output', 'input', or 'both'."
        exit 1
        ;;
esac
