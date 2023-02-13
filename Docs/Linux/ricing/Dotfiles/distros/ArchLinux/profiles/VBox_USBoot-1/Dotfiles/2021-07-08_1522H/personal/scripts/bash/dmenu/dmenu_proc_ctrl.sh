#
# Dmenu script template file
# Author: Asura
# Created: 2021-05-10 1123H, Asura
# Modified: 
#	2021-05-10 1123H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-10 1123H : 
#		Created script
#

# --- Variables
PROGRAM_NAME="Process Control (via Dmenu)"

# --- General Functions
join_newline()
{
	arr_Container=("$1")
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
    options=($1)
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
    dmenu_Options="-c -l 10 -fn 1000"

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

function processor()
{
	# Command Line Variables
	ret="$1"

	# Local Variables
	declare -A opts=(
		[ps]="all processes"
		[pkill]="process kill (name)"
		[kill]="process kill (ID)"
		[help]="Definitions of the options"
	)

	# Processing suboptions
	declare -A subopt_PS=(
		[ax]="All with tty, except session leaders AND processes without controlling ttys"i
		[help]="Definitions of the options"
	)

	declare -A subopt_PKILL=(
		[help]="Definitions of the options"
	)

	declare -A subopt_ID_KILL=(
		[help]="Definitions of the options"
	)

	dmenu_Options="-c -fn 1000" 

	# --- Processing
	# Switch case if process command is selected
	case "$ret" in
		"ps")
			#
			# Get additional options
			# i.e.
			#	ps ax
			#
			suboption="$(echo -e "ax\nsearch\nhelp" | dmenu -l 10 -p "Additional Options: " $dmenu_Options)"
			fullcmd="$ret $suboption"
			key="${!subopt_PS[@]}"	
			# Check user input
			case "$suboption" in
				"help")
					for k in "${!subopt_PS[@]}"; do
						v="${subopt_PS[$k]}"
						echo "	[$k] : $v"
					done
					;;
				"search")
					# Search process
					search_keyword="$(echo -e "ps ax" | dmenu -p "Keyword: " $dmenu_Options)"
					fullcmd="$($ret ax | grep "$search_keyword")"
					if [[ ! "$search_keyword" == " " ]]; then
						# Not empty
						echo "Result: $fullcmd"
					else
						# Empty
						echo "No keyword entered."
					fi
					;;
				*)
					echo "Command: $fullcmd"
					$fullcmd 
					;;
			esac
			;;
		"pkill")
			#
			# Get Process name
			#
			suboption="$(echo -e "help" | dmenu -p "Application to kill: " $dmenu_Options)"
			fullcmd="$ret $suboption"
			key="${!subopt_PKILL[@]}"
			case "$suboption" in
				"help")
					for k in "${!subopt_PKILL[@]}"; do
						v="${subopt_PKILL[$k]}"
						echo "	[$k] : $v"
					done
					;;
				*)
					echo "Command: $fullcmd"
					$fullcmd 
					;;
			esac
			;;
		"kill")
			#
			# Get Process ID
			#

			# List all processes
			ps ax

			# Get user input
			suboption="$(echo -e "help" | dmenu -p "Process ID to kill: " $dmenu_Options)"
			fullcmd="$ret $suboption"
			key="${!subopt_ID_KILL[@]}"
			case "$suboption" in
				"help")
					for k in "${!subopt_ID_KILL[@]}"; do
						v="${subopt_PS[$k]}"
						echo "	[$k] : $v"
					done
					;;
				*)
					echo "Command: $fullcmd"
					$fullcmd 
					;;
			esac
			;;
		*)
			# Help
			for k in "${!opts[@]}"; do
				v="${opts[$k]}"
				echo "	[$k] : $v"
			done
			;;
	esac
}

function main()
{
	declare -A opt_Combined=(
		[ps]="all processes"
		[pkill]="process kill (name)"
		[kill]="process kill (ID)"
		[help]="Definition of each option"
	)
	opt_Cmd="${!opt_Combined[@]}"
	opt_Names="${opt_Combined[@]}"

	#echo "Keys: $opt_Cmd"
	#echo "Values: $opt_Names"

	options1="$( dmenu_Designer "${opt_Cmd[@]}" )"

	#echo "Options: $options1"

	ret="$(dmenu_Exe "$options1")"
	dmenu_Options="-c -fn 1000"

	#echo "Dmenu options: $dmenu_Options"
	#echo "Dmenu ExE Return: $ret"

	# Layer [1] Validation - Processing commands
	processor "$ret"
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

