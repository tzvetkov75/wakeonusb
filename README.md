# Wake On Usb
Allows usb periphery to wakeup computer from standby under Debian

Typicaly keyboard or mouse click


## Usage 

Everytime the computer restart you can enable the usb device to wakeup the computer

Script manual use 
``` sudo ./wakeOnUSB.sh {idVendor} {idProduct}
```
 - _idVendor_ is manifacture Id of you hardware, example 045e is Microsoft
 - _idProduct_ is the Id of the exact product, exampple 00dd keyboard

The values can be obtained using __lsusb__ command 

## Running the script on boot

You can add the script to your _/etc/rc.local_ that is executed every time the computer starts
> Systemd does not per defaul executed rc.local. Enable with systemctl enable rc-local.service 

example from /etc/rc.local

```
/home/test/workspace/wakeOniUSB.sh 045e 00dd

```

### About 
 
Version 1.1.2017
Author	Vesselin 
License MIT 
