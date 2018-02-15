#!/bin/bash

# exit script if return code != 0
set -e

# install additional python modules
/usr/bin/python2 -m pip install pex virtualenv requests

# bootstrap and install apacman
pacman -S --needed --asdeps jshon --noconfirm
curl -O "https://raw.githubusercontent.com/oshazard/apacman/master/apacman"
bash ./apacman -S apacman --noconfirm
