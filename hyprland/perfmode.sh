CHOICE=$(printf "%s\n" "Ultra Performance" "Performance" "Balanced Performance" "Balanced Power" "Powersave" | wofi --show dmenu --location top)

if [ "$CHOICE" = "Ultra Performance" ]; then
    cpupower-gui -p
    cpupower-gui ene --pref performance
    hyprctl notify 2 2000 "rgb(fab387)" "Power plan set to: Ultra Performance"
elif [ "$CHOICE" = "Performance" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref performance
    hyprctl notify 2 2000 "rgb(fab387)" "Power plan set to: Performance"
elif [ "$CHOICE" = "Balanced Performance" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref balance_performance
    hyprctl notify 2 2000 "rgb(fab387)" "Power plan set to: Balanced Performance"
elif [ "$CHOICE" = "Balanced Power" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref balance_power
    hyprctl notify 2 2000 "rgb(fab387)" "Power plan set to: Balanced Power"
elif [ "$CHOICE" = "Powersave" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref power
    hyprctl notify 2 2000 "rgb(fab387)" "Power plan set to: Powersave"
fi
