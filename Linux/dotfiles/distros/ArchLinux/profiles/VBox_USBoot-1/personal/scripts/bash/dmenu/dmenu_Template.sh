#
# Dmenu script template file
# Author: Asura
# Created: 2021-05-08 1010H, Asura
# Modified: 
#   2021-05-08 1010H, Asura
#   2021-05-08 1848H, Asura
#	2021-05-10 1031H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-08 1010H : 
#		Created script
#   2021-05-08 1848H : 
#		Created functions (
#       	dmenu_Designer()
#       	dmenu_Exe()
#   	)
#	2021-05-10 1028H : 
#		1. Created functions [join_newline(), sanitize()]
#		2. Modified dmenu_Designer() to join array into string with '\n' delimiter immediately in the function
#		3. Modified dmenu_Exe() to remove array inputs and change into string inputs
#		4. Fixed sanitize()
#

# --- Variables
PROGRAM_NAME="NIL"

# --- General Functions
join_newline()
{
	arr_Container=($1)
	arr_str=""
	delimiter="\n"
	
	# Processing
	for i in "${!arr_Container[@]}"; do
		# Concatenate \n
		arr_str+="${arr_Container[$i]}$delimiter"
	done
	echo "$arr_str"
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

# --- Dmenu Functions
dmenu_Designer()
{
    #
    # Design Options to populate Dmenu
	# 1. Create options
	# 2. Merge array elements with delimiter 'newline' into a string
	# 3. Sanitize result string - (Search for trailing newline etc.)
	# 4. Return options
    #

	# --- Input
    # Edit Options
    #options=(
    #    "Hello World"
    #    "Hello World 2"
    #    "Hello World 3"
    #)
	options=("$@")
	all_opts=""

	# --- Processing
	# Join with newline
	for opt_ID in "${!options[@]}"; do
		# Concatenate \n
		all_opts+="${options[$opt_ID]}\n"
	done
	#all_opts="$(join_newline "${options[@]}")"

	# Sanitize
	ret_string="$(sanitize "$all_opts" "\\\n")"

	# --- Output
    # echo ${options[@]}
	echo "$ret_string"
}

dmenu_Exe()
{
    # 
    # Dmenu runner function
    #
    
    # --- Input
    # Command Line/Terminal Variables
    src="$1"

	# Local Variables
    src_String=""
    dmenu_Options="-c -l 10"

    # --- Processing
    # Body
    #for opt in "${src[@]}"; do
    #    src_String+="$opt"
    #done
	src_String="$src"

    # --- Output
    # Footer
    res="$(echo -e "$src_String" | dmenu $dmenu_Options)"
    echo $res
}

function for_template_only()
{
    #
    # This function is for template only
    #

    echo "Displaying Template code..."
    cat $0
}

function main()
{
	arr=(
		"Hello World"
		"Hello World 2"
		"Hello World 3"
	)
	options="$(dmenu_Designer "${arr[@]}")"
	ret="$(dmenu_Exe "$options")"
	echo $ret

	# for_template_only
}

function START()
{
    echo "Program Name: $PROGRAM_NAME"
}

function END()
{
    line=""
    read -p "Exiting $PROGRAM_NAME..." line
}


if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

