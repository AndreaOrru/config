#!/bin/bash

set -e

# Disable timeout for sudo password prompt.
echo "Defaults passwd_timeout=0" | sudo tee /etc/sudoers.d/01_notimeout
sudo chmod 440 /etc/sudoers.d/01_notimeout
