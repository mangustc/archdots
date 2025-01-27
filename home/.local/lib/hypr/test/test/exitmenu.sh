CHOICE=$(printf "%s\n" "Shutdown" "Reboot" "Sleep" | wofi --show dmenu --location top)

if [ "$CHOICE" = "Shutdown" ]; then
    shutdown +0
elif [ "$CHOICE" = "Reboot" ]; then
    reboot
elif [ "$CHOICE" = "Sleep" ]; then
    systemctl suspend
fi
