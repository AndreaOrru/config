#!/bin/bash

set -e

# Upgrade system.
sudo pacman -Syu

# Install hardware-specific packages.
paru -Rns --noconfirm intel-media-driver || true
paru -S --needed --noconfirm  \
    intel-hybrid-codec-driver \
    libva-intel-driver-hybrid

# Install terminal utils.
paru -S --needed --noconfirm \
    autojump                 \
    autossh                  \
    bat                      \
    fd                       \
    fzf                      \
    grml-zsh-config          \
    gron                     \
    jq                       \
    lsd                      \
    man-db                   \
    man-pages                \
    neovim                   \
    plocate                  \
    ranger                   \
    ripgrep                  \
    stow                     \
    the_silver_searcher      \
    tmux                     \
    tmux-plugin-manager-git  \
    tree                     \
    unp                      \
    zsh

# Install developer tools.
paru -S --needed --noconfirm \
    clang                    \
    cloc                     \
    cmake                    \
    difftastic               \
    emacs-nativecomp         \
    gdb                      \
    git-delta                \
    git-extras               \
    hub                      \
    scons                    \
    sqlite

# Install GUI resources and tools.
paru -S --needed --noconfirm            \
    dconf-editor                        \
    gnome-shell-extension-topicons-plus \
    ibus-mozc                           \
    libva-utils                         \
    noto-fonts                          \
    noto-fonts-cjk                      \
    ttf-croscore                        \
    ttf-crosextra                       \
    ttf-dejavu                          \
    ttf-iosevka-nerd                    \
    xcape                               \
    xsel

# Install graphical apps.
paru -S --needed --noconfirm    \
    alacritty                   \
    anki-official-binary-bundle \
    dropbox                     \
    google-chrome               \
    mpv                         \
    mullvad-vpn-bin             \
    telegram-desktop            \
    spotify                     \
    yt-dlp

# Install Python packages.
paru -S --needed --noconfirm \
    ipython                  \
    python-pdbpp             \
    python-pip               \
    python-virtualenvwrapper

# Uninstall Gnome Terminal.
paru -Rns --noconfirm gnome-terminal || true
