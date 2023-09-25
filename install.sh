#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

sh ./install-user.sh
sudo sh ./install-root.sh
