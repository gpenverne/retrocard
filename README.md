`
echo 'ACTION=="add", KERNEL=="sd*[!0-9]",RUN+="/usr/bin/sudo /home/pi/retrocard/launch.sh"' > /lib/udev/rules.d/99-retrocard.rules
udevadm control --reload-rules




/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ snes /path/to/ROM

