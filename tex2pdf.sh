#!/bin/sh
if [ -e $1 ]
then
    NAME=`basename $1 .tex`
    platex $NAME.tex
    dvipdfmx $NAME.dvi
    if [ -e $NAME.aux ] ; then rm $NAME.aux; fi
    if [ -e $NAME.dvi ] ; then rm $NAME.dvi; fi
    if [ -e $NAME.log ] ; then rm $NAME.log; fi
    if [ -e $NAME.nav ] ; then rm $NAME.nav; fi
    if [ -e $NAME.out ] ; then rm $NAME.out; fi
    if [ -e $NAME.snm ] ; then rm $NAME.snm; fi
    if [ -e $NAME.toc ] ; then rm $NAME.toc; fi
    if [ -e $NAME.vrb ] ; then rm $NAME.vrb; fi
else
    echo $1: No such file or directory
fi
