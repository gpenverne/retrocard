#!/bin/bash

USBPATH="/media/retrocard"
RETROCARD_PATH="$USBPATH/.retrocard"
if [ ! -d "$RETROCARD_PATH" ]; then
    exit
fi

/home/pi/retrocard/kill-emulator.sh
/usr/bin/emulationstation
