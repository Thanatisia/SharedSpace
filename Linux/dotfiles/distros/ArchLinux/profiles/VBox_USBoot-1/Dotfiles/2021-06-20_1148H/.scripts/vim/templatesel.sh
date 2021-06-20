#
# Template Selector
# Author: Asura
# Created: 2021-05-17 18:14H, Asura
# Modified: 
#	2021-05-17 1814H, Asura
# Features: 
#	- Program will process the name received by user
#		- Extension/script type will determine the template type to be retrieved
#		- System will copy the relevant template file (full or minimal version)
#		- i.e
#			autocmd BufNewFile *.<extension>   0r templatesel.sh "<extension>"
# Background Information: 
#	Template selector for vimrc template copy function
# Changelog:
#	2021-05-17 1814H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="Template Selector"
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
function START()
{
	echo "PROGRAM NAME: $PROGRAM_NAME"
	echo "PROGRAM TYPE: $PROGRAM_TYPE"
}

get_script_Name()
{
	#
	# Get script names depending on minimal or full
	#

	script_type="$1"
	template_file_Full="$2"
	template_file_Minimal="$3"

	case "$script_type" in
		"minimal")
			vim_template_File="$template_file_Minimal"
			;;
		*)
			vim_template_File="$template_file_Full"
			;;
	esac

	echo "$vim_template_File"
}

script_copy()
{
	#
	# Copy script contents
	#

	# --- Input
	
	# Command Line Variables
	template_file_Full="$1"
	template_file_Minimal="$2"
	script_type="${3-full}"

	# Local Variables
	script_Name=""

	# --- Processing
	script_Name="$(get_script_Name "$script_type" "$template_file_Full" "$template_file_Minimal")"

	echo "Copy script: $script_Name"

	# --- Output
	# echo "Copy script [$script_Name]"
	
}


body()
{
	#
	# Main function to run
	#

	# --- Input

	# Command Line Variables
	script_ext="$1" # Script Extension
	script_type="${2:-full}" # Script file type - Minimal | Full (default: Minimal)

	# Local Variables
	vim_template_Path=~/.vim/templates
	vim_template_File=""
	fname_Full=""
	fname_Minimal=""

	# --- Processing
	# Validate Script Extension
	case "$script_ext" in
		"bash")
			# Copy script contents
			fname_Full="main.sh"
			fname_Minimal="main.min.sh"
			;;
		"html")
			# Copy script contents
			fname_Full="index.html"
			fname_Minimal="index.min.html"
			;;
		"css")
			# Copy script contents
			fname_Full="main.css"
			fname_Minimal="main.min.css"
			;;
		"javascript")
			# Copy script contents
			fname_Full="main.js"
			fname_Minimal="main.min.js"
			;;
		"c")
			# Copy script contents
			fname_Full="main.c"
			fname_Minimal="main.min.c"
			;;
		"c++" | "cpp")
			# Copy script contents
			fname_Full="main.cpp"
			fname_Minimal="main.min.cpp"
			;;
		"header")
			# Copy script contents
			fname_Full="main.h"
			fname_Minimal="main.min.h"
			;;
		"csharp")
			# Copy script contents
			fname_Full="main.cs"
			fname_Minimal="main.min.cs"
			;;
		"python")
			# Copy script contents
			fname_Full="main.py"
			fname_Minimal="main.min.py"
			;;
		"java")
			# Copy script contents
			fname_Full="main.java"
			fname_Minimal="main.min.java"
			;;
		"markdown")
			# Copy script contents
			fname_Full="README.md"
			fname_Minimal="README.min.md"
			;;
		*)
			echo "Invalid type"
			;;
	esac

	vim_template_File="$(script_copy "$fname_Full" "$fname_Minimal" "$script_type")"
	echo "Vim File: $vim_template_Path/$vim_template_File"
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

