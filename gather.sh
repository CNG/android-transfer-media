su root;exit

INCOMING="toCopyToComputer"
TIMEDIR="lastCopiedToComputer"
TIMEFILEVIDEO="$TIMEDIR/video.txt"
TIMEFILEIMAGE="$TIMEDIR/image.txt"

cd /storage/emulated/0/WhatsApp/Media/
mkdir -p "$TIMEDIR"
mkdir -p "$INCOMING"

find "WhatsApp Video" -maxdepth 1 -type f ! -iname ".*" -newer "$TIMEFILEVIDEO" >> $INCOMING/files.txt && touch $TIMEFILEVIDEO
find "WhatsApp Images" -maxdepth 1 -type f ! -iname ".*" -newer "$TIMEFILEIMAGE" >> $INCOMING/files.txt && touch $TIMEFILEIMAGE

while read -r file; do cp -a "$file" "$INCOMING"; done < $INCOMING/files.txt
rm -f "$INCOMING/files.txt"

if [ -f "$INCOMING.tar" ]
then
  echo "Archive of files from last gather still exists. Extracting..."
  tar -C "$INCOMING" -xvf "$INCOMING.tar"
else
  echo "No previous archive file exists. No extracting necessary."
fi
tar -C "$INCOMING" -cvf "$INCOMING.tar" . && rm -rf "$INCOMING"

exit
