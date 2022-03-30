#!/bin/sh

# References:
# - https://github.com/alacritty/alacritty/blob/master/INSTALL.md

set -e

# Clone the source code.
mkdir -p ~/dev/system && cd ~/dev/system
[ -d alacritty ] && exit 0
git clone https://github.com/alacritty/alacritty.git && cd alacritty

# Install dependencies.
sudo apt install -y  \
    cmake              \
    pkg-config         \
    libfreetype6-dev   \
    libfontconfig1-dev \
    libxcb-xfixes0-dev \
    libxkbcommon-dev   \
    python3

# Build Alacritty.
cargo build --release

# Install term info.
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Install Alacritty.
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Install man pages.
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# Hide Gnome Terminal.
mkdir -p ~/.local/share/applications && cd ~/.local/share/applications
cp /usr/share/applications/org.gnome.Terminal.desktop .
sed -i 's/^Exec=gnome-terminal$/Exec=gnome-terminal\nHidden=true/' org.gnome.Terminal.desktop
