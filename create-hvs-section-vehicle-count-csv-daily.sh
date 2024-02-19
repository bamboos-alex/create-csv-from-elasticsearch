#!/bin/bash
cd `dirname $0`
PWD=`pwd`

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 {date}"
  echo "e.g., $0 20240206"
  exit -1
fi


DAY=$1

DATE_CMD=gdate

#echo "create hvs vehicle count daily csv file for $DAY ..."

FROM_HOUR=00
TO_HOUR=00
HOUR=${FROM_HOUR}

while [[ true ]]; do
#echo "$DAY $HOUR"

  ./create-hvs-section-vehicle-count-csv.sh $DAY $HOUR

  HOUR=$($DATE_CMD --date "$HOUR + 1 hour" +"%H")
  if [[ "10#$HOUR" -eq "10#$TO_HOUR" ]]; then
    break;
  fi 
done





