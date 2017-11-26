# Retrocard

## What is it?

Just plug the usb drive/key to your retropie, it will launch the rom inside, like a catrdige do on a megadrive, or snes etc.

## How to?

Clone this repo to ``/home/pi/retrocard``

Plug a usbdrive with "RETROCARD" as label

Create the mount point:

```shell
sudo mkdir /media/RETROCARD
```

Copy services:

```shell
sudo cp /home/pi/retrocard/retrocard.launch.service /lib/systemd/system/retrocard.launch.service
sudo cp /home/pi/retrocard/retrocard.mount.service /lib/systemd/system/retrocard.mount.service
sudo cp /home/pi/retrocard/retrocard.umount.service /lib/systemd/system/retrocard.umount.service
```

Install services:
```shell
sudo systemctl daemon-reload
sudo systemctl start retrocard.launch.service
sudo systemctl enable retrocard.launch.service  

sudo systemctl start retrocard.mount.service
sudo systemctl enable retrocard.mount.service  

sudo systemctl start retrocard.umount.service
sudo systemctl enable retrocard.umount.service
```

Chmod +x ``launch.sh`` and ``kill-emulator.sh``

## Create the key

Have a look on the "SAMPLE" folder in this folder.

Your usb key should have "RETROCARD" as label

- ``/rom.gba`` is a gba rom (empty, it is just an example, you have to replace it with the rom of your choice)
- ``/.retrocard`` folder contains two files:
- ``/.retrocard/ROM`` will contain the relative (from the / of your usb key) path of your rom file (rom.gba, bomberman.snes or what you want)
- ``/.retrocard/SYSTEM`` will contain the name of the system (gba, snes) to launch the appropriate emulator (according to retropie)
