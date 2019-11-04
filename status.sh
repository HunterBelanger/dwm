# Copyright (c) 2019 Hunter Belanger
# Released under the BSD 3-Clause license.

#!/bin/bash

Get_Volume () {
    # First check for mute
    mute=$(pamixer --get-mute)
    if [ $mute = "true"  ]
    then
        local retval="X----------"
    else
        # If not mute, get volume
        vol=$(pamixer --get-volume)
        if [ $((vol)) = 0  ]
        then
            local retval="|----------"
        elif [ $((vol)) -gt 0 -a $((vol)) -le 10  ]
        then
            local retval="-|----------"
        elif [ $((vol)) -gt 10 -a $((vol)) -le 20  ]
        then
            local retval="--|--------"
        elif [ $((vol)) -gt 20 -a $((vol)) -le 30  ]
        then
            local retval="---|-------"
        elif [ $((vol)) -gt 30 -a $((vol)) -le 40  ]
        then
            local retval="----|------"
        elif [ $((vol)) -gt 40 -a $((vol)) -le 50  ]
        then
            local retval="-----|-----"
        elif [ $((vol)) -gt 50 -a $((vol)) -le 60  ]
        then
            local retval="------|----"
        elif [ $((vol)) -gt 60 -a $((vol)) -le 70  ]
        then
            local retval="-------|---"
        elif [ $((vol)) -gt 70 -a $((vol)) -le 80  ]
        then
            local retval="--------|--"
        elif [ $((vol)) -gt 80 -a $((vol)) -le 90  ]
        then
            local retval="---------|-"
        elif [ $((vol)) -gt 90 -a $((vol)) -le 100  ]
        then
            local retval="----------|"
        fi
    fi

    echo "$retval"

    }

Get_Keyboard () {
    KYBRD=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')
    if [ $KYBRD = "us"  ]
    then
        local retval="US"
    elif [ $KYBRD = "us(alt-intl)" ]
    then
        local retval="Int"
    fi
    echo "$retval"
}

Get_Charging () {
    BATTERY_CHRG=$(cat /sys/class/power_supply/BAT0/status)
    if [ $BATTERY_CHRG = "Charging" ]
    then
        local retval="+"
    else
        local retval="-"
    fi

    echo "$retval"
}

while true; do
    BATTERY_PERC=$(cat /sys/class/power_supply/BAT0/capacity)
    DATE=$(date +'%d/%m/%y')
    TIME=$(date +'%H:%M')
    
    STATUS=" KBD:$(Get_Keyboard)  VOL:$(Get_Volume)  BAT:$(Get_Charging)$BATTERY_PERC  |  $DATE  $TIME "

    xsetroot -name "${STATUS}"
    sleep 1

done
