#
# Dmenu Index page-chooser script
# Author: Asura
# Created: 2021-05-08 1835H, Asura
# Modified: 
#   2021-05-08 1835H, Asura
#   2021-05-08 1848H, Asura
#	2021-05-10 1028H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-08 1835H : Created script
#   2021-05-08 1848H : Created functions (
#       dmenu_Designer()
#       dmenu_Exe()
#   )
##	2021-05-10 1028H : 
#		1. Created functions [join_newline(), sanitize()]
#		2. Modified dmenu_Designer() to join array into string with '\n' delimiter immediately in the function
#		3. Modified dmenu_Exe() to remove array inputs and change into string inputs
#		4. Fixed sanitize()
#

# --- Variables
PROGRAM_NAME="Dmenu-Index"

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

    # Edit Options
    #options=(
    #    "dmenu_fopener.sh"
    #    "dmenu_Template.sh"
	#	"dmenu_proc_ctrl.sh"
    #)
	options=()
	for files in `ls *.sh`; do
		options+=("$files")
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
    echo $res
}

function main()
{
    #options=("$(dmenu_Designer)")
    # DEBUG: echo "Options: ${options[@]}"
    #ret="$(dmenu_Exe "${options[@]}")"
    #echo "Selected: $ret"
	options="$(dmenu_Designer)"
	ret="$(dmenu_Exe $options)"

    # Execute selected program
    if [[ ! "$ret" == "" ]]; then
        "$ret" &&
            echo "Program [$ret] executed." ||
                echo "Error executing program [$ret]"
    fi

    # ALT: Switch Case selection
    
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

