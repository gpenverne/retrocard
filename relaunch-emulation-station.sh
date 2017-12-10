#!/bin/bash

RETROCARD_PATH_LOG="/tmp/retrocard.log"
if [ ! -f "$RETROCARD_PATH_LOG" ]; then
    exit
fi
rm $RETROCARD_PATH_LOG
/home/pi/retrocard/kill-emulator.sh
openvt -c 1 -s -f emulationstation 2>&1
echo "" > /tmp/es-restart && killall emulationstation
