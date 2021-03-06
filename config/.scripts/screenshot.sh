#!/bin/sh

type maim >/dev/null 2>&1 || { echo >&2 "I require maim but it's not installed.  Aborting."; exit 1; }
type dunstify >/dev/null 2>&1 || { echo >&2 "I require dunstify but it's not installed.  Aborting."; exit 1; }
type xclip >/dev/null 2>&1 || { echo >&2 "I require xclip but it's not installed.  Aborting."; exit 1; }
type xdotool >/dev/null 2>&1 || { echo >&2 "I require xdotool but it's not installed.  Aborting."; exit 1; }

d=$HOME/Pictures/Screenshots/$(date +%G-%m);
case $1 in
    "screen"*)
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png;
        maim -f png $d/$filename;
        dunstify -r 2 "Saved screenshot of screen in $d/$filename";
        xclip -selection clipboard -t image/png -i $d/$filename
        ;;
    "window"*)
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png
        maim -u -i $(xdotool getactivewindow) -f png $d/$filename;
        dunstify -r 2 "Saved screenshot of window in $d/$filename";
        xclip -selection clipboard -t image/png -i $d/$filename
        ;;
    "area"*)
        dunstify -r 2 'Taking screenshot from area.';
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png;
        maim -u -s -f png $d/$filename;
        dunstify -r 2 "Saved in $d/$filename.";
        xclip -selection clipboard -t image/png -i $d/$filename
        ;;
esac
