#!/bin/sh

if [ "$(pidof waybar)" = "" ]; then
    waybar
else
    pkill -f waybar
fi

