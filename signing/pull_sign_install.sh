#!/bin/bash
 
workdir="$HOME/MotoDialer/signing"
src="/sdcard/MotoDialer/app/src/main/"
filename="MotoDialer.apk"
keystore="$workdir/lineage_apps.jks"

cd $workdir
adb wait-for-device
adb pull $src$filename
apksigner sign --ks=$keystore $filename
adb wait-for-device
adb install $workdir/$filename