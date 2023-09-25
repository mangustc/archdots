#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - <./pkglist

sudo cp -vr ./powertop.service /etc/systemd/system/powertop.service
sudo systemctl enable powertop.service
