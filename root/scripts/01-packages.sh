#!/bin/bash

set -e

# Upgrade system.
sudo pacman -Syu

# Install terminal utils.
paru -S --needed --noconfirm \
    autojump                \
    autossh                 \
    bat                     \
    fd                      \
    fzf                     \
    gron                    \
    intel-undervolt         \
    jq                      \
    neovim                  \
    plocate                 \
    ranger                  \
    ripgrep                 \
    stow                    \
    the_silver_searcher     \
    tmux                    \
    tmux-plugin-manager-git \
    tree                    \
    unp                     \
    zsh

# Install developer tools.
paru -S --needed --noconfirm \
    clang                    \
    cloc                     \
    cmake                    \
    emacs-nativecomp         \
    gdb                      \
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
paru -S --needed --noconfirm \
    dropbox                  \
    google-chrome            \
    mpv                      \
    mullvad-vpn-bin          \
    telegram-desktop         \
    spotify                  \
    yt-dlp

# Install Python packages.
paru -S --needed --noconfirm \
    ipython                  \
    python-pdbpp             \
    python-pip               \
    python-virtualenvwrapper
