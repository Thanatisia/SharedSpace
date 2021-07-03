#
# External Library Script
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
#	An 'all-in-one' external library script that will contain all/many useful functions that can be used in various situations 
#	and/or 
#	can be used as reference code
#	such as split string
# Changelog:
#

# --- Variables
PROGRAM_SCRIPTNAME="extlib"
PROGRAM_NAME="External Library for Bash"
PROGRAM_TYPE="Main | Library"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# --- Functions



# General Functions

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

comment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '/$regex_Pattern/s/^/#/g' $filename
}
uncomment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '/$regex_Pattern/s/^#//g' $filename
}

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

