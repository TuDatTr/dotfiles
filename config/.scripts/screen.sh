#!/bin/sh


case $1 in
    "up"*)
        xbacklight -inc 10 &
        currentBrightness=$(xbacklight | cut -d\. -f1);
        dunstify -r 1 'brightness up'\ \($currentBrightness%\);
        ;;
    "down"*)
        xbacklight -dec 10 & 
        currentBrightness=$(xbacklight | cut -d\. -f1);
        dunstify -r 1 'brightness down'\ \($currentBrightness%\);
        ;;
esac
