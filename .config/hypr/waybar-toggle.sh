#!/bin/sh

SOURCE_FOLDER=~/.config/hypr
STATE_FILE=$SOURCE_FOLDER/.wbstate

# Sanity checks
if ! [[ -d "$SOURCE_FOLDER" ]]; then
    echo "Source folder doesn't exist."
    exit 1
fi

if [ -f "$STATE_FILE" ]; then
    if [ $(cat $STATE_FILE) = "1" ]; then
        killall waybar
        echo "0" > $STATE_FILE
    else
        waybar &
        echo "1" > $STATE_FILE
    fi
else
    killall waybar
    echo "0" > $STATE_FILE
fi
