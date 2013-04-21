#!/bin/sh

_LISPDIRS=`find . -maxdepth 1 -mindepth 1 -type d`

for _DIRS in ${_LISPDIRS}; do
    echo -e "-- ${_DIRS} --"
    cd $_DIRS
    rm *.elc
    emacs -batch -f batch-byte-compile *.el
    cd ../
done
