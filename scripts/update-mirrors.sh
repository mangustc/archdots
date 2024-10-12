#/bin/sh

if [ ! "$EUID" -ne 0 ]; then
    echo "This script should be run as root"
    exit
fi

echo "Mirrors are now being sorted. Please wait..."

sudo rate-mirrors --allow-root --disable-comments --save /etc/pacman.d/mirrorlist arch
