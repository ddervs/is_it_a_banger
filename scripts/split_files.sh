#!/bin/bash

SEGMENT_TIME=5 # in seconds
DATA_ROOT_DIR="../data"

DIRS=$(find "${DATA_ROOT_DIR}" -maxdepth 1 -mindepth 1 -type d)

# Make sure globstar is enabled
shopt -s globstar

for FILE in "${DATA_ROOT_DIR}"/**/*.mp3
do 
    echo "Processing ${FILE}"
    ffmpeg -i "${FILE}" -f segment -segment_time ${SEGMENT_TIME} -c copy "${FILE%.*}"%03d.wav                
    rm "${FILE}"
    rm "$(ls -t "${FILE%.*}"*.wav | tail -n 1)" # remove last file so uniform length
done

