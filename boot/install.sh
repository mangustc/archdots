#!/bin/sh
if [ "$EUID" -ne 0 ]; then
    echo "This script should be run as root"
    exit
fi

pacman -S --needed - <./pkglist

if [ ! -d /boot/loader ]; then
    mkdir -p /boot/loader
elif [ -d /boot/loader/entries ]; then
    rm -vrf /boot/loader/entries
fi

cp -vr ./entries /boot/loader/entries
cp -vr ./loader.conf /boot/loader/loader.conf

bootctl install
bootctl update
