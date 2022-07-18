#!/bin/bash

set -e

# Set the default shell to zsh.
DEFAULT_SHELL=$(getent passwd andrea | awk -F: '{print $NF}')
if [ $DEFAULT_SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi
