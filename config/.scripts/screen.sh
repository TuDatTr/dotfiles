#!/bin/sh

type xbacklight >/dev/null 2>&1 || { echo >&2 "I require xbacklight but it's not installed.  Aborting."; exit 1; }
type dunstify >/dev/null 2>&1 || { echo >&2 "I require dunstify but it's not installed.  Aborting."; exit 1; }

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
