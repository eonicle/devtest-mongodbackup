#!/bin/bash

set -e

#CRON_SCHEDULE=* */1 * * *
LOGFIFO='/var/log/cron.fifo'
if [[ ! -e "$LOGFIFO" ]]; then
  mkfifo "$LOGFIFO"
fi
CRON_ENV="MONGO_PORT_27017_TCP_ADDR='$MONGO_PORT_27017_TCP_ADDR'"
CRON_ENV="$CRON_ENV\nMONGO_PORT_27017_TCP_PORT='$MONGO_PORT_27017_TCP_PORT'"
echo -e "$CRON_ENV\n$CRON_SCHEDULE /backup.sh > $LOGFIFO 2>&1\n$CRON_SCHEDULE ls /backup -t | tail -n +6 | xargs -I {} rm -- {} > $LOGFIFO 2>&1 " | crontab -
crontab -l
cron
tail -f "$LOGFIFO"
