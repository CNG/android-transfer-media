#!/bin/bash

adb shell < gather.sh
adb pull "/storage/emulated/0/WhatsApp/Media/toCopyToComputer.tar" /tmp
tar -xvf /tmp/toCopyToComputer.tar -C /Volumes/Homo/Sorting && rm -f /tmp/toCopyToComputer.tar 
adb shell < delete.sh
