#!/bin/bash

set -e

# Disable timeout (launch Arch directly).
sudo sed -i 's/timeout 3/timeout 0/' /boot/loader/loader.conf
