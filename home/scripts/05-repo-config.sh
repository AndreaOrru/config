#!/bin/bash

set -e
cd $(dirname $(readlink -f $0))
cd $(git root)

# Change the url of the config repo so that we can push using SSH keys.
sed -i 's#url = https://github.com/AndreaOrru/config#url = git@github.com:AndreaOrru/config.git#' .git/config
