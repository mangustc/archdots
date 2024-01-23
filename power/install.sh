#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

paru -S --needed - <./pkglist

doas cp -vr ./powertop.service /etc/systemd/system/powertop.service
doas systemctl enable powertop.service
