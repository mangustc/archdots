#!/bin/sh
if [ "$EUID" -ne 0 ]; then
    echo "This script should be run as root"
    exit
fi

if [ "$(cat /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)" == "1" ]; then
    echo "Turning off conservation mode..."
    echo 0 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
else
    echo "Turning onn conservation mode..."
    echo 1 > /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
fi
