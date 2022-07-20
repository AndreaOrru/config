#!/bin/bash

set -e

sudo mkdir -p /var/lib/gdm/.config
sudo cp ~/.config/monitors.xml /var/lib/gdm/.config/
sudo chown -R gdm:gdm /var/lib/gdm/.config
