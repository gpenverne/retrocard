# Retrocard

## What is it?

Just plug the usb drive/key to your retropie, it will launch the rom inside, like a catrdige do on a megadrive, or snes etc.

## How to?

Clone this repo to ``/home/pi/retrocard``
```shell
cd /home/pi
git clone https://github.com/gpenverne/retrocard.git
```

Plug a usbdrive with "RETROCARD" as label

### Using the install script
```shell
sudo /home/pi/retrocard/install.sh
```

### Manual installation

Create the mount point:

```shell
sudo mkdir /media/retrocard
```

Copy services:

```shell
sudo cp /home/pi/retrocard/retrocard.launch.service /lib/systemd/system/retrocard.launch.service
sudo cp /home/pi/retrocard/media-retrocard.mount /lib/systemd/system/media-retrocard.mount
```

Install services:
```shell
sudo systemctl daemon-reload
sudo systemctl start retrocard.launch.service
sudo systemctl enable retrocard.launch.service  

sudo systemctl start media-retrocard.mount
sudo systemctl enable media-retrocard.mount  
```

Chmod +x ``*.sh``

## Create the key

Have a look on the "SAMPLE" folder in this folder.

Your usb key should have "RETROCARD" as label

- ``/rom.gba`` is a gba rom (empty, it is just an example, you have to replace it with the rom of your choice)
- ``/.retrocard`` folder contains two files:
- ``/.retrocard/ROM`` will contain the relative (from the / of your usb key) path of your rom file (rom.gba, bomberman.snes or what you want)
- ``/.retrocard/SYSTEM`` will contain the name of the system (gba, snes) to launch the appropriate emulator (according to retropie)


## Using cdrom

Have a look on the "mount-cdrom-as-retrocard.sh" . This script will mount cdrom to /media/retrocard (if label matches)

You just have to add a udev rule to your udev rules:

```shell
sudo cp /home/pi/retrocard/99-disc_script.rules /etc/udev/rules.d/99-disc_script.rules
sudo chmod +x /home/pi/retrocard/mount-cdrom-as-retrocard.sh
sudo udevadm control --reload
```

## Launch rom from command line

Not the main purpose of this repo, but with it, you can launch rom from specific system and rom path from command line, using the launch.sh script:
/home/pi/retrocard/launch.sh system /path/to/rom 

```shell
/home/pi/retrocard/launch.sh snes /home/pi/RetroPie/roms/snes/my-rom.sfc
```
