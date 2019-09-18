#!/bin/bash

# install emacs 27

## install dependencies

sudo apt install -y build-essential texinfo libx11-dev libxpm-dev \
     libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev \
     libncurses-dev gnutls-dev libgtk-3-dev libgnutls28-dev

# some more from a stackoverflow, eww was not working before

sudo apt install -y autoconf automake libtool xorg-dev libncurses5-dev \
    libdbus-1-dev libm17n-dev librsvg2-dev libotf-dev libxml2-dev \
    libmagickwand-dev libc6-dev libtiff5-dev xaw3dg-dev \
    zlib1g-dev libice-dev libsm-dev libxext-dev libxi-dev libxmu-dev \
    libxmuu-dev libxrandr-dev libxt-dev libxtst-dev libxv-dev

## download and install

cd ~
git clone -b master --depth 1 git://git.sv.gnu.org/emacs.git
cd emacs
./autogen.sh
./configure
make
sudo make install
cd ~
rm -rf ~/emacs
