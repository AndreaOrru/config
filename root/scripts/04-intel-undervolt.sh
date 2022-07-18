#!/bin/bash

set -e

# Enable the undervolt daemon.
sudo systemctl enable --now intel-undervolt.service
