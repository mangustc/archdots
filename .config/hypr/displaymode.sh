#!/bin/sh

if [ "$1" = "laptop" ]; then
    hyprctl reload
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl notify 2 2000 "rgb(fab387)" "Monitor layout set to: Laptop Display"
elif [ "$1" = "pc-display" ]; then
    hyprctl reload
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl notify 2 2000 "rgb(fab387)" "Monitor layout set to: PC Display"
fi
