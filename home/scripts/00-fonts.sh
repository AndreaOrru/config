#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

mkdir -p ~/.fonts && cd ~/.fonts

# Download Iosevka.
if [ ! -f iosevka.ttc ]; then
    VERSION=`curl -s "https://api.github.com/repos/be5invis/Iosevka/releases/latest" | jq -r ".. .tag_name? // empty"`
    PACKAGE="super-ttc-iosevka-${VERSION:1}.zip"

    wget "https://github.com/be5invis/Iosevka/releases/download/${VERSION}/${PACKAGE}"
    unzip -o "${PACKAGE}"
    rm -f "${PACKAGE}"
fi

# Download Nerd Fonts.
if [ ! -f "Iosevka Nerd Font Complete.ttf" ]; then
    wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Regular/complete/Iosevka%20Nerd%20Font%20Complete.ttf"
    wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Iosevka/Bold/complete/Iosevka%20Bold%20Nerd%20Font%20Complete.ttf"
fi

# Regenerate font cache.
fc-cache
