#!/bin/bash

if [[ -z ${1+x} || -z ${2+x} || -z ${3+x} ]]; then
	echo "Usage: ./runapk.sh PATH_TO_APK PACKAGE_NAME MAIN_ACTIVITY"
	exit 1
fi
echo $PATH
emulator64-arm -avd "API23-arm" &
bootanim=""
failcounter=0
until [[ "$bootanim" =~ "stopped" ]]; do
   bootanim=`adb -e shell getprop init.svc.bootanim 2>&1`
   if [[ "$bootanim" =~ "not found" ]]; then
      let "failcounter += 1"
      if [[ $failcounter -gt 10 ]]; then
        echo "  Failed to start emulator"
        exit 1
      fi
   fi
   sleep 1
done
adb install -r $1
adb shell am start -a android.intent.action.MAIN -n $2/.$3
adb logcat $2:D
