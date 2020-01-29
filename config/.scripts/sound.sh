#!/bin/sh

defaultsink=$(pactl info | grep 'Default Sink' | cut -d' ' -f3);
curVolume=$(amixer get Master | grep -o \[0-9\]\\+% -m 1);

case $1 in
    "up"*)
        pactl set-sink-volume $defaultsink +5%; 
        dunstify -r 2 'sound up'\ \($curVolume\);
        ;;
    "down"*)
        pactl set-sink-volume $defaultsink -5%;
        dunstify -r 2 'sound up'\ \($curVolume\);
        ;;
    "toggle"*)
        msg='muted';
        if amixer get Master | grep -q off; then
           msg='unmuted';
        fi 
        pactl set-sink-mute $defaultsink toggle; 
        dunstify -r 2 'sound'\ $msg;
        echo $msg
        ;;
esac
