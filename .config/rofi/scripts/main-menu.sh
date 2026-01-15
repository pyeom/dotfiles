#!/usr/bin/env bash

# Main Rofi Menu with Sub-menus

# Define the main menu options
apps="  Applications"
power="  Power Menu"
search="🔍 Web Search"

# Show main menu with dynamic island submenu theme
chosen=$(echo -e "$apps\n$power\n$search" | rofi -dmenu -i -p "Menu" -theme ~/.config/rofi/dynamic-island-submenu.rasi)

# Execute based on selection
case $chosen in
    "$apps")
        rofi -show drun -theme ~/.config/rofi/dynamic-island-integrated.rasi
        ;;
    "$power")
        ~/.config/rofi/scripts/powermenu.sh
        ;;
    "$search")
        ~/.config/rofi/scripts/web-search.sh
        ;;
esac
