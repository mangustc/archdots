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

chmod +x ./kbmode.sh
cp -vrf ./kbmode.sh $HYPR_PATH
chmod +x ./waybarmode.sh
cp -vrf ./waybarmode.sh $HYPR_PATH
chmod +x ./perfmode.sh
cp -vrf ./perfmode.sh $HYPR_PATH
chmod +x ./resmode.sh
cp -vrf ./resmode.sh $HYPR_PATH
chmod +x ./exitmenu.sh
cp -vrf ./exitmenu.sh $HYPR_PATH
chmod +x ./exitmenu.sh
cp -vrf ./pipevol.sh $HYPR_PATH

cp -vrf ./style.css $WOFI_PATH
