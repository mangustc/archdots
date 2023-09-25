#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

cd ./fish
sh ./install.sh
cd ..

cd ./greetd
sh ./install.sh
cd ..

cd ./gtk
sh ./install.sh
cd ..

cd ./hyprland
sh ./install.sh
cd ..

cd ./kitty
sh ./install.sh
cd ..

cd ./neovim
sh ./install.sh
cd ..

cd ./pipewire
sh ./install.sh
cd ..

cd ./power
sh ./install.sh
cd ..

cd ./waybar
sh ./install.sh
cd ..

cd ./misc
sh ./install.sh
cd ..
