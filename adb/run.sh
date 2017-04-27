#!/bin/bash

if [[ "$#" -ne 1 ]]; then
  printf "Usage: run.sh destination\n" >&2
  exit 1
fi

INCOMING="$1"
if [[ ! -d "$INCOMING" ]]; then
  printf "Error: Destination not directory or does not exist: $INCOMING\n" >&2
  exit 1
fi

# Make tempary directory per http://mywiki.wooledge.org/BashFAQ/062
i=0 TEMPDIR=
trap '[[ $TEMPDIR ]] && rm -rf "$TEMPDIR"' EXIT
while ((++i <= 10)); do
  TEMPDIR=${TMPDIR:-/$INCOMING}/temporary-$RANDOM-$$
  mkdir -m 700 "$TEMPDIR" 2>/dev/null && break
done
if ((i > 10)); then
  printf "Error: Could not create temporary directory\n" >&2
  exit 1
fi

adb shell < gather-whatsapp.sh
adb pull "/storage/emulated/0/WhatsApp/Media/toCopyToComputer.tar" "$TEMPDIR" &&
  adb shell < delete-whatsapp.sh &&
  tar -C "$INCOMING" -xvf "$TEMPDIR/toCopyToComputer.tar" &&
  rm -f "$TEMPDIR/toCopyToComputer.tar"

adb shell < gather-camera.sh
adb pull "/storage/emulated/0/DCIM/Camera.tar" "$TEMPDIR" &&
  adb shell < delete-camera.sh &&
  tar -C "$INCOMING" -xvf "$TEMPDIR/Camera.tar" &&
  rm -f "$TEMPDIR/Camera.tar"

adb shell < gather-facebook.sh
adb pull "/storage/emulated/0/DCIM/Facebook.tar" "$TEMPDIR" &&
  adb shell < delete-facebook.sh &&
  tar -C "$INCOMING" -xvf "$TEMPDIR/Facebook.tar" &&
  rm -f "$TEMPDIR/Facebook.tar"

adb shell < gather-screenshots.sh
adb pull "/storage/emulated/0/Pictures/Screenshots.tar" "$TEMPDIR" &&
  adb shell < delete-screenshots.sh &&
  tar -C "$INCOMING" -xvf "$TEMPDIR/Screenshots.tar" &&
  rm -f "$TEMPDIR/Screenshots.tar"

adb shell < gather-line.sh
adb pull "/storage/emulated/0/Pictures/LINE.tar" "$TEMPDIR" &&
  adb shell < delete-line.sh &&
  tar -C "$INCOMING" -xvf "$TEMPDIR/LINE.tar" &&
  rm -f "$TEMPDIR/LINE.tar"
