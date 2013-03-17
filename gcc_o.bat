@echo off
if exist %1.c (
    gcc -o %1 %1.c
) else (
    echo %1.c: No such file or directory
)
