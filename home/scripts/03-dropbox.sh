#!/bin/bash

set -e

if [ ! -d ~/.dropbox ]; then
    dropbox start -i &
fi
