#
# Tutorial: Arrays
# Author: Asura
# Created: 2021-05-17 0947H, Asura
# Modified: 
#	2021-05-17 0947H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-17 0947, Asura:
#		- Created script
#

# --- Variables
PROGRAM_NAME="Arrays"
PROGRAM_TYPE="Main"


# --- Functions

# General Functions
function startup()
{
	# --- Input
	ret_code="0"

	# --- Processing
	ret_code="1"

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

function END()
{
    line=""
    read -p "Pause" line
}

function tutorial_Array()
{
	arr=("$1")

	echo "Contents in array: "
	echo "${arr[@]}"
}

function body()
{
	in_Arr=(
		"Hello World" 
		"Hello World 2"
	)
	tutorial_Array "${in_Arr[@]}"
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

