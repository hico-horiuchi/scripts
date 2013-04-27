#!/bin/sh

_WLAN_FLAG=`ifconfig | grep wlan0`

if [ -n "$_WLAN_FLAG" ]; then
    _IP_ADDRESS=`ifconfig | grep inet | head -3 | tail -1 | cut -d: -f2 | awk '{print $1;}'`
    echo $_IP_ADDRESS
else
    _IP_ADDRESS=`ifconfig | grep inet | head -1 | cut -d: -f2 | awk '{print $1;}'`
    echo $_IP_ADDRESS
fi
