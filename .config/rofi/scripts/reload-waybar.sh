#!/usr/bin/env bash

# Reload Waybar to apply Dynamic Island styling

pkill waybar
sleep 0.2
waybar &

echo "Waybar reloaded with Dynamic Island theme!"
