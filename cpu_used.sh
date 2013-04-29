#!/bin/bash

_CPU_USED=0

for i in $(ps aux | sed -e 's/  */ /g' | cut -d' ' -f3); do
    if [ ${i} = '%CPU' ]; then
        continue
    fi
    _FORM="scale=3; $_CPU_USED+$i"
    _CPU_USED=`echo $_FORM | bc`
done

echo $_CPU_USED
