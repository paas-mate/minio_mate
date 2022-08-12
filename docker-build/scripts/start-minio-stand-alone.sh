#!/bin/bash

mkdir -p $MINIO_HOME/logs
nohup minio server $MINIO_HOME/data >>$MINIO_HOME/logs/minio.stdout.log 2>>$MINIO_HOME/logs/minio.stderr.log &

