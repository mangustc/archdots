#!/bin/sh
if [ "$EUID" -ne 0 ]; then
    echo "This script should be run as root"
    exit
fi

cd ./boot
sh ./install.sh
cd ..

cd ./system
sh ./install.sh
cd ..
