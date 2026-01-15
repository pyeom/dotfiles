#!/usr/bin/env bash

# Enhanced Rofi Launcher with Internet Search Fallback

# Run rofi and capture the input
result=$(rofi -show drun -run-command 'echo {cmd}')

# If rofi returns empty (no match found), the user might want to search
if [ -z "$result" ]; then
    exit 0
fi

# Try to run the command
if ! command -v "$result" &> /dev/null && ! [ -x "$result" ]; then
    # Command doesn't exist, offer to search online
    search_choice=$(echo -e "🔍 Search Google\n🦆 Search DuckDuckGo\n❌ Cancel" | rofi -dmenu -p "No app found. Search online?")

    case $search_choice in
        "🔍 Search Google")
            xdg-open "https://www.google.com/search?q=$(echo "$result" | sed 's/ /+/g')"
            ;;
        "🦆 Search DuckDuckGo")
            xdg-open "https://duckduckgo.com/?q=$(echo "$result" | sed 's/ /+/g')"
            ;;
        *)
            exit 0
            ;;
    esac
else
    # Execute the command
    eval "$result"
fi
