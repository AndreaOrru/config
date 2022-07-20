#!/bin/bash

set -e

# Upgrade system.
sudo pacman -Syu

# Install hardware-specific packages.
if pacman -Q intel-media-driver &>/dev/null; then
    paru -Rns --noconfirm intel-media-driver libva-intel-driver
fi
paru -S --needed --noconfirm  \
    bluez bluez-utils         \
    intel-hybrid-codec-driver \
    libva-intel-driver-hybrid \
    libva-utils

# Install Arch-specific packages.
paru -S --needed --noconfirm \
    aurvote                  \
    downgrade

# Install terminal utils.
if pacman -Q vim &>/dev/null; then
    paru -Rns --noconfirm vim
fi
paru -S --needed --noconfirm         \
    autojump                         \
    autossh                          \
    bat                              \
    fd                               \
    fzf                              \
    htop lsof                        \
    jq gron                          \
    lsd                              \
    man-db man-pages                 \
    neovim                           \
    plocate                          \
    ranger atool                     \
    ripgrep the_silver_searcher      \
    stow                             \
    tmux tmux-plugin-manager-git     \
    tree                             \
    unp p7zip unrar                  \
    zsh zsh-completions              \
    zsh-theme-powerlevel10k          \
    zsh-fast-syntax-highlighting-git \
    grml-zsh-config

# Install developer tools.
paru -S --needed --noconfirm \
    clang llvm               \
    cloc                     \
    cmake scons              \
    difftastic               \
    emacs-nativecomp         \
    gdb lldb                 \
    git-delta git-extras hub \
    rust-analyzer            \
    sqlite

# Install GUI resources and tools.
paru -S --needed --noconfirm            \
    dconf-editor                        \
    gnome-shell-extension-appindicator  \
    gnome-shell-extension-topicons-plus \
    gnome-themes-extra                  \
    gvfs-mtp                            \
    ibus-mozc                           \
    noto-fonts noto-fonts-extra         \
    noto-fonts-cjk                      \
    poppler-data                        \
    ttf-croscore ttf-crosextra          \
    ttf-dejavu ttf-roboto               \
    ttf-iosevka-nerd                    \
    xcape                               \
    xsel

# Install graphical apps.
paru -S --needed --noconfirm    \
    alacritty                   \
    anki-official-binary-bundle \
    dropbox                     \
    firefox                     \
    gimp                        \
    google-chrome               \
    mpv yt-dlp                  \
    mullvad-vpn-bin             \
    spotify playerctl           \
    telegram-desktop            \
    transmission-gtk

# Install Python packages.
paru -S --needed --noconfirm \
    ipython                  \
    python-black             \
    python-pdbpp             \
    python-pip               \
    python-virtualenvwrapper

# Uninstall Gnome Terminal.
if pacman -Q gnome-terminal &>/dev/null; then
    paru -Rns --noconfirm gnome-terminal
fi
