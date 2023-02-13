#
# Wrapper for Cowsay
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#

# --- Variables
PROGRAM_NAME="NIL"

function func_Name()
{
	cmd=$1
	echo "$cmd" | cowsay
}

function main()
{
    ret="$(func_Name "Hello")"
    echo $ret
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

