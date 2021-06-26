#
# All-in-One Shellscript Library
# Author: Asura 
# Created: 2021-05-19 2253H, Asura
# Modified: 
#	2021-05-19 2253H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-19 2253H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="External Library"
PROGRAM_TYPE="Library"


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

# Library Functions
function seperate_key_Value()
{
	#
	# Given a string with a seperator (i.e. key=value)
	# Retrieve the key and the value
	# array element [0] : Key
	# array element [1] : Value
	#

	# --- Input

	# Command Line Variables
	in_String="$1"
	delimiter="$2"
	ret_Type="${3:-key}"

	# Local Variables
	contents=()
	key=""
	value=""
	res=""

	# --- Processing
	# Seperate key - value
	key="$(echo $in_String | cut -d $delimiter -f1)"
	value="$(echo $in_String | cut -d $delimiter -f2)"

	# Store content into array
	# contents[0]="$key"
	# contents[1]="$value"
	contents=("$key" "$value")

	#for c in "${contents[@]}"; do
	#	echo "Item: $c"
	#done
	
	# --- Output
	# echo ${contents[@]}
	case "$ret_Type" in
		"value")
			res="$value"
			;;
		*)
			res="$key"
			;;
	esac

	echo "$res"
}

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

function get_Key()
{
	#
	# Get Key from a key-value string
	#

	# --- Input

	# Command Line Variables
	in_String="$1"
	delimiter="$2"

	# Local Variables
	contents=()
	key=""
	value=""
	res=""

	# --- Processing
	# contents=("$(seperate_key_Value "$in_String" "$delimiter")")
	# key="${contents[0]}"
	# value="${contents[1]}"
	contents="$(seperate_key_Value "$in_String" "$delimiter")"

	# --- Output
	# echo "Key: $key"

	# for c in "${contents[@]}"; do
	# 	echo "Item: $c"
	# done
	echo "$contents"
}

function get_Value()
{
	#
	# Get Value from a key-value string
	#

	# --- Input

	# Command Line Variables
	in_String="$1"
	delimiter="$2"

	# Local Variables
	contents=("")
	key=""
	value=""
	res=""

	# --- Processing
	#contents=$(seperate_key_Value "$in_String" "$delimiter")
	#key="${contents[0]}"
	#value="${contents[1]}"
	contents="$(seperate_key_Value "$in_String" "$delimiter" "value")"

	# --- Output
	# echo "Value: $value"

	# for c in "${contents[@]}"; do
	# 	echo "Item: $c"
	# done
	echo "$contents"
}

get_array_Size()
{
	#
	# Get size of array
	#

	arr=("$@")
	size="${#arr[@]}"
	echo "$size"
}

# Main functions
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

