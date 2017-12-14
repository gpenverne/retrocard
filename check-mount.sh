#!/bin/bash


if [ ! -f "/tmp/retrocard-device" ]; then
    exit 0;
fi


RETROCARD_DEVICE=`cat /tmp/retrocard-device`
ALIVE=`sudo fdisk -l | grep sda1`

if [ "$ALIVE" == "" ]; then
    rm /tmp/retrocard-device
    /home/pi/retrocard/on-umount.sh
    exit 1
fi


exit 0
