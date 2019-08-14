#!/bin/bash
KBD="";
oldKBD="";
while :
do
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
    sleep 1;
done
