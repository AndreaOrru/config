#!/bin/bash

set -e

# Disable timeout (launch Arch directly).
sudo sed -i 's/timeout 3$/timeout 0/' /boot/loader/loader.conf

# Enable systemd-boot-update service.
sudo systemctl enable --now systemd-boot-update.service
