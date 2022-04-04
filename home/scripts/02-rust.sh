#!/bin/sh

set -e

if [ ! -d ~/.cargo ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- \
        --default-toolchain nightly --no-modify-path -y
fi
