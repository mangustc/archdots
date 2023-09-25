#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - < ./pkglist

echo ""
gsettings set org.gnome.desktop.interface gtk-theme Catppuccin-Mocha-Standard-Pink-Dark
gsettings set org.gnome.desktop.interface icon-theme Paper
