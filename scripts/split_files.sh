#! /bin/bash

SEGMENT_TIME=5
DIR="../data/train/"


for FILE in ${DIR}*.mp3
do
     echo "Processing ${FILE}"
     ffmpeg -i "${FILE}" -f segment -segment_time ${SEGMENT_TIME} -c copy "${FILE%.*}"%03d.mp3                
     rm "${FILE}"
done

