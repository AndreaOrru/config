#!/bin/sh

set -e
cd $(dirname $(readlink -f $0))

# Reset and apply configuration.
dconf reset -f /
dconf load / < config
