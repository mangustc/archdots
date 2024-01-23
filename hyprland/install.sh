#!/bin/sh

if [ ! "$EUID" -ne 0 ]; then
  echo "Please do not run as root"
  exit
fi

paru -S --needed - < ./pkglist

HYPR_PATH=~/.config/hypr
WOFI_PATH=~/.config/wofi
if [ ! -d $HYPR_PATH ]; then
    mkdir -p $HYPR_PATH
fi
if [ ! -d $WOFI_PATH ]; then
    mkdir -p $WOFI_PATH
fi

echo ""
cp -vrf ./hyprland.conf "$HYPR_PATH/hyprland.conf"
cp -vrf ./mocha.conf "$HYPR_PATH/mocha.conf"

chmod +x ./kbtoggle.sh
cp -vrf ./kbtoggle.sh $HYPR_PATH

chmod +x ./waybar-toggle.sh
cp -vrf ./waybar-toggle.sh $HYPR_PATH

chmod +x ./perfmode.sh
cp -vrf ./perfmode.sh $HYPR_PATH

cp -vrf ./style.css $WOFI_PATH

