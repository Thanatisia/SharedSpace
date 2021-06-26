#
# Output & Run Debug/Logging tool
# Author: Asura
# Created: 2021-04-16 08:15H
# Modified: 
#   2021-04-16 08:15H
#   2021-04-16 17:17H
# Features: 
# Background Information: 
#

function change_permission()
{
    #
    # Wrapper for chmod; Change Permission of input file
    # ::Params
    #   fname
    #       Type: String
    #       Desc: File you want to change permission
    #       Usage:
    #       Defaults: NULL
    #   permission_Type
    #       Type: String
    #       Desc: The Permissions you want to set [i.e. +x : Executable, -x: Not Executable; a+x: Admin + Executable]
    #       Usage:
    #           "+x"
    #           "a+x"
    #       Defaults: +x
    # ::Examples
    #   chmod a+x <filename>
    #
    fname=$1
    permission_Type=$2

    # Null value check
    if [ "$permission_Type" == "" ]; then
        permission_Type="+x"
    fi

    if [ ! "$fname" == "" ]; then
        chmod $permission_Type $fname
    else
        echo "No file detected."
    fi
}

function log()
{
    #
    # Run target script(s) and log via tee at the same time
    # ::Params
    #   scriptname
    #       Type: String
    #       Desc: Name of file you want to execute
    #       Usage: ./<scriptname>
    #   ofname
    #       Type: String
    #       Desc: Short for 'Output File name'
    #       Usage: "%H:%M:%S"
    # ::Examples
    #   ./pkg-autoupdater.sh | tee -a debug_$(date +"%y-%m-%d_%H-%M-%S").log
    #

    #
    # Input
    #
    scriptname="$1"
    ofname="$2"

    #
    # Processing
    #
    # Null value validation
    if [ "$ofname" == "" ]; then
        # Set default value
        ofname=$(date +"%y-%m-%d_%H-%M-%S").log
    fi

    #
    # Output
    #
    ./$scriptname | tee -a $ofname
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    scriptname=pkg-autoupdater.sh
    ofilename=debug_$(date +"%y-%m-%d").log
    # log pkg-autoupdater.sh debug_$(date +"%y-%m-%d").log
    log $scriptname $ofilename
fi

line=""
read -p "Pause" line


