#!/bin/bash

set -e

wait_for() {
    echo "Waiting for Dropbox to sync..."
    until [ -f "$HOME/Dropbox/$1" ]; do
        sleep 1
    done
}

# Copy ssh keys.
wait_for ".ssh/id_rsa"
cp -a ~/Dropbox/.ssh ~/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/*

# Copy GitHub keys.
wait_for ".hub"
cp ~/Dropbox/.hub ~/.config/hub
chmod 600 ~/.config/hub
