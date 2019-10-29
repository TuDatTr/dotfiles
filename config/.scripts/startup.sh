#!/bin/bash

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
    if [[ $capacity -lt 5 ]]; then
        echo $capacity
    fi
}

KBD="";
oldKBD="";

while :
do
    kb_routine
    battery_routine
    sleep 1;
done
