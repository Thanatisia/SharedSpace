#
# Dmenu File Opener
# Author: Asura
# Created: 2021-05-08 1010H, Asura
# Modified: 
#   2021-05-08 1010H, Asura
#	2021-05-10 1054H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-08 1010H : 
#		Created script
#	2021-05-10 1054H :
#		1. Created function(s) [sanitize() ]
#		2. Modified dmenu_Designer() to join array into string with '\n' delimiter immediately in the function
#		3. Modified dmenu_Exe() to remove array inputs and change into string inputs
#

# --- Variables
PROGRAM_NAME="Dmenu File Opener"


# --- Functions

# General Functions
sanitize()
{
	var="$1"
	to_remove="$2"
	res=""

	res="${var%$to_remove}"
	# res=${var%\\n}
	echo "$res"
}

# Dmenu Functions
dmenu_Designer()
{
    #
    # Design Dmenu
    #

    # Variables
    options=()

    # Find all files in the user directory
    # yourfilenames=`ls ~/.*`
    yourfilenames=`ls -d $PWD/.*`
    for eachfile in $yourfilenames
    do
       # echo $eachfile
       options+=("$eachfile")
    done
	all_opts=""

	# --- Processing
	# Join with newline
	for opt_ID in "${!options[@]}"; do
		# Concatenate \n
		all_opts+="${options[$opt_ID]}\n"
	done
	#all_opts="$(join_newline "${options[@]}")"

	# Sanitize
	ret_string="$(sanitize "$all_opts" "\\n")"

	# --- Output
	echo "$ret_string"
}

dmenu_Exe()
{
    # 
    # Dmenu runner function
    #
    
    # Input
    # --- Variables
    src="$1"
    src_String=""
    dmenu_Options="-c -l 10"

    # Processing
    # --- Body
    #for opt in "${src[@]}"; do
    #    src_String+="$opt"
    #done
	src_String="$src"

    # Output
    # --- Footer
    res="$(echo -e $src_String | dmenu $dmenu_Options)"
    
	res_code="$?"

	if [[ "$res_code" == "0" ]]; then
		# Success

		echo "Selected File: $res"
    	# Open selected file
    	vim $res
	fi
}

function main()
{
    # options=("$(dmenu_Designer)")
    # DEBUG: echo "Options: ${options[@]}"
    # ret="$(dmenu_Exe "${options[@]}")"
    # dmenu_Exe "${options[@]}"
    options="$(dmenu_Designer)"
	dmenu_Exe "$options"

	ret="$?"
    echo $ret
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

