#!/bin/sh
if [ -e "$1" ]
then
    NAME=`basename "$1" .tex`
    nkf -w --overwrite "$NAME.tex"
    if [ "$NAME" = 'thesis' ] ; then
      sed -i 's/\\begin{document}//g' "$NAME.tex"
      sed -i 's/\\maketitle//g' "$NAME.tex"
      sed -i 's/\\end{keyword}/\\end{keyword}\\begin{document}\\maketitle/g' "$NAME.tex"
      sed -i 's/\[htb\]/\[ht\]/g' "$NAME.tex"
      sed -i 's/\.9\\linewidth/\.7\\linewidth/g' "$NAME.tex"
      sed -i 's/\.7\\linewidth\]{..\/figure\/expr_r/\.9\\linewidth\]{..\/figure\/expr_r/g' "$NAME.tex"
      sed -i 's/\(\\includegraphics.*_graph\.eps}\)/\\fbox{\1}/g' "$NAME.tex"
    fi
    platex "$NAME.tex"
    platex "$NAME.tex"
    dvipdfmx -f "$HOME/.fonts/kozuka.map" "$NAME.dvi"
    if [ -e "$NAME.dvi" ] ; then rm "$NAME.dvi"; fi
    if [ -e "$NAME.log" ] ; then rm "$NAME.log"; fi
    if [ -e "$NAME.nav" ] ; then rm "$NAME.nav"; fi
    if [ -e "$NAME.out" ] ; then rm "$NAME.out"; fi
    if [ -e "$NAME.snm" ] ; then rm "$NAME.snm"; fi
    if [ -e "$NAME.toc" ] ; then rm "$NAME.toc"; fi
    if [ -e "$NAME.vrb" ] ; then rm "$NAME.vrb"; fi
    if [ -e "$NAME.pdf" ] ; then evince "$NAME.pdf" ; fi
else
    echo "$1: No such file or directory"
fi
