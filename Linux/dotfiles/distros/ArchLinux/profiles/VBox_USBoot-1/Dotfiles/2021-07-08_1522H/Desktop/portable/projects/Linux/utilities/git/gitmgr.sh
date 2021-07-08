#
# Git File Manager
# Author: Asura
# Created: 2021-05-17 1739H
# Modified:
#	2021-05-17 1739H, Asura
# Features: 
# Background Information: 
#	A Git control manager that allows user to
#		- Initialize (a new) local git repository
#		- Commit new changes to the local repository
#		- Login to a remote git repository account
#		- Push changes to the connected remote repository
#		- Pull / Fetch changes from a repository 
#	etc.
# Changelog:
#	2021-05-17 1739H, Asura:
#		- Created Script file
#

# --- Variables
PROGRAM_NAME="Git File Manager"
PROGRAM_TYPE="Main"


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

# Main functions
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

init()
{
	#
	# On Runtime initialization
	#
	echo "Program Name: $PROGRAM_NAME"
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
	# --- Input
	ret_code="0"
	
	# --- Processing 
	ret_code="$(startup)"

	# --- Output
	echo "$ret_code"
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{	
	ret_code="$(START)"
	if [[ "$ret_code" == "1" ]]; then
		# Success
		# Your body here
		res="$(body "$@")"
		# echo "Return Result: $res"
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

