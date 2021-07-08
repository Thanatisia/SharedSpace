#
# All-in-one Ricing utility library
# Author: Asura
# Created: 2021-05-14 1442H, Asura
# Modified: 
#	2021-05-14 1442H, Asura
# Features: 
# Background Information: 
#	An all-in-one ricing utility library/script that will
#	contain variables, functions, alias of 
#	ricing utility and scripts
# Changelog:
#	2021-05-14 1442H, Asura:
#		- Created Script
#

# --- Variables
# Environment Variables


# Program Variables
PROGRAM_NAME="Rice Library and Script"
PROGRAM_TYPE="Library"

# Rice Variables
# [Default]
screenlocker="slock"
screenlocker_Opt=""

# --- Functions

# Rice utilities
#
# Screenlocker & Autolocker
#
get_Screenlocker()
{
	#
	# Return the screenlocker
	#
	# --- Input

	# --- Processing

	# --- Output
	echo "$screenlocker"
}

get_screenlocker_Options()
{
	#
	# Return the screenlocker options
	#

	# --- Input

	# --- Processing

	# --- Output
	echo "$screenlocker_Opt"

}

set_Screenlocker()
{
	#
	# Set the screenlocker
	#
	# --- Input
	# Command Line Variables
	new_screenlocker="$1"
	new_screenlocker_Options="$2"

	# --- Processing
	screenlocker="$new_screenlocker"
	screenlocker_Opt="$new_screenlocker_Options"
	screenlocker_New="$screenlocker $screenlocker_Opt"

	# --- Output
	echo "$screenlocker_New"
}

set_Autolocker()
{
	#
	# Screenlocker & Autolockers
	#

	# --- Input
	# Variables
	timeout_min=1
	other_options=-detectsleep

	# --- Processing
	xautolock -time $timeout_min $other_options -locker "$screenlocker" # Screen Locker and Autolockers

	# --- Output
}

# Main
TestBench()
{
	#
	# TestBench for unique ideas (or ideas in general)
	#
	echo "[TestBench]"
}
PracticeGround()
{
	#
	# Practice Ground function for trying out 
	#	- New topics
	#	- Tutorials
	#
	echo "[PracticeGround]"
}

debug()
{
	#
	# Debugger function
	#
	echo "[Starting Debugger]"
	echo "Screenlocker Program: $(get_Screenlocker)"
	echo "Screenlocker Options: $(get_screenlocker_Options)"
}

function main()
{
	debug "$@"
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

