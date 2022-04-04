#!/bin/bash

set -e

mkdir -p ~/dev/system && cd ~/dev/system

VERSION=`curl -s "https://api.github.com/repos/ankitects/anki/releases/latest" | jq -r ".. .tag_name? // empty"`
PACKAGE="anki-${VERSION}-linux"

[ -d "${PACKAGE}" ] && exit 0

wget -c "https://github.com/ankitects/anki/releases/download/${VERSION}/${PACKAGE}.tar.bz2"
unp "${PACKAGE}.tar.bz2"
rm "${PACKAGE}.tar.bz2"

cd "${PACKAGE}"
sudo ./install.sh
