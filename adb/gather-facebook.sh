su root;exit

INCOMING="Facebook"

cd /storage/emulated/0/DCIM/

if [ -f "$INCOMING.tar" ]
then
  echo "Archive of files from last gather still exists. Extracting..."
  tar -C "$INCOMING" -xvf "$INCOMING.tar"
else
  echo "No previous archive file exists. No extracting necessary."
fi
tar -C "$INCOMING" -cvf "$INCOMING.tar" . && rm -f "$INCOMING"/*

exit
