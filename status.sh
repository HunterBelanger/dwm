# Copyright (c) 2019 Hunter Belanger
# Released under the BSD 3-Clause license.

#!/bin/bash

Get_Volume () {
    # First check for mute
    mute=$(amixer get Master | awk '$0~/%/{print $6}' | tr -d '[]')
    if [ $mute = "off"  ]
    then
        local retval="ﱝ"
    else
        # If not mute, get volume
        vol=$(amixer get Master | awk '$0~/%/{print $4}' | tr -d '[]%')
        if [ $((vol)) -ge 0 -a $((vol)) -le 33  ]
        then
            local retval="奄:$vol"
        elif [ $((vol)) -gt 33 -a $((vol)) -le 66  ]
        then
            local retval="奔:$vol"
        elif [ $((vol)) -gt 66 ]
        then
            local retval="墳:$vol"
        fi
    fi

    echo "$retval"

    }

Get_Keyboard () {
    KYBRD=$(setxkbmap -print | grep xkb_symbols | awk '{print $4}' | awk -F"+" '{print $2}')
    if [ $KYBRD = "us"  ]
    then
        local retval="US"
    elif [ $KYBRD = "us(alt-intl)" ]
    then
        local retval="Int"
    fi
    echo "$retval"
}


while true; do
    DATE=$(date +'%d/%m/%y')
    TIME=$(date +'%H:%M')
    
    STATUS=" :$(Get_Keyboard)  $(Get_Volume)   $DATE  $TIME "

    xsetroot -name "${STATUS}"
    #echo "$STATUS"
    sleep 1

done
