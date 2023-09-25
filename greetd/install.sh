#!/bin/sh
if [ ! "$EUID" -ne 0 ]; then
    echo "Please do not run as root"
    exit
fi

yay -S --needed - <./pkglist

GREETD_DIR=/etc/greetd

if [ ! -d $GREETD_DIR ]; then
    sudo mkdir -p $GREETD_DIR
fi

echo ""
sudo cp -vr ./config.toml $GREETD_DIR/config.toml
echo "user = \"$(whoami)\"" | sudo tee -a $GREETD_DIR/config.toml

if [ "$(sudo systemctl status greetd.service | grep enabled)" == "" ]; then
    sudo systemctl enable greetd.service
fi
