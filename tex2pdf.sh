#!/bin/sh
if [ -e "$1" ]
then
    NAME=`basename "$1" .tex`
    nkf -w --overwrite "$NAME.tex"
    if [ -e "$NAME.tex" ] ; then
      sed -i 's/\\begin{document}//g' thesis.tex
      sed -i 's/\\maketitle//g' thesis.tex
      sed -i 's/\\end{keyword}/\\end{keyword}\\begin{document}\\maketitle/g' thesis.tex
    fi
    platex "$NAME.tex"
    platex "$NAME.tex"
    dvipdfmx -f $HOME/.fonts/kozuka.map "$NAME.dvi"
    if [ -e "$NAME.dvi" ] ; then rm "$NAME.dvi"; fi
    if [ -e "$NAME.log" ] ; then rm "$NAME.log"; fi
    if [ -e "$NAME.nav" ] ; then rm "$NAME.nav"; fi
    if [ -e "$NAME.out" ] ; then rm "$NAME.out"; fi
    if [ -e "$NAME.snm" ] ; then rm "$NAME.snm"; fi
    if [ -e "$NAME.toc" ] ; then rm "$NAME.toc"; fi
    if [ -e "$NAME.vrb" ] ; then rm "$NAME.vrb"; fi
    evince "$NAME.pdf"
else
    echo "$1: No such file or directory"
fi
