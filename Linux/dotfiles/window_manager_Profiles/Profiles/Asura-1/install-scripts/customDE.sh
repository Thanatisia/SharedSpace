#
# Window Manager to Desktop Environment Setup Script
#	- Turning Window Managers into your own Custom Desktop Environment
# Author: Asura
# Created: 2021-06-15 2342H, Asura
# Modified: 
#	- 2021-06-15 2342H, Asura
# Features: 
# Background Information: 
#	- This script aims to allow user to turn a window manager of your choice into your very own
#		Custom Desktop Environment
# Changelog:
#	- 2021-06-15 2342H, Asura:
#		- Created script file
#

# --- Variables

# [Program]
PROGRAM_SCRIPTNAME="customDE"
PROGRAM_NAME="Window Manager to Desktop Environment Custom Setup Script"
PROGRAM_TYPE="Main"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# [Folders]
logging_filepath=~/.logs
config_Path=~/.config

# [Arrays]
folders_to_create=(
	$logging_filepath
	$config_Path
)

base_distros=(
	"ArchLinux"
	"Debian"
	"Gentoo"
	"Void Linux"
)

# [Associative Array]
declare -A reference_Distros=(
	[ArchLinux]="ArtixLinux;"
	[Debian]="Ubuntu"
)
declare -A install_commands=(
	[ArchLinux]="sudo pacman -S --noconfirm --needed"
	[Debian]="sudo apt-get install"
)
declare -A pkgs=(
	# Place all your packages you want to be in the 
	# Desktop Environment here
	# according to category
	# - Please seperate each package with ';'
	# Syntax:
	#	[<category>]="
	# Examples:
	#	[file-browser]="package-1;package-2;package-n"
	[file-browser]="pcmanfm"
	[window-manager]="qtile"
	[terminal-emualator]="alacritty"
	[web-browser]="brave"
	[graphical-text-editor]="sublime-text-dev"
	[image-setter]="nitrogen"
	[compositor]="picom"
	[system-monitor]="conky"
	[bluetooth-manager]="bluez"
	[ricing]="lxappearance-gtk3"
	[fetch]="neofetch"
	[others]=""
)

# [Derivatives]
number_of_Packages="${#pkgs[@]}"

# [Essentials]
install_Command="${install_commands["$DISTRO"]}"

# --- Functions

# General Functions
create_directories()
{
	folders=("$1")
	
	# Create folders if doesnt exist
	for d in "${folders[@]}"; do
		if [[ ! -d $d ]]; then
			mkdir -p $d
		fi
	done
}

seperate_by_Delim()
{
	#
	# Seperate a string into an array by the delimiter
	#

	# --- Input
	
	# Command Line Argument
	delim="${1:-';'}"	# Delimiter to split
	str="$2"			# String to be seperated

	# Local Variables

	# Array
	content=()			# Array container to store results
	char=''				# Single character for splitting element of a string

	# Associative Array

	# --- Processing
	# Split string into individual characters
	IFS=$delim read -r -a content <<< "$str"
	
	# --- Output
	echo "${content[@]}"
}

# Installation Stages
pkg_install()
{
	#
	# Install relevant/required Packages
	#

	# Local Variables
	str="${pkgs[@]}"


	# Split value string into container
	arr=("$(seperate_by_Delim ';' "$str")")

	echo "Array: ${arr[@]}"

	# Confirm installation
	for p in "${!pkgs[@]}"; do
		echo "[$p] : [${pkgs[$p]}]"
	done
	read -p "Confirm installation of the above following packages? [Y|N]: " conf

	echo ""
	
	echo "Installing..."
	
	echo ""

	if [[ "$conf" == "Y" ]]; then
		for p in "${pkgs[@]}"; do
			if [[ ! "$p" == "" ]]; then
				# Do if NOT empty
				# else skip
				if [[ "$MODE" == "DEBUG" ]]; then
					echo $install_Command $p | tee -a $logging_filepath/installed-packages.log
				else
					$install_Command $p | tee -a $logging_filepath/installed-packages.log
				fi
			fi
		done
	fi
}

# Setup Stages
configs()
{
	#
	# Configs setup
	#
	echo "Create Configs"
}


# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
	echo "Running on  : $DISTRO"
	create_directories "${folders_to_create[@]}"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"


	echo "========================================================"
	echo "             Custom Desktop Environment                 "
	echo "   Turning Window Managers into a Desktop Environment   "
	echo "========================================================"

	echo ""
	
	echo "=================================="
	echo "Stage 1: Install Relevant Packages"
	echo "=================================="
	pkg_install

	echo ""

	echo "======"
	echo " End  "
	echo "======"
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

