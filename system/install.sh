#!/bin/sh
if [ "$EUID" -ne 0 ]; then
    echo "This script should be run as root"
    exit
fi

pacman -S --needed - <./pkglist

USER_NAME="ivan"

if [ ! "$(groups $USER_NAME | grep 'unknown user')" == "" ]; then
    useradd -m $USER_NAME
    passwd $USER_NAME
fi

if [ "$(groups $USER_NAME | grep audio)" == "" ]; then
    gpasswd -a $USER_NAME audio
fi
if [ "$(groups $USER_NAME | grep video)" == "" ]; then
    gpasswd -a $USER_NAME video
fi
if [ "$(groups $USER_NAME | grep input)" == "" ]; then
    gpasswd -a $USER_NAME input
fi

echo ""
cp -vr ./pacman.conf /etc/pacman.conf

echo ""
if [ "$(groups $USER_NAME | grep wheel)" == "" ]; then
    gpasswd -a $USER_NAME wheel
fi
cp -vr ./sudoers /etc/sudoers

echo ""
if [ "$(systemctl status NetworkManager.service | grep enabled)" == "" ]; then
    systemctl enable NetworkManager.service
fi

if [ "$(whereis yay | grep /usr/bin/yay)" == "" ]; then
    sudo --user=$USER_NAME git clone https://aur.archlinux.org/yay.git
    cd yay
    sudo --user=$USER_NAME makepkg -si
    cd ..
    sudo --user=$USER_NAME rm -vrf ./yay
fi
