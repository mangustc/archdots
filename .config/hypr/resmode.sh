CHOICE=$(printf "%s\n" "2240x1400" "1920x1200" "1680x1050" | wofi --show dmenu --location top)

if [ "$CHOICE" = "2240x1400" ]; then
    hyprctl keyword monitor eDP-1,2240x1400,auto,1.458333
    hyprctl notify 2 2000 "rgb(fab387)" "Resolution set to: 2240x1400"
elif [ "$CHOICE" = "1920x1200" ]; then
    hyprctl keyword monitor eDP-1,1920x1200,auto,1.25
    hyprctl notify 2 2000 "rgb(fab387)" "Resolution set to: 1920x1200"
elif [ "$CHOICE" = "1680x1050" ]; then
    hyprctl keyword monitor eDP-1,1680x1050,auto,1.05
    hyprctl notify 2 2000 "rgb(fab387)" "Resolution set to: 1680x1050"
fi
