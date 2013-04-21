#!/bin/bsah
# 手抜きgit更新スクリプト | GoingMyWay
# http://goingmyway.net/?p=632

_GITDIRS=`find . -type d -name ".git" | sed "s/\(\.\/.*\)\/.git/\1/g"`

for _DIRS in ${_GITDIRS}; do
    echo -e "-- ${_DIRS} --"
    cd $_DIRS
    _PULL=`git pull`
    echo $_PULL
    if [ "${_PULL}" != "Already up-to-date." ]; then
        rm *.elc
        emacs -batch -f batch-byte-compile *.el
    fi
    cd ../
done
