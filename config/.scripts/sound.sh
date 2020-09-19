#!/bin/sh

type pactl >/dev/null 2>&1 || { echo >&2 "I require pactl but it's not installed.  Aborting."; exit 1; }
type amixer >/dev/null 2>&1 || { echo >&2 "I require amixer but it's not installed.  Aborting."; exit 1; }
type dunstify >/dev/null 2>&1 || { echo >&2 "I require dunstify but it's not installed.  Aborting."; exit 1; }

function isMuted() {
    if amixer get Master | grep -q off; then
        muted=0;
    else
        muted=1;
    fi
}

defaultSink=$(pactl info | grep 'Default Sink' | cut -d' ' -f3);

isMuted;
if [ $muted -eq 1 ]; then echo unmuted; else echo muted; fi

case $1 in
    "up"*)
        pactl set-sink-volume $defaultSink +5%; 
        curVolume=$(amixer get Master | grep -o \[0-9\]\\+% -m 1);
        if [ $muted -eq 0 ]; then msg="(muted)"; else msg=""; fi
        dunstify -r 2 'sound up'\ \($curVolume\) $msg;
        ;;
    "down"*)
        pactl set-sink-volume $defaultSink -5%;
        curVolume=$(amixer get Master | grep -o \[0-9\]\\+% -m 1);
        if [ $muted -eq 0 ]; then msg="(muted)"; else msg=""; fi
        dunstify -r 2 'sound up'\ \($curVolume\) $msg;
        ;;
    "toggle"*)
        pactl set-sink-mute $defaultSink toggle; 
        if [ $muted -eq 0 ]; then msg=unmuted; else msg=muted; fi
        dunstify -r 2 'sound'\ $msg;
        ;;
esac
