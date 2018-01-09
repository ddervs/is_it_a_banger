#!/bin/bash
# Usage: ./mp3length.sh $DIR
#
# Script that calculates the total length of all mp3 audio files in $DIR in seconds (not exact).

TMP_FILE=$(mktemp)

for file in $1/*.mp3
do 
    ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${file}" >> ${TMP_FILE}
done

DURATION=$(awk '{ sum += $1 } END { print sum }' ${TMP_FILE}) 

echo "Directory $1 contains ${DURATION} seconds of mp3 audio."

