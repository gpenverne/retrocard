#!/bin/bash

RETROCARD_PATH_LOG="/tmp/retrocard.log"
if [ ! -f "$RETROCARD_PATH_LOG" ]; then
    exit
fi
if [ -d "/media/retrocard/.retrocard" ]; then
    exit
fi
rm $RETROCARD_PATH_LOG
sudo openvt -c 1 -s -f emulationstation 2>&1
/home/pi/retrocard/kill-emulator.sh
