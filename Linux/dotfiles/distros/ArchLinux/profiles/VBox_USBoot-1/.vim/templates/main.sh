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

# Pre-Requisite Functions
initial_check()
{
	#
	# Check First time use
	# ---
	# Check if
	#	> config files or relevant files exist
	# ---
	#

	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code=True

	# --- Processing
	# echo "First Time Check"
	
	# --- Output
	echo "$ret_code"
}

initial_setup()
{
	#
	# Setup procedure if 
	#	first time use
	#
	
	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code="0"

	# --- Processing
	# echo "Initial Setup"
	# Temporary
	ret_code="1"

	# --- Output
	echo "$ret_code"
}

add_env()
{
	#
	# Add Environment Variables
	#

	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code="0"

	# --- Processing
	echo "Add Environment Variables"

	# --- Output
	echo "ret_code"
}

startup()
{
	#
	# Run on startup
	#

	# --- Input

	# Command Line Variables
	# Local Variables
	ret_code="1"

	# --- Processing
	# Check First Run
	chk_first_Run="$(initial_check)"
	
	# Validate First Run
	if [[ "$chk_first_Run" == "True" ]]; then
		init="$(initial_setup)"
		if [[ ! "$init" == "1" ]]; then
			ret_code="0"
		fi
	fi

	# --- Output
	echo "$ret_code"
}


# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"

	# Example : Remove this if you need to
	res="$(func_Name "$@")"
	echo "$res"
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{
	#
	# Main Function 
	#  - You may not edit this if you want to leave it as default
	#

	ret_code="$(startup)"
	if [[ "$ret_code" == "1" ]]; then
		# Success
		# Your body here
		# res="$(body "$@")"
		# echo "Return Result: $res"
		# echo "$res"
		body "$@"
		res="$?"
		echo "$res"
	else
		echo -e "Error: \n$ret_code"
	fi
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi
