#!/bin/bash

# Terminate already running compton instances
killall -q redshift-gtk

# Wait until the processes have been shut down
while pgrep -u $UID -x redshift-gtk >/dev/null; do sleep 1; done

# Launch compton in background, using default config location ~/.config/compton/compton.conf
redshift-gtk

echo "Redshift launched..."
