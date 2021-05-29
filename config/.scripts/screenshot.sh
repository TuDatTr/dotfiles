#!/bin/sh

type maim >/dev/null 2>&1 || { echo >&2 "I require maim but it's not installed.  Aborting."; exit 1; }
type dunstify >/dev/null 2>&1 || { echo >&2 "I require dunstify but it's not installed.  Aborting."; exit 1; }
type xclip >/dev/null 2>&1 || { echo >&2 "I require xclip but it's not installed.  Aborting."; exit 1; }
type xdotool >/dev/null 2>&1 || { echo >&2 "I require xdotool but it's not installed.  Aborting."; exit 1; }

clip_screenshot () {
    if test -f "$1"
    then
        dunstify -r 2 "Saved in $1";
        xclip -selection clipboard -t image/png -i $1
    else
        :
    fi
}

d=$HOME/Pictures/Screenshots/$(date +%Y-%m);
fd=$(date +%y-%m-%d_%H-%M-%S)

if [ -d "$d" ]
then
    :
else
    mkdir $d
fi

case $1 in
    "screen"*)
        filename=$fd-$(cat /proc/$(xdotool getwindowfocus getwindowpid)/comm).png;
        maim -f png $d/$filename;
        clip_screenshot $d/$filename;
        ;;
    "window"*)
        filename=$fd-$(cat /proc/$(xdotool getwindowfocus getwindowpid)/comm).png;
        maim -u -i $(xdotool getactivewindow) -f png $d/$filename;
        clip_screenshot $d/$filename;
        ;;
    "area"*)
        # dunstify -r 2 'Taking screenshot from area.';
        filename=$fd-$(cat /proc/$(xdotool getwindowfocus getwindowpid)/comm).png;
        maim -u -s -f png $d/$filename;
        clip_screenshot $d/$filename;
        ;;
esac
