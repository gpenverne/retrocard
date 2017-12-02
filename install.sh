#!/bin/bash

mkdir /media/retrocard

cp /home/pi/retrocard/retrocard.launch.service /lib/systemd/system/retrocard.launch.service
cp /home/pi/retrocard/media-retrocard.mount /lib/systemd/system/media-retrocard.mount
cp /home/pi/retrocard/retrocard.umount.service /lib/systemd/system/retrocard.umount.service

systemctl daemon-reload
systemctl start retrocard.launch.service
systemctl enable retrocard.launch.service

systemctl start media-retrocard.mount
systemctl enable media-retrocard.mount

systemctl start retrocard.umount.service
systemctl enable retrocard.umount.service

chmod +x /home/pi/retrocard/launch.sh
chmod +x /home/pi/retrocard/kill-emulator.sh
chmod +x /home/pi/retrocard/relaunch-emulation-station.sh

cp /media/pi/retrocard/99-disc_script.rules /usr/lib/udev/rules.d/99-disc_script.rules
chmod +x /home/pi/retrocard/mount-cdrom-as-retrocard.sh
udevadm control –reload
