#!/bin/bash

set -e

mkdir -p ~/dev/system && cd ~/dev/system

VERSION=`curl -s "https://api.github.com/repos/ankitects/anki/releases/latest" | jq -r ".. .tag_name? // empty"`
PACKAGE="anki-${VERSION}-linux-qt6"

[ -d "${PACKAGE}" ] && exit 0

wget -c "https://github.com/ankitects/anki/releases/download/${VERSION}/${PACKAGE}.tar.zst"
tar --use-compress-program=unzstd -xvf "${PACKAGE}.tar.zst"
rm "${PACKAGE}.tar.zst"

cd "${PACKAGE}"
sudo ./uninstall.sh
sudo ./install.sh
