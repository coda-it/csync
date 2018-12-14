#!/bin/bash

GROUP_FILTER=$1
OPS_COUNT=$(sed -n "/^.*;.*\(;smarthome\)\{0,1\}$/ =" ~/.csync | tail -n 1)

echo "csync will perform $OPS_COUNT number of operations"

while IFS=";" read -r p || [ -n "$p" ]
do
  FROM=$(echo $p | cut -d ";" -f 1)
  TO=$(echo $p | cut -d ";" -f 2)
  GROUP=$(echo $p | cut -d ";" -f 3)

  if [[ -z "$GROUP_FILTER" || ( -n "$GROUP_FILTER" && ( -z "$GROUP" || "$GROUP" == "$GROUP_FILTER" ) ) ]]
  then
    echo "Syncing... () $FROM > $TO"
    rsync --stats --delete -azh -r $FROM/* $TO/
  else
    echo "Skipping... $FROM > $TO"
  fi
done < ~/.csync