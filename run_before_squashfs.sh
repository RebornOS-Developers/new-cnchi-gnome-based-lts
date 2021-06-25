#!/bin/bash

# Made by Fernando "maroto"
# Run anything in the filesystem right before being "mksquashed"
# tar -I zstd -xvf from a pkg.tar.zst

script_path=$(readlink -f ${0%/*})
work_dir=work

# Adapted from AIS. An excellent bit of code!
arch_chroot(){
    arch-chroot $script_path/${work_dir}/airootfs /bin/bash -c "${1}"
}  

do_merge(){

arch_chroot "
wget https://repo.rebornos.org/RebornOS/sources/cnchi/testing/new-cnchi-lts-20210625-1-any.pkg.tar.zst
tar -xvf new-cnchi-lts-20210625-1-any.pkg.tar.zst
rm new-cnchi-lts-20210625-1-any.pkg.tar.zst
wget https://repo.rebornos.org/RebornOS/sources/pacman/packagekit-1.1.13-1-x86_64.pkg.tar.zst
tar -xvf packagekit-1.1.13-1-x86_64.pkg.tar.zst
rm packagekit-1.1.13-1-x86_64.pkg.tar.zst
wget https://repo.rebornos.org/RebornOS/sources/pacman/pacman-5.2.2-4-x86_64.pkg.tar.zst
tar -xvf pacman-5.2.2-4-x86_64.pkg.tar.zst
rm pacman-5.2.2-4-x86_64.pkg.tar.zst
wget https://repo.rebornos.org/RebornOS/sources/pacman/pacutils-0.10.0-1-x86_64.pkg.tar.zst
tar -xvf pacutils-0.10.0-1-x86_64.pkg.tar.zst
rm pacutils-0.10.0-1-x86_64.pkg.tar.zst
wget https://repo.rebornos.org/RebornOS/sources/pacman/pyalpm-0.9.2-1-x86_64.pkg.tar.zst
tar -xvf pyalpm-0.9.2-1-x86_64.pkg.tar.zst
rm pyalpm-0.9.2-1-x86_64.pkg.tar.zst
wget https://repo.rebornos.org/RebornOS/sources/pacman/pacman.conf
rm /etc/pacman.conf
cp pacman.conf /etc/pacman.conf
rm pacman.conf
rm /home/rebornos/.bashrc
cp /usr/share/cnchi/bashrc /home/rebornos/.bashrc
locale-gen
"
}

#################################
########## STARTS HERE ##########
#################################

do_merge
