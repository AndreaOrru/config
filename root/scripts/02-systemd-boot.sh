#!/bin/bash

set -e

sudo sed -i 's/timeout 3/timeout 0/' /boot/loader/loader.conf
