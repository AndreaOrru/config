#!/bin/bash

set -e

# Enable Bluetooth service.
sudo systemctl enable --now bluetooth.service
