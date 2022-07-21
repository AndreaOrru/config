#!/bin/bash

set -e

# Disable password authentication.
sudo sed -i 's/^#PasswordAuthentication yes$/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl enable --now sshd.service
