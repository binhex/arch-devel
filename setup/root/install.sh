#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="base-devel"

# install pre-reqs
pacman -S --needed $pacman_packages --noconfirm

# manually download aur helper from binhex repo
curl -o /tmp/apacman-3.0-1-any.pkg.tar.xz -L https://github.com/binhex/arch-packages/raw/master/compiled/apacman-3.0-1-any.pkg.tar.xz
pacman -U /tmp/apacman-3.0-1-any.pkg.tar.xz --noconfirm

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /root/*
rm -rf /tmp/*
