#!/bin/bash
cd `dirname $0`
PWD=`pwd`

if [[ $# -ne 2 ]]; then
  echo "Usage: $0 {from_date} {to_date}"
  echo "e.g., $0 20240206 20240209"
  exit -1
fi


FROM=$1
TO=$2

DATE_CMD=date
TARGET_DIR=./cas

mkdir -p $TARGET_DIR

echo "create cas vehicle count daily csv files from $FROM to $TO ..."
TO_PLUS_ONE_DAY=$($DATE_CMD --date "$TO + 1 day" +"%Y%m%d")

while [[ "$FROM" != "$TO_PLUS_ONE_DAY" ]]; do
  echo "$FROM"
  echo "timstamp, detector_id, vehicle_count" > $TARGET_DIR/cas-vehicle-count-$FROM.csv
  ./create-cas-vehicle-count-csv-daily.sh $FROM >> $TARGET_DIR/cas-vehicle-count-$FROM.csv

  FROM=$($DATE_CMD --date "$FROM + 1 day" +"%Y%m%d")
done

