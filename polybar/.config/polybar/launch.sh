#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar MainBar &
polybar SubBar &

echo "bars launched..."
