#!/bin/bash

RETROCARD_PATH_LOG="/tmp/retrocard.log"
if [ ! -f "$RETROCARD_PATH_LOG" ]; then
    exit
fi

rm $RETROCARD_PATH_LOG
/home/pi/retrocard/kill-emulator.sh &
/usr/bin/sudo -u pi /usr/bin/emulationstation
