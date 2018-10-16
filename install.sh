#!/bin/bash

#install sync globally
cp ./csync.sh /usr/local/bin/
mv /usr/local/bin/csync.sh /usr/local/bin/csync
chmod 755 /usr/local/bin/csync

#add cron job
line="* * * * * csync"
(crontab -u $USER -l; echo "$line" ) | crontab -u $USER -
