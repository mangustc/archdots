#!/bin/sh
if [ ! "$EUID" -ne 0 ]
  then echo "Please do not run as root"
  exit
fi

yay -S --needed - < ./pkglist

HYPR_PATH=~/.config/hypr
KICKOFF_PATH=~/.config/kickoff
if [ ! -d $HYPR_PATH ]; then
    mkdir -p $HYPR_PATH
fi
if [ ! -d $KICKOFF_PATH ]; then
    mkdir -p $KICKOFF_PATH
fi
if [ ! -d $USER_SYSTEMD_PATH ]; then
    mkdir -p $USER_SYSTEMD_PATH
fi

echo ""
cp -vrf ./hyprland.conf "$HYPR_PATH/hyprland.conf"
cp -vrf ./mocha.conf "$HYPR_PATH/mocha.conf"

echo ""
cp -vrf ./kickoff.toml "$KICKOFF_PATH/config.toml"

chmod +x ./kb-variant-toggle.sh
cp -vrf ./kb-variant-toggle.sh $HYPR_PATH

chmod +x ./swww-change.sh
cp -vrf ./swww-change.sh $HYPR_PATH
cp -vrf ./wallpapers $HYPR_PATH

chmod +x ./waybar-toggle.sh
cp -vrf ./waybar-toggle.sh $HYPR_PATH

