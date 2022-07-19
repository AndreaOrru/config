#!/bin/bash

set -e

# Enable colored output and parallel downloads.
sudo sed -i 's/^#Color$/Color/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads = /ParallelDownloads = /' /etc/pacman.conf

# Fetch the best mirrors for Japan.
sudo pacman -S --needed --noconfirm pacman-contrib
curl -s "https://archlinux.org/mirrorlist/?country=JP&protocol=http&use_mirror_status=on" | \
    sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 - | sudo tee /etc/pacman.d/mirrorlist

# Optimize for the native architecture when building packages.
sudo sed -i 's/^CFLAGS="-march=x86-64 -mtune=generic /CFLAGS="-march=native /' /etc/makepkg.conf
sudo sed -i 's/^#RUSTFLAGS="-C opt-level=2"$/RUSTFLAGS="-C opt-level=2 -C target-cpu=native"/' /etc/makepkg.conf
# Run more compilation tasks in parallel.
sudo sed -i 's/^#MAKEFLAGS="-j2"$/MAKEFLAGS="-j8"/' /etc/makepkg.conf
# Don't compress packages.
sudo sed -i "s/^PKGEXT='\.pkg\.tar\.zst'$/PKGEXT='.pkg.tar'/" /etc/makepkg.conf

# Install Paru if necessary.
if ! pacman -Q paru &>/dev/null ; then
    mkdir -p ~/dev && cd ~/dev

    rm -rf paru
    git clone https://aur.archlinux.org/paru.git
    cd paru

    sudo pacman -S --needed --noconfirm rust
    makepkg -si --noconfirm

    paru -S --needed --noconfirm asp bat devtools
fi
