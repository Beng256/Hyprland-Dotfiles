#!/bin/bash

pkill waybar
waybar &
pkill swaync
swaync &
hyprctl reload



