#!/bin/bash

set -e

# Enable service.
sudo systemctl enable --now ufw.service

# Deny all incoming connections by default.
sudo ufw default deny

# Allow SSH connections from local network.
sudo ufw allow from 192.168.1.0/24 to any app SSH
# Allow some other apps.
sudo ufw allow Dropbox
sudo ufw allow Transmission

# Enable the firewall.
sudo ufw enable
