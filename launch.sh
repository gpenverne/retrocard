#!/bin/bash

USBPATH="/media/retrocard"
RETROCARD_PATH="$USBPATH/.retrocard"
if [ $# -eq 0 ]; then
    if [ ! -d "$RETROCARD_PATH" ]; then
        exit
    fi
    SYSTEM_PLATFORM=`cat $RETROCARD_PATH/SYSTEM`
    ROM_FILE=`cat $RETROCARD_PATH/ROM`
    ROM_PATH="$USBPATH/$ROM_FILE"
else
    SYSTEM_PLATFORM=$1
    ROM_PATH=$2
    USBPATH=""
fi


/usr/bin/cec-client &
/home/pi/retrocard/kill-emulator.sh

RETROPIE_RUNCOMMAND_PATH="sudo /opt/retropie/supplementary/runcommand/runcommand.sh 1 _SYS_"
LAUNCH_COMMAND="$RETROPIE_RUNCOMMAND_PATH $SYSTEM_PLATFORM $ROM_PATH $USBPATH"
echo $LAUNCH_COMMAND >> /tmp/retrocard.log
$LAUNCH_COMMAND > /dev/null
RUNCOMMANDLOG_PATH="/dev/shm/runcommand.log"
RUNCOMMAND=`tail -n 1 $RUNCOMMANDLOG_PATH`
RUNCOMMAND=${RUNCOMMAND:11}
killall emulationstation
echo $RUNCOMMAND >> /tmp/retrocard.log
eval $RUNCOMMAND > /dev/null
