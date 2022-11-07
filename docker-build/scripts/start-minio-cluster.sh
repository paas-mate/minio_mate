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

export locationIp=`ip addr | grep inet | grep eth0 | awk '{split($2, arr, "/"); print arr[1]}'`
sed -i 's/localhost/'"${locationIp}"'/g' /root/.s3cfg
mkdir -p $MINIO_HOME/logs
if [ -z "$MINIO_DELVE_DEBUG" ] || [ $MINIO_DELVE_DEBUG == "false" ]; then
  if [ -n "$POD_IP" ]; then
       nohup minio server --address ${POD_IP}:9000 --console-address 0.0.0.0:9001 $DATA_CMD >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
  else
       nohup minio server --address ${POD_NAME}:9000 --console-address 0.0.0.0:9001 $DATA_CMD >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
  fi
else
  nohup dlv --listen=:2345 --headless=true --api-version=2 exec minio server --console-address 0.0.0.0:9001 $DATA_CMD >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &
fi
