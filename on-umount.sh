#!/bin/bash

RETROCARD_DEVICE=`mount | grep "retrocard" | awk '{print $1}'`
if [ "$RETROCARD_DEVICE" ==  "" ]; then
   echo "NOT MOUNTED"
   exit
fi

echo "on-umount" > /tmp/retrocard-umount.log

umount $RETROCARD_DEVICE || echo "No need to umount"
umount -f $RETROCARD_DEVICE || echo "No need to umount"



/home/pi/retrocard/relaunch-emulation-station.sh
