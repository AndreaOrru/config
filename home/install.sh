#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Execute all the configuration scripts.
pushd scripts
    for script in $(find . -type f -executable | sort); do
        $script || exit 1
    done
popd

# Link configuration files.
pushd config
    for dir in $(ls); do
        stow -t ~ $dir
    done
popd

# Configure GNOME.
./dconf/install.sh
