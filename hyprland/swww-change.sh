#!/bin/sh
re="^[0-9]+$"

SOURCE_FOLDER=~/.config/hypr
STATE_FILE=$SOURCE_FOLDER/.wpstate
WALLPAPER_FOLDER=$SOURCE_FOLDER/wallpapers
WALLPAPER_AMOUNT=$(ls -1q $WALLPAPER_FOLDER | wc -l)

# Sanity checks
if ! [[ -d "$SOURCE_FOLDER" ]]; then
    echo "Source folder doesn't exist."
    exit 1
fi
if ! [[ -d "$WALLPAPER_FOLDER" ]]; then
    echo "Wallpaper folder doesn't exist."
    exit 1
fi
if [ $WALLPAPER_AMOUNT -lt 1 ]; then
    echo "There aren't any wallpapers in the wallpapers folder."
    exit 1
fi

# Defining wallpaper
if [ -f "$STATE_FILE" ]; then
    NUMBER=$(cat $STATE_FILE)
    if ! [[ $NUMBER =~ $re ]] ; then
        NUMBER=$((1 + $RANDOM % $WALLPAPER_AMOUNT))
    else
        NUMBER=$(($NUMBER + 1))
        if [ $WALLPAPER_AMOUNT -lt $NUMBER ]; then
            NUMBER=1
        fi
    fi
else
    NUMBER=$((1 + $RANDOM % $WALLPAPER_AMOUNT))
fi

# echo "$(cat $STATE_FILE) -> $NUMBER"
echo $NUMBER > $STATE_FILE
/usr/bin/swww img --transition-step 4 --transition-fps 60 --transition-type any "$WALLPAPER_FOLDER/$(ls $WALLPAPER_FOLDER | head -$NUMBER | tail -1)"
