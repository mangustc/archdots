#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - < ./pkglist

KITTY_DIR=~/.config/kitty

if [ ! -d $KITTY_DIR ]; then
    mkdir -p $KITTY_DIR
fi

echo ""
cp -vrf ./kitty.conf $KITTY_DIR
