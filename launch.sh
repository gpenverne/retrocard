#!/bin/sh

echo "IT WORKS!" > /tmp/retrocard.log

USBPATH="/media/usb"

RETROPIE_RUNCOMMAND_PATH="/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_"
SYSTEM_PLATFORM=`cat $USBPATH/.retrocard/SYSTEM`
ROM_PATH="$USBPATH/rom"

LAUNCH_COMMAND="$RETROPIE_RUNCOMMAND_PATH $SYSTEM_PLATFORM $ROMPATH"
echo $LAUNCH_COMMAND > /tmp/retrocard.log
$LAUNCH_COMMAND


