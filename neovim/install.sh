#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

paru -S --needed - <./pkglist

NEOVIM_DIR=~/.config/nvim

if [ ! -d $NEOVIM_DIR ]; then
    mkdir -p $NEOVIM_DIR
else
    cp -vr $NEOVIM_DIR ./nvim-backup
fi

echo ""
rm -vrf $NEOVIM_DIR
cp -vr ./nvim $NEOVIM_DIR
