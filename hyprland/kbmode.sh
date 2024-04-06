#!/bin/sh

if [ "$(hyprctl getoption input:kb_variant | grep 'dvorak')" = "" ]; then
    hyprctl reload
    hyprctl notify 2 2000 "rgb(fab387)" "Keyboard layout set to: US Dvorak, Russian"
else
    hyprctl keyword input:kb_variant ""
    hyprctl notify 2 2000 "rgb(fab387)" "Keyboard layout set to: US, Russian"
fi
