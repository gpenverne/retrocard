#!/bin/bash
#!/
/usr/bin/cec-client &
/home/pi/retrocard/kill-emulator.sh

echo "LAUNCHING" > /tmp/retrocard.log
USBPATH="/media/usb0"
RETROCARD_PATH="$USBPATH/.retrocard"
if [ ! -d "$RETROCARD_PATH" ]; then
    exit
fi

RETROPIE_RUNCOMMAND_PATH="sudo /opt/retropie/supplementary/runcommand/runcommand.sh 1 _SYS_"
SYSTEM_PLATFORM=`cat $RETROCARD_PATH/SYSTEM`
ROM_FILE=`cat $RETROCARD_PATH/ROM`
ROM_PATH="$USBPATH/$ROM_FILE"

LAUNCH_COMMAND="$RETROPIE_RUNCOMMAND_PATH $SYSTEM_PLATFORM $ROM_PATH $USBPATH"
echo $LAUNCH_COMMAND >> /tmp/retrocard.log
$LAUNCH_COMMAND > /dev/null
RUNCOMMANDLOG_PATH="/dev/shm/runcommand.log"
RUNCOMMAND=`tail -n 1 $RUNCOMMANDLOG_PATH`
RUNCOMMAND=${RUNCOMMAND:11}
killall emulationstation
echo $RUNCOMMAND >> /tmp/retrocard.log
eval $RUNCOMMAND > /dev/null
emulationstation
