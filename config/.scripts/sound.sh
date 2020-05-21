#!/bin/sh

type pactl >/dev/null 2>&1 || { echo >&2 "I require pactl but it's not installed.  Aborting."; exit 1; }
type amixer >/dev/null 2>&1 || { echo >&2 "I require amixer but it's not installed.  Aborting."; exit 1; }
type dunstify >/dev/null 2>&1 || { echo >&2 "I require dunstify but it's not installed.  Aborting."; exit 1; }

defaultSink=$(pactl info | grep 'Default Sink' | cut -d' ' -f3);
curVolume=$(amixer get Master | grep -o \[0-9\]\\+% -m 1);

case $1 in
    "up"*)
        pactl set-sink-volume $defaultSink +5%; 
        dunstify -r 2 'sound up'\ \($curVolume\);
        ;;
    "down"*)
        pactl set-sink-volume $defaultSink -5%;
        dunstify -r 2 'sound up'\ \($curVolume\);
        ;;
    "toggle"*)
        msg='muted';
        if amixer get Master | grep -q off; then
           msg='unmuted';
        fi 
        pactl set-sink-mute $defaultSink toggle; 
        dunstify -r 2 'sound'\ $msg;
        echo $msg
        ;;
esac
