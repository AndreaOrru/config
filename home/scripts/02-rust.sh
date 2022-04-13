#!/bin/bash

set -e

# Install Rust.
if [ ! -d ~/.cargo ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
        --default-toolchain nightly --no-modify-path -y
fi

# Install Rust packages.
source ~/.cargo/env
cargo install  \
    difftastic \
    git-delta  \
    lsd
