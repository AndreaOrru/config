#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Link configuration files.
for dir in `ls -d */`; do
    stow -R -t ~ $dir
done
