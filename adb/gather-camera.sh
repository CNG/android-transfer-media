su root;exit

INCOMING="Camera"

cd /storage/emulated/0/DCIM/

if [ -f "$INCOMING.tar" ]
then
  echo "Archive of files from last gather still exists. Extracting..."
  tar -C "$INCOMING" -xvf "$INCOMING.tar"
else
  echo "No previous archive file exists. No extracting necessary."
fi
echo "CHARLIECHARLIE"
echo `pwd`
tar -C "$INCOMING" -cvf "$INCOMING.tar" . && rm -rf "$INCOMING"/* # need -rf else will fail on special photo directories

exit
