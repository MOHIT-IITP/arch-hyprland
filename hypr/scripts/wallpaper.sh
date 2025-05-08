#!/bin/bash

# Default wallpaper location
WALLPAPER_DIR="$HOME/pix/wall/"
WALLPAPER=""

# Get random wallpaper if none specified
if [ -z "$1" ]; then
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)
else
    WALLPAPER="$1"
fi

echo "Setting wallpaper: $WALLPAPER"

swww img "$WALLPAPER" --transition-type center --transition-pos 0.9,0.1 --transition-fps="100" --transition-step="255" 

matugen image "$WALLPAPER"

# Reload waybar if it's running
if pgrep waybar > /dev/null; then
    killall -SIGUSR2 waybar
fi

# Optional: Notify user
notify-send "Theme Updated" "Applied new theme based on wallpaper"
