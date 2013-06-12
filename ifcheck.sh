#!/bin/sh

ifconfig wlan0 > /dev/null 2> /dev/null

if [ $? = "0" ]; then
    _IP_ADDRESS=`ifconfig wlan0 | sed -n '2p' | cut -d: -f2 | awk '{print $1;}'`
    echo $_IP_ADDRESS
else
    _IP_ADDRESS=`ifconfig       | sed -n '2p' | cut -d: -f2 | awk '{print $1;}'`
    echo $_IP_ADDRESS
fi
