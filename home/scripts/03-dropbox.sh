#!/bin/bash

set -e

if [ ! -d ~/.dropbox ]; then
    BROWSER=firefox dropbox start -i &
fi
