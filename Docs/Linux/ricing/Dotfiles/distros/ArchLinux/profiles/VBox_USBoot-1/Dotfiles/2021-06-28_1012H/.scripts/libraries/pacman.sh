#
# Package Manager Utilities Library
# Author: Asura
# Created: 2021-06-16 2241H, Asura
# Modified: 
#	- 2021-06-16 2241H, Asura
# Features: 
#	- Functions
# Background Information: 
#	- Contains functions related to the stated Package Manager
# Changelog:
#	- 2021-06-16 2241H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_SCRIPTNAME="pacman.sh"
PROGRAM_NAME="Package Manager Utilities"
PROGRAM_TYPE="Library"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# --- Functions

# Package Manager (Distro Dependent)
case "$DISTRO" in
	"ArchLinux")
		# Pacman Variables
		cmd_pkg_Find="pacman -Qs --color always"
		;;
	"Debian")
		# apt/apt-get Functions
		;;
	"Gentoo")
		# Portage : emerge
		;;
	"Void Linux")
		;;
esac

find_pkg()
{
	#
	# Find Package if it exists
	#
	
	# --- Input
	pkg="$1"

	# --- Processing
	cmd_pkg_Find+=" $pkg"

	# --- Output
	echo "Command: $cmd"
	echo "$($cmd)"
}

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
	argv=("$@")
	argc="${#argv[@]}"


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

