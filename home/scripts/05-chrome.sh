#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Enable hardware acceleration in Chrome.
mkdir -p ~/.local/share/applications && cd ~/.local/share/applications
cp /usr/share/applications/google-chrome.desktop .
sed -i 's/^Exec=\/usr\/bin\/google-chrome-stable/Exec=\/usr\/bin\/google-chrome-stable --enable-features=VaapiVideoDecoder --disable-features=UseChromeOSDirectVideoDecoder --use-gl=desktop --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy --force-dark-mode/' google-chrome.desktop
