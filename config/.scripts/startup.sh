#!/bin/sh

type xset >/dev/null 2>&1 || { echo >&2 "I require xset but it's not installed.  Aborting."; exit 1; }

lower_battery_threshold=10
KBD="";
oldKBD="";

function kb_routine {
    oldKBD="$KBD";
    case "$(xset -q | grep -A 0 'LED' | cut -c59-67)" in
        "00000000") 
            KBD="Europe" ;;
        "00001000") 
            KBD="Deutsch" ;;
        *) KBD="unknown" ;;
    esac

    if [ "$KBD" != "$oldKBD" ]; then
        dunstify -r 1 "$KBD";
    fi

}

function battery_routine {
    capacity=$(< /sys/class/power_supply/BAT0/capacity)
    if [[ $capacity -lt lower_battery_threshold ]]; then
        acpi | grep -q '0: Discharging' && dunstify "Battery at $capacity%";
        sleep 60;
    fi
}

while :
do
    kb_routine
    battery_routine
    sleep 1;
done
