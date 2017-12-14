#!/bin/bash

mkdir /media/retrocard

cp /home/pi/retrocard/retrocard.launch.service /lib/systemd/system/retrocard.launch.service
cp /home/pi/retrocard/media-retrocard.mount /lib/systemd/system/media-retrocard.mount

systemctl daemon-reload
systemctl enable retrocard.launch.service
systemctl enable media-retrocard.mount

chmod +x /home/pi/retrocard/*.sh

cp /home/pi/retrocard/99-disc_script.rules /etc/udev/rules.d/99-disc_script.rules
chmod +x /home/pi/retrocard/mount-cdrom-as-retrocard.sh
udevadm control --reload
