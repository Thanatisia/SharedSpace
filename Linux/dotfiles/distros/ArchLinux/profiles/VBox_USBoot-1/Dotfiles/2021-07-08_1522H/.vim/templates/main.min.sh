#
# Project Name
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#

# --- Variables
PROGRAM_NAME="NIL"
PROGRAM_TYPE="Main | Library"


# --- Functions

# General Functions
function func_Name()
{
	# --- Input
	# Command Line Variables
    if [[ "$1" == "" ]]; then
		# Pipe Input
		read -p "Input: " uInput
		# read uInput
	else
		uInput="$1"
	fi
	
	# Local Variables

	# --- Processing
    proc=$uInput
    sysOut=$proc

	# --- Outut
    echo "$sysOut"
}

# Main functions
body()
{
	#
	# Main function to run
	#
	res="$(func_Name "$@")"
	echo "$res"
}

function START()
{
	echo "PROGRAM NAME: $PROGRAM_NAME"
	echo "PROGRAM TYPE: $PROGRAM_TYPE"
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{
	body "$@"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
	main "$@"
    END
fi
