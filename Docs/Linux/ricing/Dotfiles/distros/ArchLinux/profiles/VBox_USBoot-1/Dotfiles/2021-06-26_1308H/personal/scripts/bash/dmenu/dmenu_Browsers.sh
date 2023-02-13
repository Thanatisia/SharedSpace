#
# Dmenu browser manager
# Author: Asura
# Created: 2021-05-16 1117H, Asura
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#   2021-05-016 1117H : 
#		Created script
#

# --- Variables
PROGRAM_NAME="Browser Manager"

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
function dmenu_Designer()
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
    options=("$@")
	# options=("firefox" "chrome" "surf")
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

function dmenu_Exe()
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

function main()
{
	browsers=(
		"firefox"
		"chrome"
		"surf"
	)
	options="$(dmenu_Designer "${browsers[@]}")"
	ret="$(dmenu_Exe "$options")"
	# echo $ret

	case "$ret" in
		"firefox")
			firefox
			;;
		"chrome")
			google-chrome-stable
			;;
		"surf")
			surfer.sh
			;;
	esac
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

