#!/bin/sh
if [ -e "$1" ]
then
    NAME=`basename "$1" .c`
    gcc -o "$NAME" "$NAME.c"
else
    echo "$1: No such file or directory"
fi
