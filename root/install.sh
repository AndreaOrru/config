#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Copy the content of all folders to /.
pushd files
    find . -mindepth 2 -maxdepth 2 -type d -exec \
        sudo cp -a --no-preserve=ownership --remove-destination {} / \;
popd

# Execute all the configuration scripts.
pushd scripts
    for script in $(find . -type f -executable | sort); do
        $script || exit 1
    done
popd
