#
# ArchWiki README page viewer
# Author: Asura
# Created: 2021-05-11 1510H, Asura
# Modified: 
#	2021-05-11 1510H, Asura
#	2021-05-12 1043H, Asura
# Features: 
# Background Information: 
#	- A terminal-based archwiki page viewer/surfer
# Changelog:
#	2021-05-11 1510H, Asura :
#		- Created script file
#	2021-05-12 1043H, Asura :
#		- Added wiki url for 'android'
#


# --- NOTES:
# [Arrays (General)]
# to access all values in an array : Use '@'; "${<array_variable>[@]}"
# [Arrays (Associative)]
# use declare -A : To create associative arrays
# to access keys : "${!<array_variable>[@]}"
# to access values : "${<array_variable>[@]}"



# --- Global Variables
PROGRAM_NAME="Archwiki page Bookmark & viewer"

associative="declare -A"

function read_File()
{
	file="pages"

	lines=""
	while IFS= read -r line; do
		# Check if line contains '#' or contains '=': 
		#	if dont have : Append
		# 	Else : Ignore
		if [[ "$(echo $line | grep "#")" == "" ]]; then
			# echo "No Sharp"
			if [[ ! "$(echo $line | grep "=")" == "" ]]; then
				# echo "Have Equals"
				lines+="$line\n"
			fi
		fi
	done < "$file"

	# echo -e "content: $lines"
	#res_format_1=$(echo -e "$lines" | cut -d '=' -f1)
	#res_format_2=$(echo -e "$lines" | cut -d '=' -f2)
	#echo "Result 1: $res_format_1"
	#echo "Result 2: $res_format_2"
	echo -e "$lines"
}

create_associative_Array()
{
	# --- NOTES:
	# [Arrays (General)]
	# to access all values in an array : Use '@'; "${<array_variable>[@]}"
	# [Arrays (Associative)]
	# use declare -A : To create associative arrays
	# to access keys : "${!<array_variable>[@]}"
	# to access values : "${<array_variable>[@]}"


	# --- Input
	# Command Line Variables
	keys=("$1")
	values=("$2")

	#echo "Input Keys: ${keys[@]}"
	#echo "Input Values: ${values[@]}"

	# Local Variables
	declare -A arr=()
	
	# --- Processing
	# Body
	for k_ID in "${!keys[@]}"; do
		# Loop id
		# arr+=([${keys[$k_ID]}]=${values[$k_ID]})
		curr_key=${keys[$k_ID]}
		curr_val="${values[$k_ID]}"
		#echo "Current Key: $curr_key"
		#echo "Current Val: $curr_val"
		arr+=([$curr_key]=$curr_val)
	done

	# --- Output

	# Footer
	echo "${arr[@]}"
}

function view_Page()
{
	#
	# Archwiki Pages
	#

	# --- Input
	# Local Variables
	#declare -A pages=(
	#	[android]=https://wiki.archlinux.org/title/android
	#	[conky]=https://wiki.archlinux.org/title/conky
	#)
	#topic="${!pages[@]}" # Key
	#link="${pages[@]}" # Value
	declare -A arr=()
	
	# Get Pages
	pages="$(read_File)"
	keys_str="$(echo "$pages" | cut -d '=' -f1)"
	values_str="$(echo "$pages" | cut -d '=' -f2)"

	# --- Processing

	# Convert multiline string into array
	IFS=$'\n'

	# Body
	for k_ID in "${!keys[@]}"; do
		# Loop id
		# arr+=([${keys[$k_ID]}]=${values[$k_ID]})
		curr_key=${keys[$k_ID]}
		curr_val="${values[$k_ID]}"
		echo "Current Key: $curr_key"
		echo "Current Val: $curr_val"
		arr+=([$curr_key]=$curr_val)
	done

	echo "[${!arr[@]} : ${arr[@]}]"
	
	# --- Processing

	# --- Output
}

function main()
{
	# content="$(view_Page)"
	keys=("Hi")
	values=("World")
	content="$(create_associative_Array "${keys[@]}" "${values[@]}")"
	echo "Key: ${!content[@]}"
	echo "Value: ${content[@]}"
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
    # main "$@"
	# read_File
    view_Page
	END
fi

