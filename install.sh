#!/bin/sh

set -e
cd $(dirname $(readlink -f $0))

./root/install.sh
./home/install.sh
