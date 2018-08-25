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
location="0"

for X in /sys/bus/usb/devices/*; do
    printf  "."
    if [ "$1" == "$(cat "$X/idVendor" 2>/dev/null)" -a "$2" == "$(cat "$X/idProduct" 2>/dev/null)" ]
    then
	echo ""
        echo "found in $X"
	location=$X
	break
    fi
done
echo ""
if [[ $location != "0" ]]; then 
	echo "enabled" > "$X/power/wakeup"
	if [ $? -eq 0 ]; then 
	       echo "enabled on the device..done"
       	       exit 0
	fi
else
	echo "devise not found. try command lsubs to find the device idVendor and idProduct" 
fi	

