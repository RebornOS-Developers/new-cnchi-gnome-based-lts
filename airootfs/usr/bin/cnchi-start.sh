#!/bin/bash
sudo pacman -S cnchi-urlfix --noconfirm
sudo pacman -S cnchi-mirrors --noconfirm
sudo cp -r /home/rebornos/Downloads/reborn-mirrorlist /etc/pacman.d/reborn-mirrorlist
sudo cp -r /home/rebornos/Downloads/mirrorlist /etc/pacman.d/mirrorlist
sudo chmod 644 /etc/pacman.d/reborn-mirrorlist
sudo chmod 644 /etc/pacman.d/mirrorlist
sudo rm /home/rebornos/Downloads/reborn-mirrorlist
sudo rm /home/rebornos/Downloads/mirrorlist
sudo chmod 644 /etc/pacman.conf
sudo chmod 0777 /usr/share/cnchi/scripts/ckbcomp
sudo -E /usr/bin/python -Wall /usr/share/cnchi/src/cnchi.py -dvz --no-check --packagelist /usr/share/cnchi/data/packages.xml
