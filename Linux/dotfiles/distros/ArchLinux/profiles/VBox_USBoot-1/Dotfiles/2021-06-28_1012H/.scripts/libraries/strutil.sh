#
# String-based Utilities
# Author: Asura
# Created: 2021-06-16 2212H, Asura
# Modified: 
#	- 2021-06-16 2212H, Asura:
# Features: 
# Background Information: 
#	- A utilities library surrounding strings and manipulation of string-based variables.
# Changelogs
#	- 2021-06-16 2212H, Asura:
#		 - Created script file
#

# --- Variables
PROGRAM_SCRIPTNAME="strutil.sh"
PROGRAM_NAME="String Utilities"
PROGRAM_TYPE="Library"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# --- Functions

# String Functions
seperate_by_Delim()
{
	#
	# Seperate a string into an array by the delimiter
	#

	# --- Input
	
	# Command Line Argument
	delim="${1:-';'}"	# Delimiter to split
	str="$2"			# String to be seperated

	# Local Variables

	# Array
	content=()			# Array container to store results
	char=''				# Single character for splitting element of a string

	# Associative Array

	# --- Processing
	# Split string into individual characters
	IFS=$delim read -r -a content <<< "$str"
	
	# --- Output
	echo "${content[@]}"
}


# General Functions



# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
	echo "Running on  : $DISTRO"
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

	body "$@"
	res="$?"
	echo "$res"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

