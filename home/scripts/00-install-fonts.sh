#!/bin/bash

set -e

mkdir -p ~/.fonts && cd ~/.fonts

# Download Iosevka.
if [ ! -f iosevka.ttc ]; then
    VERSION=`curl --silent "https://api.github.com/repos/be5invis/Iosevka/releases/latest" | jq -r ".. .tag_name? // empty"`
    PACKAGE="super-ttc-iosevka-${VERSION:1}.zip"

    wget -c "https://github.com/be5invis/Iosevka/releases/download/${VERSION}/${PACKAGE}"
    unzip -o "${PACKAGE}"
    rm -f "${PACKAGE}"
fi

# Download MesloLGS.
if [ ! -f "MesloLGS NF Regular.ttf" ]; then
    wget -c "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
    wget -c "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
    wget -c "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
    wget -c "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
fi

# Regenerate font cache.
fc-cache
