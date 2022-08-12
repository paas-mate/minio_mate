#!/bin/bash

mkdir -p $MINIO_HOME/logs
nohup $MINIO_HOME/mate/minio_mate >>$MINIO_HOME/logs/minio_mate.log 2>>$MINIO_HOME/logs/minio_mate_error.log

