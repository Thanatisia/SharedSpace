#
# Linux (Shell) Makefile script
# Author: Asura
# Created: 2021-06-05 2312H, Asura
# Modified: 
#	2021-06-05 2312H, Asura
# Features: 
# Background Information: 
#	[Purpose]
#	For Post-installation ArchLinux setup. Installation scripts WIP
# Changelog:
#	2021-06-05 2312H, Asura:
#		Created script file
#

# --- Variables
# [Program]
PROGRAM_NAME="Linux shell makefile script"
PROGRAM_TYPE="Main"
# [Global]
# Arrays
prereq=(
	# Pre-Requisites here
	""
)
# Associative Arrays
target=(
	# Target scripts here
	"postinstallations-root.sh"
	"setup.sh"
	"postinstallations.sh"
	"customs.sh"
)

# --- Functions

# General Functions


# Main functions
init()
{
	#
	# On Runtime initialization
	#
	echo "Program Name: $PROGRAM_NAME"
}

body()
{
	#
	# Main function to run
	#

	# Command Line Variables
	argv=("$@")
	argc="${#argv[@]}"

	# Local Variables
	ret_code=""
	number_of_Targets="${#target[@]}"
	for(( i=0; i < $number_of_Targets; i++ )); do
		current_Target="${target[$i]}"

		case "$current_Target" in
			"postinstallations-root.sh")
				echo "Switch user"
				read -p "Target user: " new_User
				echo "$(whoami)"
				;;
			*)
				sudo su $new_User -c "echo $(whoami) : { [$i] = [$current_Target] }"
				sudo su $new_User -c "$current_Target"
				ret_code="$?"
				echo "	Ret Code [$ret_code]"
				;;
		esac
	done
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{	
	body "$@"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    init
	main "$@"
    END
fi

