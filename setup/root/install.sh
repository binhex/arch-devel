#!/bin/bash

# exit script if return code != 0
set -e

# build scripts
####

# download build scripts from github
curl -o /tmp/scripts-master.zip -L https://github.com/binhex/scripts/archive/master.zip

# unzip build scripts
unzip /tmp/scripts-master.zip -d /tmp

# move shell scripts to /root
find /tmp/scripts-master/ -type f -name '*.sh' -exec mv -i {} /root/  \;

# pacman packages
####

# define pacman packages
pacman_packages="base-devel"

# install compiled packages using pacman
if [[ ! -z "${pacman_packages}" ]]; then
	pacman -S --needed $pacman_packages --noconfirm
fi

# define aur helper and ver
aur_helper="apacman"
aur_helper_version="3.1-1"

# install aur helper from github
curl -o "/tmp/${aur_helper}-any.pkg.tar.xz" -L "https://github.com/binhex/arch-packages/raw/master/compiled/${aur_helper}-${aur_helper_version}-any.pkg.tar.xz"
pacman -U "/tmp/${aur_helper}-any.pkg.tar.xz" --noconfirm

# container perms
####

# env vars
####

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
