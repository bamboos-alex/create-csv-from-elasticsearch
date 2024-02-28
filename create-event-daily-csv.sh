#!/bin/bash
cd `dirname $0`
HOME_DIR=`pwd`

WAIT_SECONDS=60

DATE_CMD=gdate

if [ $# -ne 1 ]; then
  echo "Usage: $0 {target-day} "
  echo "e.g., $0 2024-02-01"
  exit -1
fi

#FROM=2024-02-01
#TO=2024-01-31
FROM=$1
TO=$($DATE_CMD --date "$FROM + 1 day" +"%Y-%m-%d")

echo "${FROM} ${TO}"

./request-event-daily-csv.sh ${FROM} ${TO}

echo "wait... ${WAIT_SECONDS} seconds"

sleep ${WAIT_SECONDS}

./download-event-daily-csv.sh ${FROM} ${TO}

echo "event-${FROM}.csv"
