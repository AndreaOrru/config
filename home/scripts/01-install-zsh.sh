#!/bin/sh

set -e

# Download grml's zsh configuration.
if [ ! -f ~/.zshrc ]; then
    wget -O ~/.zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
fi

# Set the default shell to zsh.
DEFAULT_SHELL=$(getent passwd andrea | awk -F: '{print $NF}')
if [ $DEFAULT_SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi
