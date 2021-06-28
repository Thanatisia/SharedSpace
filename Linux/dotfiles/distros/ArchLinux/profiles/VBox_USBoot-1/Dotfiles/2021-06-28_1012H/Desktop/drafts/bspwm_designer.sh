#
# BSPWM bspc config designer
# Author: Asura
# Created: 2021-05-21 2052H, Asura
# Modified: 
#	- 2021-05-21 2052H, Asura
# Features: 
# Background Information: 
#	A all-in-one BSPWM bspc designer program
# Changelog:
#	- 2021-05-21 2052H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="BSPC Designer"
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

	# --- Input
	# Local Variables
	argv=("$@")
	argc=${#argv[@]}

	bspwmrc=~/.config/bspwm/bspwmrc.test
	bspwmrc_Template=/usr/share/doc/bspwm/examples/bspwmrc

	# --- Procesing
	# 1. Read content of bspwmrc file
	if [[ ! -f $bspwmrc ]]; then
		# If it does not exists
		#touch $bspwmrc
		#echo "#! /bin/sh" | tee -a $bspwmrc
		#echo "#" | tee -a $bspwmrc
		#echo "# BSPWM Resource Control (bspwmrc)" | tee -a $bspwmrc
		#echo "#" | tee -a $bspwmrc

		# Copy template file to config
		cp $bspwmrc_Template $bspwmrc
	fi
	echo "# =================== #"
	echo "Current Configurations:"
	echo "# =================== #"
	cat $bspwmrc

	echo ""

	# DEBUGGING. Check arguments
	# echo "Number of arguments: $argc"
	# echo "Arguments:"
	# for(( i=0; i < $argc; i++ )); do
	#	echo "Argument [$i]: ${argv[$i]}"
	# done

	# 2. Get Options (Default to Show)
	opt="${argv[0]:---show}"
	case "$opt" in
		# Options
		"--filter")
			# 2.1. Get keyword
			keyword="${argv[1]}" # 1st Argument; Default to Null
			case "$keyword" in
				"1")
					keyword="color"
					;;
				"2")
					keyword="rule"
					;;
				"3")
					keyword="config"
					;;
				"4")
					keyword="monitor"
					;;
				*)
					keyword=""
					;;
			esac

			ret="$(cat $bspwmrc | grep "$keyword")"
			if [[ ! "$ret" == "" ]]; then
				echo "Keyword: $keyword"
				echo "$ret"
			fi
			;;
		*)
			# 2.2. Show all config again
			cat $bspwmrc
			;;
	esac

	# --- Output
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

