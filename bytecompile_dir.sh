#!/bin/sh

_LISPDIRS=`find . -maxdepth 1 -mindepth 1 -type d`

for _DIRS in ${_LISPDIRS}; do
    echo -e "\n-- ${_DIRS} --"
    cd $_DIRS
    rm -f *.elc
    emacs -batch -f batch-byte-compile *.el
    cd ../
done
