#!/bin/sh

# NOTE: Create everything in /dev/shm and run entrypoint script to symlink to config
# Needed for: 
# https://github.com/OpenZWave/python-openzwave/blob/cdae95f601fef9a935903906eb02e1d9e4f702d1/src-lib/libopenzwave/libopenzwave.pyx#L703
# Home Assistant sets it to:
# https://github.com/home-assistant/home-assistant/blob/8ec75cf88371253c87ff2973856dbe31819c6134/homeassistant/components/zwave/__init__.py#L288

# Also hass makes /deps dir, HA_VERSION file and onboarding file

# Skip when no config mounted, just run with defaults
if [ -d "/config" ]; then
    for file in /config; do
        ln -sf /dev/shm/$file /config/$file 
    done
fi

# Start home assistant
exec "$@"