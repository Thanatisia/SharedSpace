#
# Window Manager to Desktop Environment Setup Script
#	- Turning Window Managers into your own Custom Desktop Environment
# Author: Asura
# Created: 2021-06-15 2342H, Asura
# Modified: 
#	- 2021-06-15 2342H, Asura
#	- 2021-07-02 1349H, Asura
#	- 2021-07-02 2324H, Asura
#	- 2021-07-03 1246H, Asura
# Features: 
# Background Information: 
#	- This script aims to allow user to turn a window manager of your choice into your very own
#		Custom Desktop Environment
# Changelog:
#	- 2021-06-15 2342H, Asura:
#		- Created script file
#	- 2021-07-02 1349H, Asura:
#		- Added 'EDIT THIS' indicators to the variables intended for editing
#	- 2021-07-02 2324H, Asura
#		- Documentation changes
#	- 2021-07-03 1246H, Asura
#		- Added extra stages before creating dotfiles
#			- Created function 'user_mgmt'
#			- Added 'su - $TARGET_USER' to execute command as user
# Notes:
#	1. As of 2021-07-02 1348H
#		- Please run this only AFTER you have done a base installation as
#		- I have yet to integrate the base installation functions
# TODO:
#	1. 2021-07-02 1352H
#		i. Convert sections [Folders], [Files] and all the loose variables into Associative Array for easy handling
#

# --- Variables

# [Program]
PROGRAM_SCRIPTNAME="customDE"
PROGRAM_NAME="Window Manager to Desktop Environment Custom Setup Script"
PROGRAM_TYPE="Main"
MODE="DEBUG" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# [General]
TARGET_USER=""

# [Path]
#
# EDIT THIS
# Please write all your path variables in this section
#
ROOT=~

# [Folders]
#
# EDIT THIS
# Please write all your folder variables in this section
#
logging_filepath=~/.logs
logging_filepath_Stages=$logging_filepath/$PROGRAM_SCRIPTNAME # "Custom Window Manager to Desktop Environment setup script"
config_Path=~/.config
script_Path=~/.script
tmp_Path=~/.tmp
personal_Path=~/personal
personal_path_Dotfiles=$personal_Path/dotfiles
personal_path_dotfiles_Bash=$personal_path_Dotfiles/bash

# [Files]
#
# EDIT THIS
# Please write all your file variables in this section
#
bashrc=$ROOT/.bashrc
bashrc_personal=$personal_path_dotfiles_Bash/.bashrc-personal

# [Arrays]
folders_to_create=(
	#
	# EDIT THIS
	# Please place all the folders you would like to create
	#
	$logging_filepath
	$logging_filepath_Stages
	$config_Path
	$script_Path
	$tmp_Path
	$personal_path_dotfiles_Bash
)

