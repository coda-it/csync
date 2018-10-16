#!/bin/bash

while IFS=";" read -r p || [ -n "$p" ]
do
  FROM=$(echo $p | cut -d ";" -f 1)
  TO=$(echo $p | cut -d ";" -f 2)
  rsyncc -r $FROM/* $TO/
done < ~/.csync
