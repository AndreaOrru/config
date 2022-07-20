#!/bin/bash

set -e

sudo sed -i 's/^#ListenAddress 0.0.0.0$/ListenAddress 127.0.0.1/' /etc/ssh/sshd_config
sudo sed -i 's/^#PasswordAuthentication yes$/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl enable --now sshd.service
