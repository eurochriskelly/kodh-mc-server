#!/bin/bash
#

## Allowed reports are achievements andtimee
# Ask user which report to view.
echo "Select a report:"
echo "1. achievements"
echo "2. time spent on server"
echo -n "> "
read choice

case $choice in 
  1|ach|achievements)
    bash scripts/achievements.sh
    ;;
  2|time|timespent)
    bash scripts/summarize-time.sh
    ;;
  *)
    echo "Unknown optin"
    ;;
esac
