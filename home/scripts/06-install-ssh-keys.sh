#!/bin/sh

set -e

echo "Waiting until Dropbox has synced..."
until [ -f ~/Dropbox/.ssh/id_rsa ]; do
    sleep 1
done

# Copy ssh keys.
cp -a ~/Dropbox/.ssh ~/
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_rsa
