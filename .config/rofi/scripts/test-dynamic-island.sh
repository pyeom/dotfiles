#!/usr/bin/env bash

# Test script to preview all Dynamic Island themed menus

echo "Testing Dynamic Island Theme for Rofi"
echo "======================================"
echo ""
echo "Choose which menu to test:"
echo "1. Main Menu (with sub-menus)"
echo "2. Power Menu"
echo "3. Web Search"
echo "4. Application Launcher"
echo ""
read -p "Enter your choice (1-4): " choice

case $choice in
    1)
        echo "Launching Main Menu..."
        ~/.config/rofi/scripts/main-menu.sh
        ;;
    2)
        echo "Launching Power Menu..."
        ~/.config/rofi/scripts/powermenu.sh
        ;;
    3)
        echo "Launching Web Search..."
        ~/.config/rofi/scripts/web-search.sh
        ;;
    4)
        echo "Launching Application Launcher..."
        rofi -show drun -theme ~/.config/rofi/dynamic-island.rasi
        ;;
    *)
        echo "Invalid choice!"
        ;;
esac
