#!/bin/bash

mkdir $MINIO_HOME/data

DATA_CMD=""
# CONCAT MINIO CMD
if [[ -z $MINIO_NUMBER ]]
then
  MINIO_NUMBER=4
fi

for ((i=0; i<MINIO_NUMBER; i++))
do
  AUX="http://minio-${i}.minio:9000$MINIO_HOME/data"
  DATA_CMD="$DATA_CMD $AUX"
done

mkdir -p $MINIO_HOME/logs
if [ -z "$MINIO_DELVE_DEBUG" ] || [ $MINIO_DELVE_DEBUG == "false" ]; then
  nohup minio server --address ${POD_NAME}.minio:9000  $DATA_CMD >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
else
  nohup dlv --listen=:2345 --headless=true --api-version=2 exec minio server $DATA_CMD >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
fi
