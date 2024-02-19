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

CONTEXT_PATH="http://${IP}:${PORT}/api/reporting/generate/csv?jobParams=(conflictedTypesFields:!(),fields:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId),indexPatternId:fa6e4660-cb2a-11ee-9b77-7724c72f27e9,metaFields:!(_source,_id,_type,_index,_score),searchRequest:(body:(_source:(excludes:!(),includes:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId)),docvalue_fields:!((field:createdAt,format:date_time)),query:(bool:(filter:!((match_all:()),(range:(createdAt:(format:strict_date_optional_time,gte:%27${FROM}T15:00:00.000Z%27,lte:%27${TO}T15:00:00.000Z%27)))),must:!(),must_not:!(),should:!())),script_fields:(),sort:!((createdAt:(order:asc,unmapped_type:boolean))),stored_fields:!(createdAt,type,subType,facilityType,facilityName,roadNo,laneNo,milestone,direction,properties.directionPlaceName,properties.sectionName,properties.vehicleType,properties.speed,properties.licensePlate,properties.outbreakId),version:!t),index:%27event_history-*%27),title:event-day,type:search)"

curl -s -X POST  -H "kbn-xsrf: reporting" ${CONTEXT_PATH} | python3 -m json.tool > response-${TO}.json

#echo "response-${TO}.json"

