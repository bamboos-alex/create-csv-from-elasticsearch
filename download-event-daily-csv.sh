#!/bin/bash
cd `dirname $0`
HOME_DIR=`pwd`

IP=127.0.0.1
PORT=5601

#FROM=2024-01-30
#TO=2024-01-31

FROM=$1
TO=$2

#echo "${FROM}"

CSV_FILE_PATH=`cat response-${FROM}.json | grep path | awk -F " " '{print $2}' | awk -F "\"" '{print $2}'`

#echo ${CSV_FILE_PATH}

wget -O event-${FROM}.csv "http://${IP}:${PORT}${CSV_FILE_PATH}"

#echo "event-${TO}.csv"
