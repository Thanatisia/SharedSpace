#
# Dmenu Pacman Control script
# Author: Asura
# Created: 2021-05-22 2053H, Asura
# Modified: 
#	- 2021-05-22 2053H, Asura
# Features: 
# Background Information: 
#	- A Dmenu pacman script that lets users easily choose the option they want to use
#		- i.e.
#			- Install script
#			- Update packages 
#		etc
# Changelog:
#	- 2021-05-22 2053H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="Dmenu - Pacman Controller"
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
sanitize()
{
	var="$1"
	to_remove="$2"
	res=""

	res="${var%$to_remove}"
	# res=${var%\\n}
	echo "$res"
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

function START()
{
	# --- Input
	ret_code="0"
	
	# --- Processing 
	ret_code="$(startup)"

	# --- Output
	echo "$ret_code"
}

body()
{
	#
	# Main function to run
	#
	
	# --- Input
	# Command Line Arguments
	argv=("$@")
	argc="${#argv[@]}"

	# Local Variables
	uOption="${argv[0]}" # 1st Argument

	# --- Processing

	echo "User Option: $uOption"
	case "$uOption" in
		"--test")
			### 1. Dmenu hello world test ###
			res="$(echo -e "Hello World" | dmenu -c -l 10)"
			echo "Result: $res"

			### 2. Dmenu input ###
			options=(
				"install"
				"update"
				"upgrade"
				"update and upgrade"
				"remove"
				"uninstall"
			)

			# Join with newline
			for opt_ID in "${!options[@]}"; do
				# Concatenate \n
				all_opts+="${options[$opt_ID]}\n"
			done

			# Sanitize
			ret_string="$(sanitize "$all_opts" "\\\n")"

			# Get package manager command
			# sel="$(echo -e "install\nupdate\nupgrade\nupdate and upgrade" | dmenu -c -l 10)"
			sel="$(echo -e $ret_string | dmenu -c -l 10)"

			# Check commands
			case "$sel" in
				"install")
					pkg_name="$(echo -e "NIL" | dmenu -p "Package Name: " -c -l 10)"
					if [[ ! "$pkg_name" == "NIL" ]]; then
						echo "sudo pacman -S $pkg_name"
					fi
					;;
				"update")
					echo "sudo pacman -Sy"
					;;
				"upgrade")
					echo "sudo pacman -Su"
					;;
				"update and upgrade")
					echo "sudo pacman -Syu"
					;;
				"remove")
					echo "sudo pacman -R"
					;;
				"uninstall")
					echo "sudo pacman -Rsu"
					;;
				"")
					echo "No Input"
					;;
				*)
					echo "Invalid input"
					;;
			esac
			;;
		"")
			echo "No Input"
			;;
		*)
			echo "Invalid command"
			;;
	esac

	# --- Output
	
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

