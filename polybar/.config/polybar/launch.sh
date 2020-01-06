#!/bin/bash

killall -q polybar

while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ $m == 'eDP1' ]
    then
      echo "eDP1 only"
      MONITOR=$m polybar --reload MainBar &
    elif [ $m == 'HDMI1' ]
    then
      echo "eDP1 and HDMI1"
      MONITOR=$m polybar --reload SubBar1 &
    elif [ $m == 'DP2-3' ]
    then
      echo "eDP1 and DP2-3"
      MONITOR=$m polybar --reload SubBar1 &
    else
      echo "else"
      polybar --reload MainBar &
    fi
  done
fi

nitrogen --restore
echo "bars launched..."
