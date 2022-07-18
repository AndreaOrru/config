#!/bin/bash

set -e

# Install Rust using Rustup.
if [ ! -d ~/.rustup ]; then
    if pacman -Q rust &>/dev/null; then
        paru -Rns --noconfirm rust
    fi
    paru -S --needed --noconfirm rustup
    rustup self upgrade-data
    rustup default nightly
fi
