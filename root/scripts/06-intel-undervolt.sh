#!/bin/bash

set -e

# Enable intel-undervolt service.
sudo systemctl enable --now intel-undervolt.service
