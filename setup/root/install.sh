#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="base-devel"

# install pre-reqs
pacman -S --needed $pacman_packages --noconfirm

# define aur helper
aur_helper="apacman"

# manually download aur helper from binhex repo
curl -o "/tmp/${aur_helper}-any.pkg.tar.xz" -L "https://github.com/binhex/arch-packages/raw/master/compiled/${aur_helper}-any.pkg.tar.xz"
pacman -U "/tmp/${aur_helper}-any.pkg.tar.xz" --noconfirm

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /root/*
rm -rf /tmp/*
