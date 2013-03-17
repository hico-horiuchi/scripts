@echo off
if exist %1.tex (
    platex %1.tex
    dvipdfmx %1.dvi
    if exist %1.log (del %1.log)
    if exist %1.aux (del %1.aux)
    if exist %1.dvi (del %1.dvi)
) else (
    echo %1.tex: No such file or directory
)
