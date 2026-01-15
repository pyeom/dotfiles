#!/usr/bin/env bash

# Power Menu Script for Rofi

# Options with icons
shutdown="⏻  Power Off"
reboot="  Restart"
suspend="⏾  Suspend"
logout="  Logout"
lock="  Lock"

# Display menu with dynamic island submenu theme
chosen=$(echo -e "$shutdown\n$reboot\n$suspend\n$logout\n$lock" | rofi -dmenu -i -p "Power Menu" -theme ~/.config/rofi/dynamic-island-submenu.rasi)

# Execute action based on selection
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        # Adjust based on your window manager/desktop environment
        # For Hyprland:
        hyprctl dispatch exit
        # For other WMs, uncomment the appropriate line:
        # pkill -KILL -u "$USER"  # Generic logout
        ;;
    $lock)
        # Adjust based on your lock screen
        swaylock  # or hyprlock, or i3lock, etc.
        ;;
esac
