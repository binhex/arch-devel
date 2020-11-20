#!/bin/bash

# exit script if return code != 0
set -e

# install additional python modules
/usr/bin/python2 -m pip install pex virtualenv requests

# define aur helper and ver
aur_helper="apacman"
aur_helper_version="3.1-1"

# install aur helper
pacman -S --needed base-devel --noconfirm
rcurl.sh -o "/tmp/${aur_helper}-any.pkg.tar.xz" "https://github.com/binhex/arch-packages/raw/master/compiled/${OS_ARCH}/${aur_helper}-${aur_helper_version}-any.pkg.tar.xz"
pacman -U "/tmp/${aur_helper}-any.pkg.tar.xz" --noconfirm

