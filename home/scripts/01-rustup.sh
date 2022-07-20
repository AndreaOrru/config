#!/bin/bash

set -e

# Install Rust using Rustup.
if [ ! -d ~/.rustup ]; then
    if [ "$(pacman -Qq rust)" == "rust" ]; then
        paru -Rnsdd --noconfirm rust
    fi
    paru -S --needed --noconfirm rustup
    rustup self upgrade-data
    rustup default nightly
fi
