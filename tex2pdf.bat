@echo off
if exist %1.tex (
    platex %1.tex
    dvipdfmx %1.dvi
    if exist %1.aux (del %1.aux)
    if exist %1.dvi (del %1.dvi)
    if exist %1.log (del %1.log)
    if exist %1.nav (del %1.nav)
    if exist %1.out (del %1.out)
    if exist %1.snm (del %1.snm)
    if exist %1.toc (del %1.toc)
    if exist %1.vrb (del %1.vrb)
    "C:\Program Files\Adobe\Reader 11.0\Reader\AcroRd32.exe" %1.pdf
) else (
    echo %1.tex: No such file or directory
)
