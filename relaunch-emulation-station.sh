#!/bin/bash

USBPATH="/media/RETROCARD"
RETROCARD_PATH="$USBPATH/.retrocard"
if [ ! -d "$RETROCARD_PATH" ]; then
    exit
fi

/usr/bin/emulationstation
