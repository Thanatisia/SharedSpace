#
# Master Shell Library
# Author: Asura
# Created: 2021-04-16 08:31H
# Modified: 
#   2021-04-16 08:31H
#   2021-04-21 08:28H
# Features: 
# Background Information: 
#   Store all useful functions and libraries to use
# Changelog:
#   2021-04-16 0831H : Created file
#   2021-04-21 0828H : Added functions for Debugging
#

### Functions
# function get_Part()
function line_split()
{
    #
    # Get Parts of a result by cutting the string according to a delimiter
    # ::Params
    #   cmdout
    #       Type: String
    #       Desc: The Command output string
    #       Usage:
    #           "$(ls -l ~/.bashrc)"
    #           "$(<command>)"
    #
    #   delim
    #       Type: String
    #       Desc: Delimiter to cut 
    #       Usage:
    #
    #   partNo
    #       Type: Integer
    #       Desc: Part number to get (-f<n>)
    #       Usage:
    #
    # ::Syntax
    #   <command output> | cut -d '<delimiter>' -f<part_Number>
    # ::Examples
    #   ls -l ~/.bashrc | cut -d ' ' -f1 : To Get permission
    #
    cmdout=$1
    delim=$2
    partNo=$3

    res=$(echo "$cmdout" | cut -d "$delim" -f$partNo)
    echo "$res"
}

function dir_change()
{
    #
    # Change path to the file/directory of choice
    # using 'which'
    # usage: echo "$(dirname $(which pacinstaller.sh))"
    #

    src=$1
    if [ ! "$src" == "" ]; then
        # If not empty
        filepath="$(dirname $(which $src))"
        # echo "$filepath"
        cd "$filepath"
    else
        # If empty
        echo "Source provided is empty."
    fi
}

function get_current_line_number()
{
    # Get current line number; For Debugging
    echo $LINENO
}

function execute()
{
    # Get current file name
    # NOTE:
    #   `<command> <parameters>` == $(<command> <parametes>)
    echo `basename $0`
}

function debug_log()
{
    #
    # Debug & Log
    # :: Params
    #   $1 : To insert line number
    #
    FILENAME=`basename $0`
    echo "Error at Line number : [${FILENAME}:${1}]"
    return 1
}

function test_1()
{
    # Test 1: line_split()
    cmdline="$(ls -l ~/.bashrc)"
    delim=" "
    partNo=1
    echo $(line_split "$cmdline" "$delim" $partNo)
}

function test_2()
{
    # Test 2: dir_change()
    src="shlib.sh"
    dir_change $src
}

function debug()
{
    test_2
}

#
# Bash equivalent of if __name__ == __main__":
# - Only execute if the executing file is this file and not as a library
#
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    # main "$@"
    debug 
    # line=""
    # read -p "Pause" line
fi

