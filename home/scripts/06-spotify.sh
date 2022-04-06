#!/bin/sh

set -e

# HiDPI mode for Spotify.
mkdir -p ~/.local/share/applications && cd ~/.local/share/applications
cp /usr/share/applications/spotify.desktop .
sed -i 's/^Exec=spotify/Exec=spotify --force-device-scale-factor=2/' spotify.desktop