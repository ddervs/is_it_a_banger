#!/bin/bash
# call me with mp3length.sh directory
# e.g. ./mp3length . 
# or ./mp3length my-mp3-collection

TMP_FILE=$(mktemp)

for file in $1/*.mp3
do 
    ffprobe -v error -show_entries format=duration -of default=noprint_wrappers=1:nokey=1 "${file}" >> ${TMP_FILE}
done

DURATION=$(awk '{ sum += $1 } END { print sum }' ${TMP_FILE}) 

echo "Directory $1 contains ${DURATION} seconds of mp3 audio."

