#!/bin/bash
#
# Usage ./prepare_data_files.sh $DATA_ROOT_DIR $SEGMENT_TIME
#
# script prepares clipped *.wav files in a base data dir from youtube URLs.
#
# note that urls for each class must be in a text file $DATA_ROOT_DIR/$CLASS_NAME/*.txt, 
# one URL per line
#
# $DATA_ROOT_DIR is directory with subdirectories for each class.
# $SEGMENT_TIME is length of each .wav clip (in seconds)

DATA_ROOT_DIR="$1"
SEGMENT_TIME="$2"

SCRIPTS_DIR=$(dirname $0)

# Make sure globstar is enabled
shopt -s globstar

for FILE in "${DATA_ROOT_DIR}"/**/*.txt
do
    TARGET_DIR="$(cd "$(dirname "$FILE")"; pwd)/" 
    echo "Processing ${FILE} for class \"$(basename ${TARGET_DIR})\""
 
    ${SCRIPTS_DIR}/download_playlists.sh ${TARGET_DIR} ${FILE}
    ${SCRIPTS_DIR}/split_files.sh ${DATA_ROOT_DIR} ${SEGMENT_TIME} 

done
