#  Copyright © 2016-2019 Reborn OS
#
#  This file is part of Reborn OS.
#
#  Reborn OS is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 3 of the License, or
#  (at your option) any later version.
#
#  Reborn OS is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  The following additional terms are in effect as per Section 7 of the license:
#
#  The preservation of all legal notices and author attributions in
#  the material or in the Appropriate Legal Notices displayed
#  by works containing it is required.
#
#  You should have received a copy of the GNU General Public License
#  along with Reborn OS; If not, see <http://www.gnu.org/licenses/>.

gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-timeout '0' && gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-timeout '0'
systemd-detect-virt
if [ "$?" != oracle ]; then
echo "Running in Virtualbox"
fi
#sed '54 c\
#> http://experiencing-reborn.weebly.com/welcome.html' /usr/share/cnchi/src/pages/slides.py
sudo pacman -Scc --noconfirm
sudo paccache -ruk0 
sudo paccache -rk 0
sudo paccache -r --keep 0
sudo rm -rf /install/var/cache/pacman/pkg/*
if (( $(fping google.com | grep -o "alive") == "alive" )); then
	sudo rm -rf /etc/pacman.d/gnupg
	sudo pacman -Syy
	sudo pacman-key --init
	sudo pacman-key --populate archlinux rebornos
	sudo pacman-key --refresh-keys
	sudo pacman -Syy
	sudo reflector --verbose -p https --sort rate --save /etc/pacman.d/mirrorlist
	sudo rm -f /var/lib/pacman/sync/*.db
	sudo rm -f /var/lib/pacman/sync/*.files
	sudo pacman -Syy
	sudo pacman -Fy
	sudo pacman -Syy
	# if [ ! -z $(grep "eu" "etc/pacman.d/mirrorlist") ]; then 
	# sudo cp /usr/bin/cnchi/pacman.conf /etc/
	# sudo mv /usr/bin/cnchi/reborn-mirrorlist2 /etc/pacman.d/reborn-mirrorlist
	# fi
	echo "######################################################"
	echo "#####################   DONE   #######################"
	echo "######################################################"
else 
	bash /usr/bin/internet.sh
fi
