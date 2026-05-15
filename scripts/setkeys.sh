#!/usr/bin/env bash

# Find the device ID for "Neo Ergo Keyboard"
device_id=$(xinput list | grep -i "Neo Ergo Keyboard" | grep -oP 'id=\K\d+' | head -n 1)

# Check if the device was found
if [ -z "$device_id" ]; then
    echo "Error: Neo Ergo Keyboard not found"
    exit 1
fi

# Apply the keyboard layout to the specific device
setxkbmap us -variant altgr-intl -device "$device_id"

echo "Applied US altgr-intl layout to Neo Ergo Keyboard (device ID: $device_id)"
