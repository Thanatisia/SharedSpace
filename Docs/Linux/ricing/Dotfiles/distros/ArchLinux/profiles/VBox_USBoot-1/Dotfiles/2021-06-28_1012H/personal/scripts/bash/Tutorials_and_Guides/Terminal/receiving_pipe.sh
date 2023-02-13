#
# Tutorial: Receiving Pipe Input
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#

# --- Variables
PROGRAM_NAME="Tutorial: Receiving Pipe Input"

receive_pipe()
{
    #
    # To Receive pipe, use the 
    # 'read (-p)' function
    # by default, if no pipe is read, it will prompt the typical 'read' question
    #
    read -p "Enter anything: " pipetest
    echo "$pipetest"
}

processing()
{
    #
    # Intermediary function to process "piping"
    #
    read -p "Enter anything: " pipetest
    echo "$pipetest"
}

function main()
{
    proc="$(receive_pipe)"
    ret="$(echo $proc | receive_pipe)"
    echo "Pipe Test Result: $ret"
}

function START()
{
    echo "Program Name: $PROGRAM_NAME"
}

function END()
{
    line=""
    read -p "Pause" line
}


if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

