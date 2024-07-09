#!/bin/sh

if [ "$(pidof waybar)" = "" ]; then
    waybar
else
    killall waybar
fi

