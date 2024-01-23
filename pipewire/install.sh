#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

paru -S --needed - <./pkglist

USER=$(whoami)
if [ "$(groups $USER | grep audio)" == "" ]; then
    sudo gpasswd -a $USER audio
fi
