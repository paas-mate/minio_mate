#!/bin/bash

mkdir -p $MINIO_HOME/logs
if [ -z "$MINIO_DELVE_DEBUG" ] || [ $MINIO_DELVE_DEBUG == "false" ]; then
    nohup minio server $MINIO_HOME/data >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
else
    nohup dlv --listen=:2345 --headless=true --api-version=2 exec minio server $MINIO_HOME/data >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
fi
