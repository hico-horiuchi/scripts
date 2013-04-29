#!/bin/bash

_MEM_TOTAL=`cat /proc/meminfo | grep MemTotal | awk '{print $2;}'`
_MEM_FREE=`cat /proc/meminfo | grep MemFree | awk '{print $2;}'`

_FORM="scale=3; ($_MEM_TOTAL-$_MEM_FREE)/$_MEM_TOTAL*100"
echo $_FORM | bc | cut -c1-4
