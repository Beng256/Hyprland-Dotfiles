#!/bin/bash

SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOT_DIR"

FILENAME="$SCREENSHOT_DIR/screenshot_$(date +%Y%m%d_%H%M%S).png"

grim -g "$(slurp)" "$FILENAME"

if [ $? -eq 0 ]; then
    notify-send "Screenshot" "Saved: $(basename $FILENAME)" -i "$FILENAME" -t 3000
    
    echo "Screenshot saved: $FILENAME"
else
    notify-send "Screenshot Error" "Nothing to do" -u critical
    exit 1
fi
