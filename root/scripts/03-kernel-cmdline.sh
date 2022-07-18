#!/bin/bash

set -e

CONF_FILES=(/boot/loader/entries/*.conf)

for conf_file in "${CONF_FILES[@]}"; do
    if ! grep -q "mitigations=off" "$conf_file"; then
        sudo sed -i 's/rootfstype=ext4/rootfstype=ext4 mitigations=off/' "$conf_file"
    fi
done
