#!/bin/sh

SOURCE_DIR="$HOME/Pictures/Wallpaper"
TARGET_DIR="$HOME/.config/hypr/wallpaper"

# list file di SOURCE_DIR lalu pilih via rofi
FILE="$(find "$SOURCE_DIR" -maxdepth 1 -type f | sed "s|$SOURCE_DIR/||g" | rofi -dmenu -i -p "Pilih file")"
SELECTED="$SOURCE_DIR/$FILE"
# kalau user cancel
[ -z "$FILE" ] && exit 0


ln -sf "$SELECTED" "$TARGET_DIR/wp"
matugen image "$SELECTED"

killall hyprpaper
hyprpaper &

notify-send -e -u low "Wallpaper & Color" "Changed to $FILE"

