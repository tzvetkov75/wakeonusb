#!/bin/bash
#
#	allows device to wake the computer
#
#	Vesselin 1.1.2017
#
if [ $# -ne 2 ];then
  echo "Usage: `basename $0` idVendor idProduct"
  exit 1
fi


for X in /sys/bus/usb/devices/*; do
    if [ "$1" == "$(cat "$X/idVendor" 2>/dev/null)" -a "$2" == "$(cat "$X/idProduct" 2>/dev/null)" ]
    then
        echo "$X"
	break
    fi
done

echo enabled | sudo tee "$X"/power/wakeup

