#!/bin/bash

# exit script if return code != 0
set -e

# define pacman packages
pacman_packages="base-devel"

# define aur helper
aur_helper="apacman"

# install pre-reqs
pacman -S --needed $pacman_packages --noconfirm

# download build scripts from github
curl -o /tmp/scripts-master.zip -L https://github.com/binhex/scripts/archive/master.zip

# unzip build scripts
unzip /tmp/scripts-master.zip -d /tmp

# move shell scripts to /root
find /tmp/scripts-master/ -type f -name '*.sh' -exec mv -i {} /root/  \;

# call aur install script (arch user repo)
source /root/aur.sh

# cleanup
yes|pacman -Scc
rm -rf /usr/share/locale/*
rm -rf /usr/share/man/*
rm -rf /tmp/*
