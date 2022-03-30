#!/bin/sh

pgrep -x xcape || xcape -e 'Caps_Lock=Escape'
