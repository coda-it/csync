#!/bin/bash

GROUP_FILTER=$1
OPS_COUNT=$(sed -n "/^.*;.*\(;$GROUP_FILTER\)\{0,1\}$/ =" ~/.csync | tail -n 1)

echo "csync will perform $OPS_COUNT number of operations"

while IFS=";" read -r p || [ -n "$p" ]
do
  FROM=$(echo $p | cut -d ";" -f 1)
  TO=$(echo $p | cut -d ";" -f 2)
  MODE=$(echo $p | cut -d ";" -f 3)
  GROUP=$(echo $p | cut -d ";" -f 4)

  if [[ "$MODE" == "backup" ]]
  then
    SYNC_MODE="Backing up"
    DELETE_FLAG=""
  else
    SYNC_MODE="Syncing"
    DELETE_FLAG="--delete"
  fi

  if [[ -z "$GROUP_FILTER" || ( -n "$GROUP_FILTER" && ( -z "$GROUP" || "$GROUP" == "$GROUP_FILTER" ) ) ]]
  then
    echo "$SYNC_MODE ... $FROM > $TO"
    rsync --stats $DELETE_FLAG -azh -r "$FROM/" "$TO/"
  else
    echo "Skipping ... $FROM > $TO"
  fi
done < ~/.csync