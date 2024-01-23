#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

paru -S --needed - <./pkglist

WAYBAR_DIR=~/.config/waybar

if [ ! -d $WAYBAR_DIR ]; then
    mkdir -p $WAYBAR_DIR
fi

echo ""
cp -vr ./config $WAYBAR_DIR
cp -vr ./style.css $WAYBAR_DIR
