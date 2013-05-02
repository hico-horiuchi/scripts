#!/bin/bash

_MEM_USED=0

for i in $(ps aux | sed -e 's/  */ /g' | cut -d' ' -f4); do
    if [ ${i} = '%MEM' ]; then
        continue
    fi
    _FORM="scale=3; $_MEM_USED+$i"
    _MEM_USED=`echo $_FORM | bc`
done

echo $_MEM_USED
