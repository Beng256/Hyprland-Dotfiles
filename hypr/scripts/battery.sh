#!/bin/bash

STATE_FILE="/tmp/battery_notif_state"

BATTERY_PATH="/sys/class/power_supply/BAT0"
CAPACITY=$(cat "$BATTERY_PATH/capacity")
STATUS=$(cat "$BATTERY_PATH/status")

if [ "$CAPACITY" -eq 100 ] && [ "$STATUS" = "Charging" ]; then
    if [ ! -f "$STATE_FILE" ]; then
        notify-send -u low "Battery Full!" "Battery capacity ${CAPACITY}%."
        
        touch "$STATE_FILE"
    fi
else
    [ -f "$STATE_FILE" ] && rm "$STATE_FILE"
fi
