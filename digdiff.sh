#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: domain ip"
  exit;
fi

while [ i=1 ]
domain=$1
target=$2
do
  echo "domain: $domain"
  entry1=$(dig $1 | awk '/^'$1'/ {print $5}')
  if [ "$entry1" = "$target" ]; then
    $(growlnotify -s --appIcon iTerm -m "Update complete!")
    echo $entry1
    break;
  fi
  echo "current: $entry1 | target: $target"
  sleep 60
done
