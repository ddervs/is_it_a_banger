#!/bin/bash

SEGMENT_TIME=5 # in seconds
DIRS=( "../data/banger/" "../data/not_a_banger/" ) 

for DIR in "${DIRS[@]}"
do
    for FILE in "${DIR}"*.mp3
    do
        echo "Processing ${FILE}"
        ffmpeg -i "${FILE}" -f segment -segment_time ${SEGMENT_TIME} -c copy "${FILE%.*}"%03d.wav                
        rm "${FILE}"
        rm "$(ls -t "${FILE%.*}"*.wav | tail -n 1)" # remove last file so uniform length
    done
done
