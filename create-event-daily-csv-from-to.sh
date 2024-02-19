#!/bin/bash
cd `dirname $0`
HOME_DIR=`pwd`

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 {from_date} {to_date}"
  echo "e.g., $0 2024-02-01 2024-02-09"
  exit -1
fi


FROM=$1
TO=$2

DATE_CMD=gdate

echo "create event daily csv files from $FROM to $TO ..."
TO_PLUS_ONE_DAY=$($DATE_CMD --date "$TO + 1 day" +"%Y-%m-%d")


while [[ "$FROM" != "$TO_PLUS_ONE_DAY" ]]; do
#  echo "$FROM"
  ./create-event-daily-csv.sh $FROM
  FROM=$($DATE_CMD --date "$FROM + 1 day" +"%Y-%m-%d")
done


echo "finished!"

