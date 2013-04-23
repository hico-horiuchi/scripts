#!/bin/bsah
# 手抜きgit更新スクリプト | GoingMyWay
# http://goingmyway.net/?p=632

if [ ! -d $1 ]; then
    echo "$1: No such directory"
    exit 1
fi

cd $1
_GITDIRS=`find . -type d -name ".git" | sed "s/\(\.\/.*\)\/.git/\1/g"`

for _DIRS in ${_GITDIRS}; do
    echo -e "\n-- ${_DIRS} --"
    cd $_DIRS
    _PULL=`git pull`
    echo $_PULL
    if [ "${_PULL}" != "Already up-to-date." ]; then
        rm -f *.elc
        emacs -batch -f batch-byte-compile *.el
    fi
    cd ../
done
