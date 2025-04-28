#!/bin/bash

# Path to wallpapers directory
WALLPAPER_DIR=~/Pictures/wallpapers

# Get a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.jpeg" -o -name "*.png" \) | shuf -n 1)

# Set the wallpaper using hyprpaper
if [ -n "$WALLPAPER" ]; then
    # Create or update hyprpaper.conf
    echo "preload = $WALLPAPER" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = HDMI-A-1,$WALLPAPER" >> ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = DP-1,$WALLPAPER" >> ~/.config/hypr/hyprpaper.conf
    
    # Restart hyprpaper to apply changes
    killall hyprpaper 2>/dev/null
    hyprpaper &
fi
