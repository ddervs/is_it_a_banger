#!/bin/bash
#
# Usage: ./splitfiles.sh $DATA_ROOT_DIR $SEGMENT_TIME 
# 
# clip mp3 files (recursively) in $DATA_ROOT_DIR to .wav files of length $SEGMENT_TIME  
#
# $DATA_ROOT_DIR is root directory of mp3 audio data
# $SEGMENT_TIME is length of *.wav clips

DATA_ROOT_DIR="$1"
SEGMENT_TIME="$2"  

# Make sure globstar is enabled
shopt -s globstar

for FILE in "${DATA_ROOT_DIR}"/**/*.mp3
do 
    echo "Processing ${FILE}"
    ffmpeg -i "${FILE}" -f segment -segment_time ${SEGMENT_TIME} -c copy "${FILE%.*}_"%04d.wav                
    #rm "${FILE}" 
    echo "$(ls -1 "${FILE%.*}"*.wav | sort -V | tail -n 1)" # remove last file so uniform length
done

