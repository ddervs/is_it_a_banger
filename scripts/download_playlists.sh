#!/bin/bash

# Usage
# ./download_playlists.sh $TARGET_DIR $PLAYLIST_URLS_FILE
# 
# $TARGET_DIR is directory to save files in
# $PLAYLIST_URLS_FILE is a file where each line is the url to a youtube playlist to download.

TMP_FILE=$(mktemp)

while read line; do
  
    if [ "$line" != "" ]; then
      echo "Reading URL ${line}"
      echo "Track IDs:"
      youtube-dl --get-id "${line}" -i | tee $TMP_FILE  
    fi

done <$2

TARGET_DIR="$(cd "$(dirname "$1")"; pwd)/$(basename "$1")/"

cat $TMP_FILE

youtube-dl -o "${TARGET_DIR}%(title)s.%(ext)s" -x -i --audio-format mp3 -f "bestaudio" --batch-file $TMP_FILE 
