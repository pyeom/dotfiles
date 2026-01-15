#!/usr/bin/env bash

# Web Search Menu for Rofi
# This script allows searching the web when no app matches

# Get the query from rofi with dynamic island integrated theme
query=$(rofi -dmenu -p "Search" -theme ~/.config/rofi/dynamic-island-integrated.rasi)

# Exit if no query provided
if [ -z "$query" ]; then
    exit 0
fi

# Search options
google="🔍 Google: $query"
duckduckgo="🦆 DuckDuckGo: $query"
youtube="📺 YouTube: $query"
github="🐙 GitHub: $query"
wikipedia="📖 Wikipedia: $query"

# Show search engine options with dynamic island submenu theme
chosen=$(echo -e "$google\n$duckduckgo\n$youtube\n$github\n$wikipedia" | rofi -dmenu -i -p "Search with" -theme ~/.config/rofi/dynamic-island-submenu.rasi)

# Format query for URL (replace spaces with +)
formatted_query=$(echo "$query" | sed 's/ /+/g')

# Execute search based on selection
case $chosen in
    "$google")
        xdg-open "https://www.google.com/search?q=$formatted_query"
        ;;
    "$duckduckgo")
        xdg-open "https://duckduckgo.com/?q=$formatted_query"
        ;;
    "$youtube")
        xdg-open "https://www.youtube.com/results?search_query=$formatted_query"
        ;;
    "$github")
        xdg-open "https://github.com/search?q=$formatted_query"
        ;;
    "$wikipedia")
        xdg-open "https://en.wikipedia.org/wiki/Special:Search?search=$formatted_query"
        ;;
esac
