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
CONTEXT_PATH="http://127.0.0.1:5601/api/reporting/generate/csv?jobParams=(conflictedTypesFields:!(),fields:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId),indexPatternId:%2730617e80-d644-11ee-87f3-29fd09b1fcb4%27,metaFields:!(_source,_id,_type,_index,_score),searchRequest:(body:(_source:(excludes:!(),includes:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId)),docvalue_fields:!((field:createdAt,format:date_time)),query:(bool:(filter:!((match_all:()),(range:(createdAt:(format:strict_date_optional_time,gte:%27${FROM}T00:00:00.000Z%27,lte:%27${TO}T00:00:00.000Z%27)))),must:!(),must_not:!(),should:!())),script_fields:(),sort:!((createdAt:(order:asc,unmapped_type:boolean))),stored_fields:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId),version:!t),index:%27event_history-*%27),title:event,type:search)"

curl -s -X POST  -H "kbn-xsrf: reporting" ${CONTEXT_PATH} | python3 -m json.tool > response-${FROM}.json

#echo "response-${TO}.json"

