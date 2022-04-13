#!/bin/sh

set -e
cd $(dirname $(readlink -f $0))

# Configure repositories.
DEBIAN_VERSION=$(cat /etc/debian_version | cut -d '/' -f 1)
grep "^deb " /etc/apt/sources.list | sed "s/${DEBIAN_VERSION}/testing/" | sudo tee /etc/apt/sources.list
wget -q -O - http://emacs.secretsauce.net/key.gpg | sudo apt-key add -
wget -q -O - https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -
echo "deb [arch=amd64] http://emacs.secretsauce.net unstable main" | sudo tee /etc/apt/sources.list.d/emacs.list
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

# Install packages.
sudo apt update
sudo apt full-upgrade
sudo apt install -y                      \
    autojump                             \
    autossh                              \
    bat                                  \
    clang                                \
    clang-format                         \
    clangd                               \
    cloc                                 \
    cmake                                \
    curl                                 \
    dconf-editor                         \
    emacs-snapshot-nox                   \
    fd-find                              \
    fonts-croscore                       \
    fonts-crosextra-caladea              \
    fonts-crosextra-carlito              \
    fonts-noto                           \
    fzf                                  \
    gdb                                  \
    git                                  \
    git-extras                           \
    gnome-shell-extension-top-icons-plus \
    gron                                 \
    hub                                  \
    ibus-mozc                            \
    intel-media-va-driver-non-free       \
    intel-microcode                      \
    ipython3                             \
    jq                                   \
    mpv                                  \
    neovim                               \
    plocate                              \
    python3-gpg                          \
    python3-pip                          \
    ranger                               \
    ripgrep                              \
    scons                                \
    silversearcher-ag                    \
    spotify-client                       \
    stow                                 \
    telegram-desktop                     \
    tmux                                 \
    tmux-plugin-manager                  \
    tree                                 \
    unp                                  \
    vainfo                               \
    virtualenvwrapper                    \
    xcape                                \
    xsel                                 \
    zsh

# Install TLP packages.
sudo apt install -y   \
    tlp               \
    tlp-rdw           \
    acpi-call-dkms    \
    linux-cpupower    \
    smartmontools     \
    tp-smapi-dkms

# Install Python packages.
sudo pip3 install -U   \
    pdbpp              \
    undervolt          \
    youtube-dl

# Install Google Chrome.
if [ ! -f /etc/apt/sources.list.d/google-chrome.list ]; then
    CHROME_VERSION=$(curl https://omahaproxy.appspot.com/linux)
    CHROME_PACKAGE="google-chrome-stable_${CHROME_VERSION}-1_amd64.deb"
    wget -c "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/${CHROME_PACKAGE}"
    sudo dpkg -i "${CHROME_PACKAGE}"
    sudo apt --fix-broken install
    rm -f "${CHROME_PACKAGE}"
fi

# Install Dropbox.
if [ ! -f /usr/bin/dropbox ]; then
    DROPBOX_VERSION=$(curl "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=dropbox-cli" | grep "^pkgver" | cut -d "=" -f 2)
    DROPBOX_PACKAGE="dropbox_${DROPBOX_VERSION}_amd64.deb"
    wget -c -O ${DROPBOX_PACKAGE} "https://www.dropbox.com/download?dl=packages/ubuntu/${DROPBOX_PACKAGE}"
    sudo dpkg -i "${DROPBOX_PACKAGE}"
    sudo apt --fix-broken install
    rm -f "${DROPBOX_PACKAGE}"
    dropbox start -i
fi