files_to_create=(
	#
	# EDIT THIS
	# Please place all the files you would like to create
	#
	$bashrc_personal
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
	#
	# EDIT THIS
	#
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
declare -A files_to_edit(
	#
	# EDIT THIS
	#
	# Place your files and the content here
	# [Syntax]
	#	Single Line:
	#	[folder_path]="Contents"
	#	Multi Line:
	#	[folder_path]="line 1\
	# line 2 \
	# line 3"
	[$bashrc]="\
	# --- Adding external Bashrc personal file \
	if [[ -f $bashrc_personal ]]; then \
		# If found \
		. $bashrc_personal \
	fi"
	[$bashrc_personal]="#\
	# --- BashRC [Personal] \
	#"
)
declare -A users=(
	#
	# EDIT THIS
	#
	# Place all your users and their roles here
	# Parameter Seperator/Delimiter: ';'
	# Subparameter Seperator/Delimiter: ','
	# [Syntax]
	# [username]="$primary_Group;$secondary_group_element_1,$secondary_group_element_n;$home_dir"
	# [username]="$primary_Group;$secondary_Group;$home_dir"
	[admin]="wheel;admin;/home/profiles/"
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

log_datetime()
{
	#
	# Return datetime as of setting
	#
	format=${1:-'%d-%m-%y %H-%M-%S'}
	echo "$(date +'%d-%m-%y %H-%M-%S')"
}

# Pre-Requisite Stages
# Execute in Root
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

user_mgmt()
{
	#
	# Create User 
	#

	# --- Input
	# Local Variables
	# -m | --create-home : 
	#	- Create the user's home directory if it doesnt exist
	#		The files and directories contained in the skeleton directory (which can be defined with the -k option)
	#		will be copied to the home directory
	#	- useradd will create the home directory unless CREATE_HOME in /etc/login.defs is set to no
	useradd_default_Params="-m"
	useradd_Command="useradd $useradd_default_Params"


	# --- Processing
	echo "==============="
	echo "i. Create User "
	echo "==============="

	# Loop through the $users associative array
	# And create
	#	i. Keys : Username
	#	ii. Values : Individual parameters 
	#		primary group, secondary group, home_dir
	for user in "${!users[@]}"; do
		# Get all parameters of current user
		curr_val="${users[$user]}"
		# Seperate retrieved parameter by delimiter
		curr_user_Params=($(seperate_by_Delim ";" "$curr_val"))
		# Retrieve individual Parameters
		u_primary_Group="${curr_user_Params[0]}"
		u_secondary_Groups="${curr_user_Params[1]}"
		u_home_Dir=${curr_user_Params[2]}

		#
		# Make user
		#
		if [[ ! "$u_primary_Group" == "" ]]; then
			# Primary Group
			# Not Empty
			useradd_Command+="-G $u_primary_Group"
		if [[ ! "$u_secondary_Groups" == "" ]]; then
			# Secondary Groups
			# Not Empty
			useradd_Command+="-g $u_secondary_Groups"
		fi
		if [[ ! "$u_home_Dir" == "" ]]; then
			# Home Directory
			# Not Empty
			useradd_Command+="-d $u_home_Dir"
		fi

		if [[ "$MODE" == "DEBUG" ]]; then
			echo "$useradd_Command" 
		else
			# Create User
			$useradd_Command
		fi

		#
		# Change Password
		#
		passwd $user
	done

	echo "===================="
	echo "ii. Set target user "
	echo "===================="

	# Check if a target user is selected
	if [[ "$TARGET_USER" == "" ]]; then
		# Empty
		while true; do
			read -p "Select a user to setup: " TARGET_USER
			if [[ ! "$TARGET_USER" == "" ]]; then
				# If not empty
				break 
			fi
		done
	fi

	# --- Output

}


# Setup Stages
# Execute in user
create_dotfiles()
{
	#
	# Create : Dotfiles
	# [Stages]
	#	1 : Folders
	#	2 : Dotfiles / Configs
	#

	echo "================="
	echo "i. Create Folders"
	echo "================="

	for d in ${folders_to_create[@]}; do 
		if [[ ! -d $d ]]; then
			# If directory does not exist
			su - $TARGET_USER -c create_directories $d
			su - $TARGET_USER -c echo "$(log_datetime) > Directory has been created : $d" | tee -a $logging_filepath/stage-2-i.log
		else
			su - $TARGET_USER -c echo "$(log_datetime) > Directory already exists : $d" | tee -a $logging_filepath/stage-2-i.log
		fi
	done

	echo "==================="
	echo "ii. Create Configs "
	echo "==================="

	for f in ${files_to_create[@]}; do
		if [[ ! -f $f ]]; then
			# If file does not exist
			su - $TARGET_USER -c touch $f
			su - $TARGET_USER -c echo "$(log_datetime) > File has been created : $f" | tee -a $logging_filepath/stage-2-ii.log
		else
			su - $TARGET_USER -c echo "$(log_datetime) > File already exists : $f" | tee -a $logging_filepath/stage-2-ii.log
		fi
	done
}

setup_dotfiles()
{
	#
	# Setup : Dotfiles
	# [Stages]
	#	1. Append relevant files when necessary
	#	2. Uncomment / comment any settings files 
	#

	echo "================="
	echo "i. Edit Dotfiles "
	echo "================="
	for file in ${!files_to_edit[@]}; do
		curr_val=${files_to_edit[$file]}
		if [[ ! -f $file ]]; then
			# If does not exist, create
			su - $TARGET_USER -c touch $file
			su - $TARGET_USER -c echo "$(log_datetime) > File has been created : $file" | tee -a $logging_filepath/stage-3-i.log
		fi
		# Append to file
		su - $TARGET_USER -c echo "$curr_val" | tee -a $file
		su - $TARGET_USER -c echo "$(log_datetime) > $curr_val append to file [ $file ]" | tee -a $logging_filepath/stage-3-i.log
	done

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

	echo "========================="
	echo "Stage 2: User Management "
	echo "========================="
	user_mgmt

	echo ""

	echo "================"
	echo "Stage 3: Create "
	echo "================"
	setup_dotfiles

	echo ""

	echo "==============="
	echo "Stage 4: Setup "
	echo "==============="
	setup_dotfiles


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

