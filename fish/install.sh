#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

paru -S --needed - < ./pkglist

FISH_DIR=~/.config/fish

if [ ! -d $FISH_DIR ]; then
    mkdir -p $FISH_DIR
fi

echo ""
doas chsh -s /bin/fish $(whoami)

echo ""
chmod +x ./pfetch-kitties
doas cp -vr ./pfetch-kitties /usr/local/bin

echo ""
cp -vr ./config.fish $FISH_DIR
