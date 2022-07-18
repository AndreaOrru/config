#!/bin/bash

set -e

# Install Rust using Rustup.
if [ ! -d ~/.rustup ]; then
    paru -Rns --noconfirm rust || true
    paru -S --needed --noconfirm rustup
    rustup self upgrade-data
    rustup default nightly
fi
