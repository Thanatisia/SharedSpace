#
# Dmenu - Git Controller
# Author: Asura
# Created: 2021-05-26 1008H, Asura
# Modified: 
#   2021-05-26 1008H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-08 1010H : 
#		Created script
#

# --- Variables
PROGRAM_NAME="Dmenu Git"

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
		"status"
		"config"
		"init"
		"add"
		"commit"
		"push"
		"fetch"
		"merge"
		"pull"
	)
	number_of_Arr="${#arr[@]}"
	options="$(dmenu_Designer "${arr[@]}")"
	ret="$(dmenu_Exe "$options")"
	echo -e "Option Selected: $ret\n"

	case "$ret" in
		"status")
			# Example
			# git status
			git status
			ret_code="$?"
			if [[ "$ret_code" == "0" ]]; then
				# Return code == 0 : Success
				echo "[$ret_code] : Success"
			else
				# Return code == 1 or higher : Error
				echo -e "\n[$ret_code]:"
				case "$ret_code" in
					"128")
						echo "	Generic Exit code"
						echo "	1. Try to initialize a repository"
						;;
					*);;
				esac
			fi
			;;
		"config")
			# Syntax
			#	git config (--global | --system) <options>
			# Examples
			#	git config (--global) user.name
			#	git config (--global) user.email
			#	git config (--system) core.longpaths <true | false (default: Empty)>
			echo "git config"
			;;
		"init")
			# Syntax
			#	git init
			# Examples
			#	git init
			echo "git init"
			;;
		"add")
			# Syntax 
			#	git add <files/directories to add (default : * for all>
			# Examples
			#	git add *
			echo "git add"
			;;
		"commit")
			# Syntax
			#	git commit <options> # Options: { -m <message> }
			# Examples
			#	git commit -m "Hello World, these are my changes"
			echo "git commit"
			;;
		"push")
			# Syntax
			#	git push 
			#		<options> 
			#		<remote-repository-url (default: origin)> 
			#		<branch-name (default: main)>
			# Options: { -u : upstream } 
			# Examples
			#	git push -u origin main
			echo "git push"
			;;
		"fetch")
			# Syntax
			#	git fetch <options>
			# Examples
			#	git fetch
			echo "git fetch"
			;;
		"merge")
			# Syntax
			#	git merge <options>
			# Examples
			#	git merge
			echo "git merge"
			;;
		"pull")
			# Syntax
			#	git pull <options>
			# Examples
			#	git pull
			# Effectively just git fetch + git merge
			echo "git pull"
			;;
		*)
			echo "Options:"
			for(( i=1; i <= $number_of_Arr; i++ )); do
				echo "[$((i))] : [${arr[$((i-1))]}]"
			done
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

