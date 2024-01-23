CHOICE=$(printf "%s\n" "Ultra Performance" "Performance" "Balanced Performance" "Balanced Power" "Powersave" | wofi --show dmenu --location top)

if [ "$CHOICE" = "Ultra Performance" ]; then
    cpupower-gui -p
    cpupower-gui ene --pref performance
elif [ "$CHOICE" = "Performance" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref performance
elif [ "$CHOICE" = "Balanced Performance" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref balance_performance
elif [ "$CHOICE" = "Balanced Power" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref balance_power
elif [ "$CHOICE" = "Powersave" ]; then
    cpupower-gui -b
    cpupower-gui ene --pref power
fi
