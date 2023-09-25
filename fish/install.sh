#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - < ./pkglist

FISH_DIR=~/.config/fish
THEMES_DIR=$FISH_DIR/themes

if [ ! -d $FISH_DIR ]; then
    mkdir -p $FISH_DIR
fi
if [ ! -d $THEMES_DIR ]; then
    mkdir -p $THEMES_DIR
fi

echo ""
sudo chsh -s /bin/fish $(whoami)

echo ""
chmod +x ./pfetch-kitties
sudo cp -vr ./pfetch-kitties /usr/local/bin

echo ""
cp -vr ./config.fish $FISH_DIR
cp -vr "./Catppuccin Mocha.theme" $THEMES_DIR

echo ""
cp -vr ./starship.toml ~/.config
