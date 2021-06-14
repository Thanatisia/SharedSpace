#
# Widgets module file for Lemonbar
# Author: Asura
# Created: 2021-04-15 13:00H
# Modified: 
#   2021-04-15 13:00H
#   2021-04-15 21:28H
# Features: 
#   - Widgets
# Background Information: 
# PreRequisites:
#   Packages:
#       acpi
#       xdotool
#       wireless_tools : For iwconfig
#       alsa-utils : For amixer
#

function ft_Date()
{
    format="$1"
    echo $(date "+$format")
}

function Clock()
{
    #
    # Clock widget
    # ::Params
    #   format
    #       Type: String
    #       Desc: Takes in the clock display format
    #       Default Value: "%H:%M:%S"
    #

    #
    # Input
    #
    format="$1"

    #
    # Validation
    #

    # Null value validation
    if [ "$format" == "" ]; then
        # Default
        format="%H:%M:%S"
    fi

    #
    # Processing
    #
    TIME=$(ft_Date $format)

    #
    # Output
    #
    # echo -e -n " \uf017 ${TIME}"
    echo -e -n "${TIME}"
}

function Cal()
{
    #
    # Calender widget
    # ::Params
    #   format
    #       Type: String
    #       Desc: Takes in the Calender display format
    #       Default Value: "%a, %m %B %Y"      
    #

    # Input
    format="$1"

    # Processing
    if [ "$format" == "" ]; then
        # Default
        format="%a, %m %B %Y"
    fi

    DATE=$(ft_Date "$format")
    # DATE=$(date +"$format")

    # Output
    # echo -e -n "\uf073 ${DATE}"
    echo -e -n "${DATE}"
}

function ActiveWindow()
{
    #
    # Get current active window
    # PreRequisites:
    #   Requires Package:
    #       xdotool
    #

    #
    # Input
    #
    max_Len=$1
    curr_window_Name=$(echo -n "$(xdotool getwindowfocus getwindowname)")

    #
    # Processing
    #

    # Count the variable length
    len=$(echo $curr_window_Name | wc -m)
    
    # Null Validation
    if [ "$max_Len" == "" ]; then
        max_Len=70
    fi

    # Length Validation
    # if window name length is more than max length;
    # Cut the window name
    if [ "$len" -gt "$max_Len" ]; then
        echo -n "$(echo $curr_window_Name | cut -c 1-$max_Len)..."
    else
        echo -n "$(echo $curr_window_Name)"
    fi

    #
    # Output
    #
}

function Battery()
{
    #
    # Get info about the battery
    # PreRequisites:
    #   Requires Package(s):
    #       acpi
    #

    #
    # Input
    #
    BATT_ACPI=$(acpi --battery)
    # Get battery percentage; 
    #   take battery ACPI, cut by comma delimited, take 2nd parameter
    #   and truncate
    BATT_PERC=$(echo $BATT_ACPI | cut -d, -f2 | tr -d '[:space:]')

    #
    # Processing
    #
    if [[ $BATT_ACPI == *"100%"* ]]; then
        echo -e -n "\uf00c $BATT_PERC"
    elif [[ $BATT_ACPI == *"Discharging"* ]]; then
        BATT_PERC=${BATT_PERC::-1}
        if [ $BATT_PERC -le "10" ]; then
            echo -e -n "\uf244"
        elif [ $BATT_PERC -le "25" ]; then
            echo -e -n "\uf243"
        elif [ $BATT_PERC -le "50" ]; then
            echo -e -n "\uf242"
        elif [ $BATT_PERC -le "75" ]; then
            echo -e -n "\uf241"
        elif [ $BATT_PERC -le "100" ]; then
            echo -e -n "\uf240"
        fi
        echo -e " $BATT_PERC%"
    elif [[ $BATT_ACPI == *"Charging"* && $BATT_ACPI != *"100%"* ]]; then
        echo -e "\uf0e7 $BATT_PERC"
    elif [[ $BATT_ACPI == *"Unknown"* ]]; then
        echo -e "$BATT_PERC"
    fi

    #
    # Output
    #
}

function Wifi()
{
    #
    # Wifi Strength
    # PREREQUISITES:
    #   Requires package(s):
    #       iwconfig - Part of 'wireless_tools'
    #
    WIFI_DEV=$1

    # Null input validation
    if [ "$WIFI_DEV" == " " ]; then
        WIFI_DEV="wlp1s0"
    fi

    WIFI_STR=$( iwconfig $WIFI_DEV | grep "Link" | sed 's/ //g' | sed 's/LinkQuality=//g' | sed 's/\/.*//g')
    if [ ! -z $WIFI_STR ]; then
        WIFI_STR=$(( ${WIFI_STR} * 100 / 70 ))
        ESSID=$(iwconfig $WIFI_DEV | grep ESSID | sed 's/ //g' | sed 's/.*://' | cut -d "\"" -f 2)

        if [ $WIFI_STR -ge 1 ]; then
            echo -e "\uf1eb ${ESSID} ${WIFI_STR}%"
        fi
    fi
}

function Sound()
{
    #
    # Retrieves Sound and Audio (Volume)
    #
    # Pre-Requisites:
    #   Requires package(s):
    #       alsa-utils [ for amixer ]
    #

    # 2021-04-17 04:22H : Issues at line 221 - 224

    NOT_MUTED=$(amixer sget Master | grep "\[on\]")

    if [[ ! -z $NOT_MUTED ]]; then
        VOL=$(echo $(awk -F"[][]" '/dB/ { print $2 }' <(amixer sget Master) | sed 's/%//g') | cut -d ' ' -f1)

        if [ $VOL -ge 85 ]; then
            echo -e "\uf028 ${VOL}%"
        elif [ $VOL -ge 50 ]; then
            echo -e "\uf027 ${VOL}%"
        else
            echo -e "\uf026 ${VOL}%"
        fi
    else
        echo -e "\uf026 M"
    fi
}

function Language()
{
    #
    # Display current language
    #

    # Get first row of /tmp/uim-state
    CURRENT_LANG=$(head -n 1 /tmp/uim-state)

    if [[ $CURRENT_LANG == *"English"* ]]; then
        echo -e " \uf0ac ENG"
    else
        echo -e " \uf0ac \uf128"
    fi
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    Sound
fi

