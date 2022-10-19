#!/bin/bash

DIR="$( cd "$( dirname "$0"  )" && pwd  )"
mkdir -p $MINIO_HOME/logs
if [ $CLUSTER_ENABLE == "true" ]; then
    bash -x $DIR/start-minio-cluster.sh
else
    bash -x $DIR/start-minio-standalone.sh
fi
