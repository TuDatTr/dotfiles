#!/bin/sh

type xrandr >/dev/null 2>&1 || { echo >&2 "I require maim but it's not installed.  Aborting."; exit 1; }

mon0=eDPI1
mon1=HDMI1
case $1 in
    "mon0"*)
        xrandr --output $mon0 --auto
        xrandr --output $mon1 --off
        ;;
    "duplicate"*)
        xrandr --output $mon0 --auto
        xrandr --output $mon1 --same-as $mon0
        ;;
    "extend"*)
        xrandr --output $mon0 --auto
        xrandr --output $mon1 --left-of $mon0
        ;;
    "mon1"*)
        xrandr --output $mon0 --off
        xrandr --output $mon1 --auto
        ;;
esac
