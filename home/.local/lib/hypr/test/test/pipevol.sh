#!/bin/sh

MAX_VOLUME=150

VALUE=$(echo "$1" | sed 's/%.*//')

VOLUME=$(echo "$(pactl get-sink-volume 0)" | head -1 | sed 's/%.*//; s/.*\/ //')

if (($(($VOLUME+$VALUE)) > $MAX_VOLUME)); then
    exit 0
fi


pactl set-sink-volume 0 "$(($VOLUME+$VALUE))%"
