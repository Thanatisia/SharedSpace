#
# Notepad
# Author: Asura
# Created: 2021-05-18 0926H, Asura
# Modified: 
#	2021-05-18 0926H, Asura
# Features: 
# Background Information: 
#	A Generic Notepad application script that uses read and pipes
# Changelog:
#	2021-05-18 0926H, Asura:
#		- Changelogs
#

# --- Variables
PROGRAM_NAME="Notepad"
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

display_Instructions()
{
	#
	# Instructions
	#
	echo "[Instructions]"
	echo "Type: "
	echo "	^q : To Quit"
	echo "	^h : To print this help menu"
	echo "	^s : Save to a temporary file"
}

contents=""
save_file()
{
	msg="${1:-$contents}"
	fout="${2:-tmpfile_$(date +'%d-%m-%y_%H-%M-%S').txt}"
	append="${3:-1}"	# Append / Overwrite
	verbose="${4:-0}" # See output?; Options: [ 1 | 0 ]

	case "$verbose" in
		"1")
			case "$append" in
				"0")
					echo -e "$msg" | tee $fout
					;;
				*)
					echo -e "$msg" | tee -a $fout
					;;
			esac
			;;
		*)
			case "$append" in
				"0")
					echo -e "$msg" > $fout
					;;
				*)
					echo -e "$msg" >> $fout
					;;
			esac
			;;
	esac
}

notepad()
{
	#
	# Main function to run
	#

	# --- Input	
	# Local Variables
	contents=""
	data=""
	line=""
	line_Number=0
	prompt="[$line_Number] "

	# --- Processing
	# Trap the Ctrl + C signal sent to bash when key is pressed and
	# Execute the function
	#	Reference:
	#	Bash - Break out of loop with Ctrl-C but continue with script : https://stackoverflow.com/questions/46816904/bash-break-out-of-loop-with-ctrl-c-but-continue-with-script
	#	Syntax:
	#		trap <function> SIGINT
	#		trap - SIGINT  : To set the signal to default
	# 		trap "" SIGINT : To negate the signal
	trap 'save_file "$contents"' SIGINT

	# Get input and content
	while read -p "$prompt" data; do
		line="$data"
		
		if [[ "$line_Number" == "0" ]]; then
			display_Instructions
		fi

		# Switch case the line
		# Dont include the options into the storage
		case "$line" in
			"^q")
				# Quit loop
				break
				;;
			"^h")
				# W.I.P
				# Still unable to output while in 'while loop'
				;;
			"^s")
				# Temporary save
				save_file "$contents"
				;;
			*)
				contents+="$line\n"
				;;
		esac

		line_Number=$(($line_Number+1))
		prompt="[$line_Number] "
	done

	# --- Output
	# Output to file
	echo -e "Contents:"
	echo -e "$contents" | tee -a "result.txt"
}

body()
{
	notepad
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

