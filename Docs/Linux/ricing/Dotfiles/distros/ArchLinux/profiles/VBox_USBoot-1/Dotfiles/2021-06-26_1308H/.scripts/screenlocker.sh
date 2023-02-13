#
# Screenlocker script
# Author: Asura
# Created: 2021-05-16 0143H, Asura
# Modified: 
#	2021-05-16 0143H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-16 0143H, Asura:
#		- Created Script file
#

# --- Variables
PROGRAM_NAME="ScreenLocker utility with xautolocker"
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
	# res="$(func_Name "$@")"
	# echo "$res"

	# --- Input
	# Local Variables

	#
	# Screenlocker & Autolocker info
	#
	timeout_min=1
	screenlocker="slock"
	other_options=-detectsleep


	# --- Processing
	#
	# Program check
	#
	if [[ ! "$(pgrep -x xautolock)" == "" ]]; then
		pkill xautolock
	fi

	# --- Output
	# xautolock -time $timeout_min $other_options -locker "$screenlocker" &
	xautolock -time $timeout_min $other_options -locker "$screenlocker"
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

