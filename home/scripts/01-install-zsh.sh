#!/bin/sh

# Download grml's zsh configuration.
[ ! -f ~/.zshrc ] && wget -O ~/.zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc

# Set the default shell to zsh.
DEFAULT_SHELL=$(getent passwd andrea | awk -F: '{print $NF}')
if [ $DEFAULT_SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi
