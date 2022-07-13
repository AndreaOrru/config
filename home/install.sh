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
./files/install.sh

# Configure GNOME.
./dconf/install.sh
