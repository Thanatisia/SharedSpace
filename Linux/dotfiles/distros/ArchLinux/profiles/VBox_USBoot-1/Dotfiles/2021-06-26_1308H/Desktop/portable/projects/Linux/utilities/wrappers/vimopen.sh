#
# Wrapper for Vim
# Author: 
# Created: 2021-05-13 0244H
# Modified: 
#	2021-05-13 0244H, Asura
#	2021-05-14 2246H, Asura
#	2021-06-14 2356H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-13 0244H : Created script file
#	2021-05-14 2246H : Updated list of options
#	2021-06-14 2356H : Fixed function vimopen
#

# --- Variables
PROGRAM_NAME="Vimctrl"


# --- Functions

# General Functions
remove_trailing()
{
	# Command Line Variables
	var="$1"
	to_remove="$2"

	# Local Variables
	res=""

	res="${var%$to_remove}"
	echo "$res"
}

sanitize()
{
	#
	# Sanitize inputs and remove last trailing characters
	# 
	var="$1"
	# to_remove="\\\n"
	to_remove="$2"

	if [[ "$to_remove" == "" ]]; then
		to_remove="\\\n"
	fi

	sanitized_str="$(remove_trailing "$var" "$to_remove")"
	
	echo "$sanitized_str"
}

joinarr()
{
	#
	# Join an arrayn with a delimiter
	#

	# --- Input
	# Command Line Variables
	arr=("$1")
	delim="$2"

	# Local Variables
	res_str=""

	# --- Processing
	# Concatenate options with newline
	for elements in "${arr[@]}"; do
		# vimopts_str+="$opts\n"
		res_str+="$elements\\$delim"
	done
	
	echo "Result: $res_str"

	# Sanitize last newline
	res_str="$(sanitize "$res_str" "$delim")"

	# --- Output
	echo "$res_str"
}

# Validation Functions

# Path Functions
get_fpath()
{
	#
	# Get file path
	#

	# --- Input
	# Local Variables
	dmenu_Options="-c -l 10"
	directories="$(ls $PWD)" # Display all directories

	# --- Processing
	target_filepath="$(echo -e "$directories" | dmenu -p "File Path: " $dmenu_Options)"

	# --- Output
	echo "$target_filepath"
}

get_fname()
{
	#
	# Get file name
	#

	# --- Input
	# Local Variables
	dmenu_Options="-c -l 10"

	# --- Processing
	if [[ "$fname" == "" ]]; then
		# Empty, ask file name
		fname="$(echo "newfile" | dmenu -p "File Name: " $dmenu_Options)"
	fi
	
	# --- Output
	echo "$fname"
}

# Vim Functions
vimnew()
{
	#
	# Open vim with new file
	#

	# --- Input
	# Header
	# Command Line Variables
	fpath="1"

	# Local Variables
	tmp_filename="tmp"

	# --- Processing
	# Body
	vim

	# --- Output
	# Footer
}

vimopen()
{
	#
	# Open vim with a stated file name
	#
	# --- Input
	# Command Line Variables
	fpath="$1"
	fname="$2"

	# --- Processing
	# Validation: File name is empty
	if [[ "$fpath" == "" ]]; then
		fpath="$(get_fpath)"
	fi

	if [[ "$fname" == "" ]]; then
		fname="$(get_fname)"
	fi

	fname="$fpath/$fname"

	# Process File Name
	if [[ "$fname" == "NIL" ]]; then
		vimnew
	else
		vim "$fname"
	fi
}

vimproc()
{
	#
	# Vim options processing
	#

	# --- Input
	# Command Line Variables
	# Local Variables
	dmenu_Options="-c -l 10" 
	vimopts=(
		"New File"
		"Open File"
		"Help"
		"Exit"
	)
	vimopts_str=""

	# --- Processing
	# Concatenate options with newline
	for opts in "${vimopts[@]}"; do
		vimopts_str+="$opts\n"
	done
	# Sanitize last newline
	vimopts_str="$(sanitize "$vimopts_str")"

	# vimopts_str="$(joinarr "${vimopts[@]}" "n")"

	# Option selection
	selected_Option="$(echo -e "$vimopts_str" | dmenu -p "File Options: " $dmenu_Options)"

	echo "Selected Option: $selected_Option"
	case "$selected_Option" in
		"New File") 
			vimnew
			;;
		"Open File")
			vimopen
			;;
		"Help")
			echo "Options:"
			echo "	New File: Opens a blank vim on the home directory
	- You can use ':o <filename>' to save to a specific file path
	- Type ':w' to save to the home directory
			"
			echo "	Open File: Asks for your target file path and target file name
	- if empty; program will default to Current working directory
	- if empty; program will use a default name
			"
			;;
		"Exit")
			exit
			;;
		*)
			echo "Invalid option"
			;;
	esac

	# --- Output
}

function main()
{
	vimproc
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

