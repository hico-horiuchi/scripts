#!/bin/bash

_MON1_W=1280
_MON1_H=1024

_MON2_W=1920
_MON2_H=1080

_TASK=24
_TITLE=25
_FRAME=2

_ACTIVE=`xprop -root | grep '^_NET_ACTIVE_WINDOW' | cut -c43-49`
_ACTIVE_X=`wmctrl -lG | grep $_ACTIVE | sed -e 's/  */ /g' | cut -d' ' -f3`
_DESK_W=`wmctrl -lG | grep デスクトップ | sed -e 's/  */ /g' | cut -d' ' -f5`

if [ $_DESK_W -eq $_MON1_W ]; then
    _MON2_H=$_MON1_H
fi

if [ $_ACTIVE_X -lt $_MON1_W ]; then
    _MON_W=$_MON1_W
    _MON_H=$_MON1_H
    _X=0
    _Y=`expr $_MON2_H - $_MON1_H`
else
    _MON_W=$_MON2_W
    _MON_H=$_MON2_H
    _X=$_MON1_W
    _Y=0
fi

_H_MON_W=`expr $_MON_W / 2`
_H_MON_H=`expr \( $_MON_H - $_TASK \) / 2`

_WIN_W=`expr $_MON_W - \( $_FRAME \* 2 \)`
_WIN_H=`expr $_MON_H - $_TITLE - $_TASK - $_FRAME`
_H_WIN_W=`expr $_H_MON_W - \( $_FRAME \* 2 \)`
_H_WIN_H=`expr $_H_MON_H - $_TITLE - $_FRAME`

case $1 in
    1)  wmctrl -r :ACTIVE: -e 0,$_X,`expr $_Y + $_H_MON_H`,$_H_WIN_W,$_H_WIN_H ;;
    2)  wmctrl -r :ACTIVE: -e 0,$_X,`expr $_Y + $_H_MON_H`,$_WIN_W,$_H_WIN_H ;;
    3)  wmctrl -r :ACTIVE: -e 0,`expr $_X + $_H_MON_W`,`expr $_Y + $_H_MON_H`,$_H_WIN_W,$_H_WIN_H ;;
    4)  wmctrl -r :ACTIVE: -e 0,$_X,$_Y,$_H_WIN_W,$_WIN_H ;;
    5)  wmctrl -r :ACTIVE: -e 0,`expr $_X + $_H_MON_W / 2`,`expr $_Y + $_H_MON_H / 2`,$_H_WIN_W,$_H_WIN_H ;;
    6)  wmctrl -r :ACTIVE: -e 0,`expr $_X + $_H_MON_W`,$_Y,$_H_WIN_W,$_WIN_H ;;
    7)  wmctrl -r :ACTIVE: -e 0,$_X,$_Y,$_H_WIN_W,$_H_WIN_H ;;
    8)  wmctrl -r :ACTIVE: -e 0,$_X,$_Y,$_WIN_W,$_H_WIN_H ;;
    9)  wmctrl -r :ACTIVE: -e 0,`expr $_X + $_H_MON_W`,$_Y,$_H_WIN_W,$_H_WIN_H ;;
esac
