#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - <./pkglist

VSCODIUM_DIR=~/.config/VSCodium
CODIUM_FLAGS_FILE=~/.config/codium-flags.conf
VSCODE_OSS_DIR=~/.vscode-oss

if [ ! -d $VSCODIUM_DIR ]; then
    mkdir -p $VSCODIUM_DIR
else
    rm -vrf $VSCODIUM_DIR/*
fi

if [ ! -d $VSCODE_OSS_DIR ]; then
    mkdir -p $VSCODE_OSS_DIR
else
    rm -vrf $VSCODE_OSS_DIR/*
fi

echo ""
cp -vr ./VSCodium/* $VSCODIUM_DIR/
cp -vr ./.vscode-oss/* $VSCODE_OSS_DIR/
cp ./codium-flags.conf $CODIUM_FLAGS_FILE
