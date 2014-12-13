#!/bin/sh

if [ ! -d $1 ]; then
    echo "$1: No such directory"
    exit 1
fi

_PATH=`readlink -f $1`
cd $_PATH
_LISPDIRS=`find . -maxdepth 1 -mindepth 1 -type d`

for _DIRS in ${_LISPDIRS}; do
    cd $_DIRS
    if [ -f "Makefile" ]; then
        cd $PATH
        continue
    fi

    echo -e "\n-- ${_DIRS} --"
    rm -f *.elc
    emacs -batch -f batch-byte-compile *.el
    cd $PATH
done
