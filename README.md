# new-cnchi-gnome-based-lts (ISO creation)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
<br><br>
<p align="center">
<img src="https://raw.githubusercontent.com/RebornOS-Developers/new-cnchi-gnome-based-lts/main/Screenshot-LTS-20210618-1.png">
</p>

```
sudo pacman -S archiso mkinitcpio-archiso mkinitcpio-nfs-utils squashfs-tools git
```

Process to build the ISO:

**1.** Clone this repo:

```
git clone https://github.com/RebornOS-Developers/new-cnchi-gnome-based-lts.git && cd new-cnchi-gnome-based-lts
```

**2.** From terminal, run:

```
sudo ./fix_permissions.sh
sudo ./build.sh -v
```

The installer ISO will be in the **out** folder (folder that will be created automatically).

This installer downloads the cnchi code from the RebornOS repository.
