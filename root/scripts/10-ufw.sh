#!/bin/bash

set -e

sudo systemctl enable --now ufw.service
sudo ufw default deny
sudo ufw limit SSH
sudo ufw allow Dropbox
sudo ufw allow Transmission
sudo ufw enable
