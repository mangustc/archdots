#!/bin/sh
if [ ! "$EUID" -ne 0 ]
  then echo "Please do not run as root"
  exit
fi

yay -S --needed - < ./pkglist

TMUX_PATH=~/.config/tmux
if [ ! -d $TMUX_PATH ]; then
    mkdir -p $TMUX_PATH
fi

echo ""
cp -vrf ./tmux.conf "$TMUX_PATH/tmux.conf"
