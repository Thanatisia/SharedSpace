#
# User-Defined Git Workflow Maker
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
#	- A general Git workflow automator script
# Changelog:
#

# --- Variables
PROGRAM_SCRIPTNAME="User-Example"
PROGRAM_NAME="Git Workflow Automatic Maker"
PROGRAM_TYPE="Main"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# --- Functions

# General Functions

# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
	echo "Running on  : $DISTRO"
}

body()
{
	#
	# Main function to run
	#

	# --- Input
	# Command Line Arguments
	argv=("$@")
	argc="${#argv[@]}"

	# Local Variables
	if [[ "$argc" -ge 1 ]]; then
		# Greater than OR equals to 1 parameters
		msg="${argv[0]}" # 1st Argument

		# Check more than 1 Argument : 2 Arguments
		if [[ "$((argc-1))" -ge "2" ]]; then
			remote_repository_URL="${argv[1]}"	# 2nd Argument
			repository_Branch="${argv[2]}"		# 3rd Argument
		fi
	else
		msg="Changes made"
		remote_repository_URL="origin"
		repository_Branch="main"
	fi

	# --- Processes
	status="$(git status)" # Check If changes
	if [[ ! $(echo $status | grep 'Your branch is up to date') == "" ]]; then
		# If changes are found
		git add *
		git commit -m "$msg"
		git push -u $remote_repository_URL $repository_Branch
	else
		# No changes found
		echo "No changes found."
	fi
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{
	#
	# Main Function 
	#  - You may not edit this if you want to leave it as default
	#
	body "$@"
	res="$?"
	echo "$res"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

