#!/bin/bash

lower_battery_threshold=10
KBD="";
oldKBD="";

function kb_routine {
    oldKBD="$KBD";
    case "$(xset -q | grep -A 0 'LED' | cut -c59-67)" in
        "00000000") 
            KBD="English (US)" ;;
        "00001000") 
            KBD="Deutsch" ;;
        *) KBD="unknown" ;;
    esac

    if [ "$KBD" != "$oldKBD" ]; then
        notify-send "$KBD";
    fi

}

function battery_routine {
    capacity=$(< /sys/class/power_supply/BAT0/capacity)
    if [[ $capacity -lt lower_battery_threshold ]]; then
        notify-send "$capacity";
    fi
}

while :
do
    kb_routine
    battery_routine
    sleep 1;
done
