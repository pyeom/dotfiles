#!/usr/bin/env bash

# Reload all components for Dynamic Island effect

echo "🔄 Reloading Dynamic Island components..."

# Reload Hyprland config (for animations)
echo "  → Reloading Hyprland animations..."
hyprctl reload

# Reload Waybar
echo "  → Reloading Waybar..."
pkill waybar
sleep 0.3
waybar &

echo "✅ Dynamic Island ready!"
echo ""
echo "Try clicking the clock in Waybar to see the effect!"
