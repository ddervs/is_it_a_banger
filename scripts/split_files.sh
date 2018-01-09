#!/bin/bash
#
# Usage: ./splitfiles.sh $SEGMENT_TIME $DATA_ROOT_DIR
# 
# clip mp3 files (recursively) in $DATA_ROOT_DIR to .wav files of length $SEGMENT_TIME  
#
# $SEGMENT_TIME is length of *.wav clips
# $DATA_ROOT_DIR is root directory of mp3 audio data

SEGMENT_TIME=$1  
DATA_ROOT_DIR="$2"

# Make sure globstar is enabled
shopt -s globstar

for FILE in "${DATA_ROOT_DIR}"/**/*.mp3
do 
    echo "Processing ${FILE}"
    ffmpeg -i "${FILE}" -f segment -segment_time ${SEGMENT_TIME} -c copy "${FILE%.*}\_"%03d.wav                
    rm "${FILE}"
    rm "$(ls -t "${FILE%.*}"*.wav | tail -n 1)" # remove last file so uniform length
done

