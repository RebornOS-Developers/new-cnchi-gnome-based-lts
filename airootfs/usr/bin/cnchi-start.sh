#!/bin/bash
sudo pacman -Syy
sudo pacman -S cnchi-mirrors --noconfirm
sudo pacman -S new-cnchi-lts --noconfirm
sudo cp -r /home/rebornos/Downloads/reborn-mirrorlist /etc/pacman.d/reborn-mirrorlist
sudo cp -r /home/rebornos/Downloads/mirrorlist /etc/pacman.d/mirrorlist
sudo chmod 644 /etc/pacman.d/reborn-mirrorlist
sudo chmod 644 /etc/pacman.d/mirrorlist
sudo rm /home/rebornos/Downloads/reborn-mirrorlist
sudo rm /home/rebornos/Downloads/mirrorlist
sudo chmod 644 /etc/pacman.conf
sudo chmod 0777 /usr/share/cnchi/scripts/ckbcomp
if [ "$#" -eq 1 ]; then
    if echo "$1" | grep -q -E '(\b25[0-5]|\b2[0-4][0-9]|\b[01]?[0-9][0-9]?)(\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)){3}'; then
        echo "IP address received for checking the internet: $1"
        reversed_ip=$(echo -n "$1." | tac -s'.' | sed 's/.$//')
        sudo sed -i "s/1.1.1.1/$reversed_ip/g" /usr/share/cnchi/src/misc/extra.py
    else
        echo "ERROR: Invalid IP: $1..."
        echo "Please run again with a valid IP address of the form abc.def.ghi.jkl"
        exit 1
    fi
fi
sudo -E /usr/bin/python -Wall /usr/share/cnchi/src/cnchi.py -dvz --no-check --packagelist /usr/share/cnchi/data/packages.xml
