#!/bin/sh
if [ ! "$EUID" -ne 0 ]
  then echo "Please do not run as root"
  exit
fi

yay -S --needed - < ./pkglist

HYPR_PATH=~/.config/hypr
KICKOFF_PATH=~/.config/kickoff
DVORAK_PATH=./dvorak
USER_SYSTEMD_PATH=~/.config/systemd/user
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

echo ""
make --directory $DVORAK_PATH
sudo mv -vf $DVORAK_PATH/dvorak /usr/local/bin
sudo cp -vrf $DVORAK_PATH/dvorak.service /etc/systemd/system
sudo systemctl enable dvorak.service

echo ""
cp -vrf ./kwallet.service $USER_SYSTEMD_PATH

echo ""
cp -vrf ./polkitkde.service $USER_SYSTEMD_PATH

chmod +x ./kb-variant-toggle.sh
cp -vrf ./kb-variant-toggle.sh $HYPR_PATH

chmod +x ./swww-change.sh
cp -vrf ./swww-change.sh $HYPR_PATH
cp -vrf ./wallpapers $HYPR_PATH
