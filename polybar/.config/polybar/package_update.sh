#!/bin/bash

if ! updates_arch=$( checkupdates 2> /dev/null | wc -l ); then
  updates_arch=0
fi

if ! updates_aur=$( yay -Qum 2> /dev/null | wc -l ); then
  updates_aur=0
fi

updates=$(( "$updates_arch" + "$updates_aur" ))

if [ "$updates" -eq 1 ]; then
  echo "$updates update available"
elif [ "$updates" -gt 1 ]; then
  echo "$updates updates available"
else
  echo ""
fi
