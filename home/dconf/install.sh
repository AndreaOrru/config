#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))

# Apply configuration.
dconf load / < config
