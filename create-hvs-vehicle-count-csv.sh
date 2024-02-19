#!/bin/bash

cd `dirname $0`
PWD=`pwd`

if [[ $# -ne 2 ]]; then

  echo "Usage: $0 {in_date} {in_hour}"
  echo "e.g., $0 20240206 01"
  exit -1
fi

IN_DATE=$1
IN_HOUR=$2

#echo "IN_DATE=$IN_DATE, IN_HOUR=$IN_HOUR"

TIMESTAMP=$IN_DATE$IN_HOUR
PREFIX=hvs-detected-vehicle-count-

HVS_PREFIX="04-|07-|20-"

#DATE="2024-02-06 01:00"
YEAR="${TIMESTAMP:0:4}"
MONTH="${TIMESTAMP:4:2}"
DAY="${TIMESTAMP:6:2}"
HOUR="${TIMESTAMP:8:2}"
DATE="$YEAR-$MONTH-$DAY $HOUR:00"

TARGET_FILE=$IN_DATE/$PREFIX$TIMESTAMP*.txt

#echo "$TARGET_FILE"
#echo "$DATE"

cat $TARGET_FILE | grep -E "04-|07-|20-" | awk -F " " -v date="$DATE, " '{ print (date "HVS-"$2"," , $1 )  }'




