``
sudo cp retrocard.mount.service /etc/systemd/system/retrocard.mount.service
sudo cp retrocard.umount.service /etc/systemd/system/retrocard.umount.service

sudo systemctl daemon-reload
sudo systemctl start retrocard.mount.service
sudo systemctl enable retrocard.mount.service

sudo systemctl start retrocard.umount.service
sudo systemctl enable retrocard.umount.service

``

