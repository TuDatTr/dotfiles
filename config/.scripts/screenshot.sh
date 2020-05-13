#!/bin/sh


d=$HOME/Pictures/Screenshots/$(date +%G-%m);
case $1 in
    "screen"*)
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png;
        maim -f png $d/$filename;
        dunstify -r 2 "Saved screenshot of screen in $d/$filename";
        ;;
    "window"*)
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png
        maim -u -i $(xdotool getactivewindow) -f png $d/$filename;
        dunstify -r 2 "Saved screenshot of window in $d/$filename";
        ;;
    "area"*)
        dunstify -r 2 'Taking screenshot from area.';
        filename=$(cat /proc/$(xdotool getwindowpid $(xdotool getwindowfocus))/comm)_$(date +%G-%m-%d_%H-%M-%S).png;
        maim -u -s -f png $d/$filename;
        dunstify -r 2 "Saved in $d/$filename.";
        ;;
esac
