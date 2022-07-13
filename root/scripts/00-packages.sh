#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Configure repositories.
DEBIAN_VERSION=$(cat /etc/debian_version | cut -d '/' -f 1)
grep "^deb " /etc/apt/sources.list | sed "s/${DEBIAN_VERSION}/testing/" | sudo tee /etc/apt/sources.list
wget -q -O - http://emacs.secretsauce.net/key.gpg | sudo apt-key add -
wget -q -O - https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb [arch=amd64] http://emacs.secretsauce.net unstable main" | sudo tee /etc/apt/sources.list.d/emacs.list
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Update repositories.
sudo apt update
sudo apt full-upgrade

# Install terminal utils.
sudo apt install -y     \
    autojump            \
    autossh             \
    bat                 \
    curl                \
    fd-find             \
    fzf                 \
    gron                \
    jq                  \
    neovim              \
    plocate             \
    ranger              \
    ripgrep             \
    silversearcher-ag   \
    stow                \
    tmux                \
    tmux-plugin-manager \
    tree                \
    unp                 \
    zsh                 \
    zstd

# Install developer tools.
sudo apt install -y    \
    clang              \
    clang-format       \
    clangd             \
    cloc               \
    cmake              \
    emacs-snapshot-nox \
    gdb                \
    git                \
    git-extras         \
    hub                \
    ipython3           \
    python3-gpg        \
    python3-pip        \
    scons              \
    sqlite3            \
    virtualenvwrapper

# Install GUI resources and tools.
sudo apt install -y                      \
    dconf-editor                         \
    fonts-croscore                       \
    fonts-crosextra-caladea              \
    fonts-crosextra-carlito              \
    fonts-noto                           \
    gnome-shell-extension-top-icons-plus \
    ibus-mozc                            \
    intel-media-va-driver-non-free       \
    intel-microcode                      \
    vainfo                               \
    xcape                                \
    xsel

# Install graphical apps.
sudo apt install -y  \
    mpv              \
    telegram-desktop \
    spotify-client

# Install Python packages.
sudo pip3 install -U \
    pdbpp            \
    undervolt

# Install Google Chrome.
if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
    CHROME_VERSION=$(curl https://omahaproxy.appspot.com/linux)
    CHROME_PACKAGE="google-chrome-stable_${CHROME_VERSION}-1_amd64.deb"
    wget -c "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/${CHROME_PACKAGE}"
    sudo dpkg -i "${CHROME_PACKAGE}" || sudo apt --fix-broken install
    rm -f "${CHROME_PACKAGE}"
fi

# Install Dropbox.
if [ ! -f /usr/bin/dropbox ]; then
    DROPBOX_VERSION=$(curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=dropbox-cli" | grep "^pkgver" | cut -d "=" -f 2)
    DROPBOX_PACKAGE="dropbox_${DROPBOX_VERSION}_amd64.deb"
    wget -c -O ${DROPBOX_PACKAGE} "https://www.dropbox.com/download?dl=packages/ubuntu/${DROPBOX_PACKAGE}"
    sudo dpkg -i "${DROPBOX_PACKAGE}" || sudo apt --fix-broken install
    rm -f "${DROPBOX_PACKAGE}"
    dropbox start -i
fi

# Install Mullvad.
if [ ! -f /usr/bin/mullvad ]; then
    wget -c "https://mullvad.net/download/app/deb/latest" -O mullvad.deb
    sudo dpkg -i mullvad.deb
    rm -f mullvad.deb
fi
