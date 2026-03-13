#!/bin/bash

# Power menu using rofi with arrow key navigation

options="⏻  Shutdown\n  Reboot\n󰗼  Logout\n󰒲  Suspend\n󰌾  Lock"

chosen=$(echo -e "$options" | rofi -dmenu -theme ~/.config/rofi/power-menu.rasi)

case "$chosen" in
    *"Shutdown")
        systemctl poweroff
        ;;
    *"Reboot")
        systemctl reboot
        ;;
    *"Logout")
        hyprctl dispatch exit
        ;;
    *"Suspend")
        systemctl suspend
        ;;
    *"Lock")
        hyprlock
        ;;
esac
