#!/bin/bash

set -e

echo "Backup started: $(date)"

DATE=$(date +%Y-%m-%d_%H-%M)
FILE="/backup/backup-$DATE.tar.gz"

mongodump --quiet -h $MONGO_PORT_27017_TCP_ADDR -p $MONGO_PORT_27017_TCP_PORT
tar -zcvf $FILE dump/
rm -rf dump/

echo "Backup finished: $(date)"
