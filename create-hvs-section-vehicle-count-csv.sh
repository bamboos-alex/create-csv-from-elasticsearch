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
PREFIX=check-vehicle-section-speed-

#DATE="2024-02-06 01:00"
YEAR="${TIMESTAMP:0:4}"
MONTH="${TIMESTAMP:4:2}"
DAY="${TIMESTAMP:6:2}"
HOUR="${TIMESTAMP:8:2}"
DATE="$YEAR-$MONTH-$DAY $HOUR:00"

TARGET_FILE=$IN_DATE/$PREFIX$TIMESTAMP*.json

#echo "$TARGET_FILE"
#echo "$DATE"

# TODO 1000 대가 넘어갈 경우 콤마 유실?
cat $TARGET_FILE | grep -E "sectionId" | sort | uniq -c | awk -F "\"" '{print $4 $1}' | awk -F " " -v date="$DATE, " '{ print (date $1", " $2)  }'
