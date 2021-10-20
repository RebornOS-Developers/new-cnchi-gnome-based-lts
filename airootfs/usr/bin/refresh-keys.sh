#!/bin/bash
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now bluetooth.service
sudo rm -rf /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux rebornos
sudo pacman -Syy
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.gedit.desktop', 'gparted.desktop', 'rebornos-install.desktop', 'rebornos-install-2.desktop', 'rebornos-welcome.desktop', 'org.gnome.Terminal.desktop']"
sudo cnchi-start.sh
