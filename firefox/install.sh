#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - <./pkglist

FIREFOX_DIR=~/.mozilla/firefox
PROFILE_NAME=g6vmot1q.private

if [ ! -d $FIREFOX_DIR ]; then
    mkdir -p $FIREFOX_DIR
fi

if [ -d $FIREFOX_DIR/$PROFILE_NAME ]; then
    rm -vrf $FIREFOX_DIR/$PROFILE_NAME
fi

echo ""
cp -vr ./$PROFILE_NAME $FIREFOX_DIR/$PROFILE_NAME
cp -vr ./profiles.ini $FIREFOX_DIR/profiles.ini
