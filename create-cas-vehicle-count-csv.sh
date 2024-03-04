#!/bin/bash

cd `dirname $0`
PWD=`pwd`

if [[ $# -ne 2 ]]; then

  echo "Usage: $0 {in_date} {in_hour}"
  echo "e.g., $0 20240206 01"
  exit -1
fi

DATE_CMD=date

IN_DATE=$1
IN_HOUR=$2

#echo "IN_DATE=$IN_DATE, IN_HOUR=$IN_HOUR"

TIMESTAMP=$IN_DATE$IN_HOUR
PREFIX=CAS-

FRONT_IMAGE_POSTFIX="_F"

#DATE="2024-02-06 01:00"
YEAR="${TIMESTAMP:0:4}"
MONTH="${TIMESTAMP:4:2}"
DAY="${TIMESTAMP:6:2}"
HOUR="${TIMESTAMP:8:2}"
DATE="$YEAR-$MONTH-$DAY $HOUR:00"

TARGET_FILE=$IN_DATE/$PREFIX$TIMESTAMP*.txt

#echo "$TARGET_FILE"
#echo "$DATE"

SHIFT_DATE=$($DATE_CMD --date "$DATE 1 hour ago" +"%Y-%m-%d %H:%M")
#echo "$SHIFT_DATE"

cat $TARGET_FILE | grep -E "$FRONT_IMAGE_POSTFIX" | awk -F"_" '{print $2 }' | sort | uniq -c | awk -F " " -v date="$SHIFT_DATE, " '{ print (date "CAS-"substr($2,0,2)"-"substr($2,3,2)",", $1) }'




