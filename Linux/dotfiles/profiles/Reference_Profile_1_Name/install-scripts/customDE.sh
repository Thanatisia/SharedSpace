#
# Window Manager to Desktop Environment Setup Script
#	- Turning Window Managers into your own Custom Desktop Environment
# Author: Asura
# Created: 2021-06-15 2342H, Asura
# Modified: 
#	- 2021-06-15 2342H, Asura
#	- 2021-07-02 1349H, Asura
#	- 2021-07-02 2325H, Asura
#	- 2021-07-03 1246H, Asura
#	- 2021-07-03 1543H, Asura
#	- 2021-07-03 1625H, Asura
#	- 2021-07-03 1646H, Asura
#	- 2021-07-04 0135H, Asura
#	- 2021-07-04 2306H, Asura
#	- 2021-07-04 2332H, Asura
#	- 2021-07-05 1044H, Asura
#	- 2021-07-05 1244H, Asura
#	- 2021-07-05 1349H, Asura
#	- 2021-07-05 2107H, Asura
#	- 2021-07-06 1049H, Asura
#	- 2021-07-06 1522H, Asura
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
#	- 2021-07-03 1543H, Asura
#		- Modified 'user' to 'user_profiles'
#	- 2021-07-03 1625H, Asura
#		- Changed 'MODE' to be the first command line argument with the default value set to 'DEBUG'
#	- 2021-07-03 1645H, Asura
#		- Added function 'enable_sudo' and 'comment/uncomment_lines'
#	- 2021-07-04 0135H, Asura
#		- Created 'get_users_Home()' and Debugging
#	- 2021-07-04 2306H, Asura
#		- Added MODE check for DEBUG support
#		- Added Seperation of HEAD, Body and Footer
#	- 2021-07-04 2332H, Asura
#		- Added a pause functionality after every section if mode is DEBUG
#	- 2021-07-05 1044H, Asura
#		- Decided to convert and make directory using static path instead
#	- 2021-07-05 1244H, Asura
#		- Rearranged and changd variable names
#		- Added a 'dotfile_Files' reference associative array
#	- 2021-07-05 1349H, Asura
#		- Added validation for TARGET_USER_HOME_DIR and TARGET_USER_PRIMARY_GROUP
#	- 2021-07-05 2107H, Asura
#		- Fixed AUR helper install
#	- 2021-07-06 0916H, Asura
#		- Added security checking for
#			i. User Validation: Ensure that at least 1 user exists at all time
#	- 2021-07-06 1049H, Asura
#		- Massive overhaul, changing all 'su' to 
#		- You must now have a user before using this for security purposes
#			- WIP: at least until i figure out how to use su to execute most of the commands here and commented
#	- 2021-07-06 1522H, Asura
#		- Fixed function 'check_user_Exists'
# Notes:
#	1. As of 2021-07-02 1348H
#		- Please run this only AFTER you have done a base installation as
#		- I have yet to integrate the base installation functions
#	2. As of 2021-07-06 1049H
#		- Please run this in the user you want to setup on
#			> if you dont have a user, system will ask for you to create a user
#			> after creating, the script will be copied to your specified user's home directory 
#				> Please relogin and execute using the new character
# TODO:
#	1. 2021-07-02 1352H
#		i. Convert sections [Folders], [Files] and all the loose variables into Associative Array for easy handling
#	2. 2021-07-06 1058H
#		i. Plan how to remove TARGET_USER, TARGET_USER_HOME_DIR, TARGET_USER_PRIMARY_GROUP
#			> Default to '$USER', '$HOME', '$(id -gn $USER)' respectively
# Security Design:
#	- User must have a user to setup on
#		- No using root for some insane reason that led me to making this policy change
# Project Design:
#	1. This script is ran after installation is competed.
#	2. Assume user has already created a user as per security design (be it during installation and/or post installation)
# Program Flow:
#

#
# Head
#
# --- References
declare -A dotfile_Files=(
	#
	# List of used files in root and their use cases
	#
	[.Xresources]="For X(Org) resource supported features such as colours etc."
	[.xinitrc]="X initialization Resource Control file; runs when 'startx' is ran."
	[.bash_profile]="Commands to run when bash is first initialized on startup."
)

# --- Variables

# [Program]
PROGRAM_SCRIPTNAME="customDE"
PROGRAM_NAME="Window Manager to Desktop Environment Custom Setup Script"
PROGRAM_TYPE="Main"
MODE="${1:-DEBUG}" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

# [General]

### EDIT THIS: 
###	TARGET_USER: this is the user you want to use; default: $USER
### TARGET_USER_HOME_DIR: this is the home directory of the user; default: $HOME
### TARGET_USER_PRIMARY_GROUP: This is the primary group of the user; default: $(id -gn $USER)
TARGET_USER="$USER"
TARGET_USER_HOME_DIR="$HOME"
TARGET_USER_PRIMARY_GROUP="$(id -gn $TARGET_USER)"

# [Arrays]
folders_to_create=(
	#
	# EDIT THIS
	# Please place all the folders you would like to create
	# - Please state the full path at the moment OR use a static environment variable
	#	- Relative Path is a WIP
	#	- Unable to figure out how to pass a dynamic environment variable like $HOME to su - $TARGET_USER
	# [Syntax]
	#	i. /home/profiles/$user_name/{folder_1,folder_2,...folder_n}
	#	ii. /path/to/folder/{folder_1,folder_2,...folder_n}

)

files_to_create=(
	#
	# EDIT THIS
	# Please place all the files you would like to create
	# - Please state the full path at the moment OR use a static environment variable
	#	- Relative Path is a WIP
	#	- Unable to figure out how to pass a dynamic environment variable like $HOME to su - $TARGET_USER
	# [Syntax]
	#	i. /home/profiles/$user_name/{folder_1,folder_2,...folder_n}
	#	ii. /path/to/folder/{folder_1,folder_2,...folder_n}

)

base_distros=(
	"ArchLinux"
	"Debian"
	"Gentoo"
	"Void Linux"
)

# [Associative Array]
declare -A sysinfo=(
	# 
	# EDIT THIS
	#
	# System Information here
	# - Place all your system information defining the build such as
	#	1. AUR Helper
	# - Please seperate all values with ';' delimiter if your parameter has multiple values
	# [Syntax]:
	#	[parameter]="value"
	# [Supported/Used Parameters]:
	#	1. for ArchLinux
	#		i. aur-helper : Your main AUR helper programs
	#	2. Others
	#		i. package-manager etc.
	[aur-helper]="yay-git"
)
declare -A reference_Distros=(
	[ArchLinux]="ArtixLinux;"
	[Debian]="Ubuntu"
)
declare -A install_commands=(
	[ArchLinux]="sudo pacman -S --noconfirm --needed"
	[Debian]="sudo apt install"
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
	[x]="xorg;xorg-server"
	[others]=""
)
declare -A git_aur_packages=(
	#
	# EDIT THIS
	#
	# Place all your AUR packages (aka git packages) here alongside the links
	# Syntax:
	#	[package-name]="https://domain.com/package.git"
	# Example:
	#	[yay]="https://aur.archlinux.org/yay-git.git"
	[yay-git]="https://aur.archlinux.org/yay-git.git"
)
declare -A pkg_install_methods=(
	#
	# EDIT THIS
	#
	# Place all your packages (value) and the method of installation (key) you want to be in the 
	# Desktop Environment here
	# according to category
	# - Please seperate each package with ';'
	# Syntax:
	#	[<install-method>]=""
	# Examples:
	#	[pacman]="package-1;package-2;package-n"
	#	[aur]="package-1;package-2;package-n"
	
	# Official
	[pacman]="pcmanfm;qtile;alacritty;nitrogen;picom;conky;bluez;lxappearance-gtk3;neofetch;xorg;xorg-server"
	# AUR
	[yay]="brave;sublime-text-dev"
)
declare -A files_to_edit=(
	#
	# EDIT THIS
	#
	# Place your files and the content you want to append into the files here
	# [Syntax]
	#	Single Line:
	#	[folder_path]="Contents"
	#	Multi Line:
	#	[folder_path]="line 1\
	# line 2 \
	# line 3"

)
declare -A user_profiles=(
	#
	# EDIT THIS
	#
	# Place all your users and their roles here
	# Parameter Seperator/Delimiter: ';'
	# Subparameter Seperator/Delimiter: ','
	#
	# Type 'NIL' if none to that parameter
	# [Syntax]
	# [username]="$primary_Group;$secondary_group_element_1,$secondary_group_element_n;$home_dir"
	# [username]="$primary_Group;$secondary_Group;$home_dir"
	[admin]="wheel;NIL;/home/profiles/admin"
)

# [Derivatives]
number_of_Packages="${#pkgs[@]}"

# [Essentials]
install_Command="${install_commands["$DISTRO"]}"

# --- Body

# Functions [1]
# [User Management]
get_users_Home()
{
	#
	# Get the home directory of a user
	#
	USER_NAME=$1
	HOME_DIR=""
	if [[ ! "$USER_NAME"  == "" ]]; then
		# Not Empty
		HOME_DIR=$(su - $USER_NAME -c "echo \$HOME")
	fi
	echo "$HOME_DIR"
}
check_user_Exists()
{
	#
	# Check if user exists
	#
	user_name="$1"
	exist_Token="0"
	delimiter=":"
	res_Existence="$(getent passwd $user_name)"

	if [[ ! "$res_Existence" == "" ]]; then
		# Something is found
		# Check if is the user
		res_is_User=$(echo "$res_Existence" | grep "^$user_name:" | cut -d ':' -f1)

		if [[ "$res_is_User" == "$user_name" ]]; then
			exist_Token="1"
		fi
	fi

	echo "$exist_Token"
}
useradd_get_default_Params()
{
    #
    # Useradd
    #   - Get Default Parameters
    #
    declare -A params=(
        [group]="$(useradd -D | grep GROUP | cut -d '=' -f2)"
        [home]="$(useradd -D | grep HOME | cut -d '=' -f2)"
        [inactive]="$(useradd -D | grep INACTIVE | cut -d '=' -f2)"
        [expire]="$(useradd -D | grep EXPIRE | cut -d '=' -f2)"
        [shell]="$(useradd -D | grep SHELL | cut -d '=' -f2)"
        [skeleton-path]="$(useradd -D | grep SKEL | cut -d '=' -f2)"
        [create-mail-spool]="$(useradd -D | grep CREATE_MAIL_SPOOL | cut -d '=' -f2)"
    )
    default_Params=()

    keywords=(
        "GROUP"
        "HOME"
        "INACTIVE"
        "EXPIRE"
        "SHELL"
        "SKEL"
        "CREATE_MAIL_SPOOL"
    )
    for k in "${keywords[@]}"; do
        # Put all keywords with the default values
        # default_Params[$k]="$(useradd -D | grep $k | cut -d '=' -f2)"
        default_Params+=("$(useradd -D | grep $k | cut -d '=' -f2)")
    done

    echo "${default_Params[@]}"
}
get_all_users()
{
	#
	# Check if user exists
	#
	exist_Token="0"
	delimiter=":"
	res_Existence="$(getent passwd)"
    all_users=($(cut -d ':' -f1 /etc/group | tr '\n' ' '))

	echo "${all_users[@]}"
}
get_user_primary_group()
{
    user_name="$1"
    primary_group="$(id -gn $user_name)"
    echo "$primary_group"
}

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
	str="$1"			# String to be seperated
	delim="${2:-';'}"	# Delimiter to split

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

comment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '$regex_Pattern/s/^/#/g' $filename
}
uncomment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '$regex_Pattern/s/^#//g' $filename
}
if_in_Arr()
{
	#
	# Check if element is in array
	#
	str="$1"
	arr=("$2")
	found="0"

	for e in "${arr[@]}"; do
		if [[ "$e" == "$str" ]]; then
			# Element is string
			found="1"
			break
		fi
	done

	echo "$found"
}

### Data Structures ###
arr_append()
{
    #
    # Append to Array
    #
    arr=("$1")
    str=${@:2}  # Start taking all arguments from index 2 onwards
    strlen="${#str[@]}"

    # Loop through all the strings and 
    # append into array one by one
    for ((i=0; i < $strlen; i++)); do
        arr+=("${str[$i]}")
    done
}

### Algorithms ###


# Functions [2]

# Pre-Requisite Stages
# Execute in Root
verify_network()
{
	#
	# Verify network is active
	#	0 : Success
	#	1 : Error
	#
	ping -c 5 8.8.8.8
	res=$?
	echo "$res"
}
enable_sudo()
{
	#
	# Uncomment '%wheel ALL=(ALL) ALL' in /etc/sudoers
	#	via
	#		1. visudo
	#		2. sed 
	#
	# [Regular Expression]
	#	\s : Any whitespaces
	#	\s* : Zero or more whispaces
	#	\s\+ : One or more whitespaces
	regex_Pattern="s/^#\s*\(%wheel\s\+ALL=(ALL)\s\+ALL\)/\1/"
	filename=/etc/sudoers
	# `uncomment_line $regex_Pattern $filename` 
	sed -i $regex_Pattern $filename
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
	useradd_Command="useradd $useradd_default_Params "

	# Associative Arrays (aka Dictionaries)
	declare -A useradd_Params=(
		[create-home-directory-if-not-exist]="-m"
		[primary-group]="-g"
		[secondary-group]="-G"
		[home-directory]="-d"
	)

	# --- Processing
	echo "==============="
	echo "i. Create User "
	echo "==============="

	# Loop through the $user_profiles associative array
	# And create
	#	i. Keys : Username
	#	ii. Values : Individual parameters 
	#		primary group, secondary group, home_dir
	for user in "${!user_profiles[@]}"; do
		# Get all parameters of current user
		curr_val="${user_profiles[$user]}"
		# Seperate retrieved parameter by delimiter
		curr_user_Params=($(seperate_by_Delim "$curr_val" ";"))
		# Retrieve individual Parameters
		u_primary_Group="${curr_user_Params[0]}"
		u_secondary_Groups="${curr_user_Params[1]}"
		u_home_Dir=${curr_user_Params[2]}

		#
		# Make user
		#
		if [[ ! "$u_primary_Group" == "NIL" ]]; then
			# Primary Group
			# Not Empty
			useradd_Command+=" -g $u_primary_Group "
		fi

		if [[ ! "$u_secondary_Groups" == "NIL" ]]; then
			# Secondary Groups
			# Not Empty
			useradd_Command+=" -G $u_secondary_Groups "
		fi
		
		if [[ ! "$u_home_Dir" == "NIL" ]]; then
			# Home Directory
			# Not Empty
			useradd_Command+=" -d $u_home_Dir "
		fi
		
		# Append Username to confirm user
		useradd_Command+="$user"

		if [[ "$MODE" == "DEBUG" ]]; then
			echo "$useradd_Command" 
		else
			# Create User
			$useradd_Command

			#
			# Change Password
			#
			if [[ "$?" == "0" ]]; then
				echo "==========================="
				echo " Password Change for $user "
				echo "==========================="
				passwd $user
			fi
		fi
	done

	# Check if a target user is selected
	if [[ "$TARGET_USER" == "" ]]; then
		# Emp
		while true; do
			read -p "Select a user to setup: " TARGET_USER
			if [[ ! "$TARGET_USER" == "" ]]; then
				# If not empty
				break 
			else
				# Security Design : Force user to create a user
				# A user must always exist for use
				while true; do
					useradd_Command="useradd"
					home_dir=""
				
					echo "======================================================"
					echo "For Security Reasons, please create a user to setup on"
					echo "======================================================"
					read -p "User Name: " user_name
					read -p "Primary Group: " primary_group
					read -p "Secondary Groups: " secondary_groups
					read -p "Set Custom Home Directory? [Y|N]: " custom_homedir_conf

					# Data Input Validation
					if [[ ! "$custom_homedir_conf" == "" ]]; then
						if [[ "$custom_homedir_conf" == "Y" ]]; then
							useradd_Command+=" -m "
							read -p "Home Directory [leave empty for default home directory]: " home_dir

							if [[ ! "$home_dir" == "" ]]; then
								# Specified home directory
								useradd+=" -d $home_dir "
							fi
						fi
					fi
					if [[ ! "$primary_group" == "" ]]; then
						# Primary Group is empty
						useradd+=" -g $primary_group "
					fi
					if [[ ! "$secondary_groups" == "" ]]; then
						# Secondary Group is empty
						useradd+=" -G $secondary_groups "
					fi

					if [[ ! "$user_name" == "" ]]; then
						useradd_Command+="$user_name"
					fi


					if [[ ! "$useradd_Command" == "useradd" ]]; then
						# If changes are found
						
						if [[ ! "$user_name" == "" ]]; then
							# Execute command
							$useradd_Command

							if [[ "$?" == "0" ]]; then
								# Success
								# Change Password for user
								passwd "$user_name"
							
								# Set target user to user
								TARGET_USER="$user_name"

								# Write this script into $user_name
								this_script="$0"
								if [[ "$primary_group" == "" ]]; then
									# If no primary group, default to its own name
									primary_group="$user_name"
								fi

								if [[ "$home_dir" == "" ]]; then
									home_dir="$(su - $user_name -c \"echo \$HOME\")"
								fi

								# Copy this script to home directory
								cp $this_script $home_dir/$this_script

								# Check if file is created 
								if [[ -f $home_dir/$this_script ]]; then
									# File is created

									# Change ownership to user
									chown -R $user_name:$primary_group $home_dir/$this_script

									echo "File has been created in the new user's home directory"
								fi

								# Restart Script
								echo "- Please ensure that the following are in your home directories"
								echo "	1. $0 | script"
								echo "- Please login to the new user [$user_name] and rerun the script, thank you!"
								read -p "Press anything to exit..." exit_conf
								exit
							fi
						fi
					fi
				done
			fi
		done
	fi

	# Check if a target user's home directory is stated
	if [[ "$TARGET_USER_HOME_DIR" == "" ]]; then
		# Empty
		while true; do
			read -p "Specify the selected user's home directory: " TARGET_USER_HOME_DIR
			if [[ ! "$TARGET_USER_HOME_DIR" == "" ]]; then
				# If not empty
				break 
			else
				# Default
				TARGET_USER_HOME_DIR="$(get_users_Home $TARGET_USER)"
			fi
		done
	fi

	# Check if a target user's primary group is stated
	if [[ "$TARGET_USER_PRIMARY_GROUP" == "" ]]; then
		# Empty
		while true; do
			read -p "Specify the selected user's primary group: " TARGET_USER_PRIMARY_GROUP
			if [[ ! "$TARGET_USER_PRIMARY_GROUP" == "" ]]; then
				# If not empty
				break 
			else
				# Default
				TARGET_USER_PRIMARY_GROUP="wheel"
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
	# Create : Dotfiles and Folders
	# [Stages]
	#	1 : Folders
	#	2 : Dotfiles / Configs
	#

	# --- Input


	# --- Processing

	echo "================="
	echo "i. Create Folders"
	echo "================="

	for d in ${folders_to_create[@]}; do 
		if [[ "$MODE" == "DEBUG" ]]; then
			echo "Folder: $d"
		else
			if [[ ! -d $d ]]; then
				# If directory does not exist
				# su - $TARGET_USER -c "mkdir -p $d"
				# su - $TARGET_USER -c "echo \"$(log_datetime) > Directory has been created : $d\" | tee -a \$HOME/.logs/stage-1-i.log"
				# chown -R $TARGET_USER:$TARGET_USER_PRIMARY_GROUP $TARGET_USER_HOME_DIR
				mkdir -p $d
				echo "$(log_datetime) > Directory has been created : $d" | tee -a ~/.logs/stage-1-i.log
				chown -R $TARGET_USER:$TARGET_USER_PRIMARY_GROUP $TARGET_USER_HOME_DIR
			else
				# su - $TARGET_USER -c "echo \"$(log_datetime) > Directory already exists : $d\" | tee -a \$HOME/.logs/stage-1-i.log"
				echo "$(log_datetime) > Directory already exists : $d" | tee -a ~/.logs/stage-1-i.log
			fi
		fi
	done

	echo "==================="
	echo "ii. Create Configs "
	echo "==================="

	for f in ${files_to_create[@]}; do
		if [[ "$MODE" == "DEBUG" ]]; then
			echo "File: $f"
		else
			if [[ ! -f $f ]]; then
				# If file does not exist
				# su - $TARGET_USER -c "touch $f"
				# su - $TARGET_USER -c "echo \"$(log_datetime) > File has been created : $f\" | tee -a \$HOME/.logs/stage-1-ii.log"
				touch $f
				echo "$(log_datetime) > File has been created : $f" | tee -a ~/.logs/stage-1-ii.log
			else
				echo "$(log_datetime) > File already exists : $f" | tee -a ~/.logs/stage-1-ii.log
			fi
		fi
	done
}
setup_AUR()
{
	#
	# Installs AUR of your choice
	#	1. yay
	#
	helper="${1:-yay}"
	user_name="${2:-$TARGET_USER}"

	# Check if git is installed
	if [[ "$(pacman -Qq | grep git)" == "" ]]; then
		# Git not installed
		$install_Command "git"
	fi

	# Check AUR Helper
	case "$helper" in
		"yay" | "yay-git")
			# Install if not
			# aur_pkg="yay-git"
			# dependencies=(
			# 	"go"
			# )
			# for dep in "${dependencies[@]}"; do
			# 	if [[ "$(pacman -Qq | grep $dep)" == "" ]]; then
			# 		pacman -S --noconfirm --needed $dep
			# 	fi
			# done
			# su - $user_name -c "git clone \"${git_aur_packages["$aur_pkg"]}\"" # Clone yay
			# su - $user_name -c "cd $aur_pkg && makepkg -si"
			helper_url="${git_aur_packages["$helper"]}"
			if [[ ! -d $helper ]]; then
				# Clone if doesnt exist
				git clone "$helper_url"
			fi
			cd $helper
			makepkg -si
			;;
	esac
}
pkg_install()
{
	#
	# Install relevant/required Packages
	#

	# Local Variables
	str="${pkgs[@]}"


	# Split value string into container
	arr=("$(seperate_by_Delim "$str" ";")")

	echo "Array: ${arr[@]}"

	# Confirm installation
	for p in "${!pkgs[@]}"; do
		echo "[$p] : [${pkgs[$p]}]"
	done
	read -p "Confirm installation of the above following packages? [Y|N]: " conf

	echo ""
	
	if [[ "$conf" == "Y" ]]; then
		echo "Installing..."
		echo ""
		for p in ${arr[@]}; do
			echo "Package: $p"
			if [[ ! "$p" == "" ]]; then
				# Do if NOT empty
				# else skip
				if [[ "$MODE" == "DEBUG" ]]; then
					# su - $TARGET_USER -c "echo $install_Command $p | tee -a \$HOME/.logs/installed-packages.log"
					echo -e "$install_Command $p"
				else
					# Check installation method
					packages_to_check=("$(seperate_by_Delim "${pkg_install_methods["pacman"]}" ";")")
					in_pacman="$(if_in_Arr $p ${packages_to_check[@]})"
					packages_to_check=("$(seperate_by_Delim "${pkg_install_methods["yay"]}" ";")")
					in_aur="$(if_in_Arr $p ${packages_to_check[@]})"
					if [[ "$in_pacman" == "1" ]]; then
						# Found
						$install_Command $p
						# Check if package is installed
						if [[ ! "$(pacman -Qq | grep $p)" == "" ]]; then
							# Found
							# su - $TARGET_USER -c "echo \"$(log_datetime) > Package Installed : $p\" | tee -a \$HOME/.logs/installed-packages.log"
							echo "$(log_datetime) > Package Installed : $p" | tee -a ~/.logs/installed-packages.log
						else
							# Not Found - Error installing
							# su - $TARGET_USER -c "echo \"$(log_datetime) > Package Install Failed : $p\" | tee -a \$HOME/.logs/installed-packages.log"
							echo "$(log_datetime) > Package Install Failed : $p" | tee -a ~/.logs/installed-packages.log
						fi
					elif [[ "$in_aur" == "1" ]]; then
						aur_helper="${sysinfo["aur-helper"]}"

						# Install AUR Helper
						setup_AUR "$aur_helper"

						# Install package
						if [[ "$aur_helper" == "yay-git" ]]; then
							# Git version checker
							aur_helper="yay"
						fi
						$aur_helper -S $p
					fi
				fi
				echo ""
			fi
		done
	fi
}
setup_dotfiles()
{
	#
	# Setup : Dotfiles
	# [Stages]
	#	1. Append relevant files when necessary
	#	2. Uncomment / comment any settings files 
	#

	# --- Input

	# Local Variables
	cmd_str=""

	# --- Processing

	echo "================="
	echo "i. Edit Dotfiles "
	echo "================="
	for file in ${!files_to_edit[@]}; do
		curr_val=${files_to_edit[$file]}
		if [[ "$MODE" == "DEBUG" ]]; then
			echo -e "Content: \n\"$curr_val\" >> File: $file"
		else
			if [[ ! -f $file ]]; then
				# If does not exist, create
				# su - $TARGET_USER -c "touch $file"
				# su - $TARGET_USER -c "echo \"$(log_datetime) > File has been created : $file\" | tee -a \$HOME/.logs/stage-3-i.log"
				touch $file
				echo "$(log_datetime) > File has been created : $file" | tee -a ~/.logs/stage-3-i.log
			fi
			# Append to file
			# su - $TARGET_USER -c "echo -e \"$curr_val\" | tee -a $file"
			# su - $TARGET_USER -c "echo \"$(log_datetime) > $curr_val append to file [ $file ]\" | tee -a \$HOME/.logs/stage-3-i.log"
			echo -e "$curr_val" | tee -a $file
			echo "$(log_datetime) > $curr_val append to file [ $file ]" | tee -a ~/.logs/stage-3-i.log
			echo ""
		fi
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

	if [[ "$MODE" == "DEBUG" ]]; then
		echo "=============="
		echo " DEBUG NOTES: "
		echo "=============="
		echo "i. I am assuming that the user has created a user as per security design and protocol."
	fi

	echo ""

	echo "========================"
	echo "Pre-Req 1: Network Setup"
	echo "========================"
	res=`verify_network`
	if [[ ! "$res" == 0 ]]; then
		# Error
		systemctl start NetworkManager
	fi

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=================================="
	echo "Pre-Req 2: Enable Sudo in sudoers "
	echo "=================================="
	enable_sudo

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "================================================"
	echo "Pre-Req 3:"
	echo " Security Protocol Design [1] : User Management "
	echo "================================================"
	user_mgmt

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "========================================="
	echo "Setup Stage 1: Create Dotfiles / Folders "
	echo "========================================="
	create_dotfiles

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "========================================="
	echo "Setup Stage 2: Install Relevant Packages "
	echo "========================================="
	pkg_install

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=============================="
	echo "Setup Stage 3: Setup Dotfiles "
	echo "=============================="
	setup_dotfiles

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

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
	# Run only if user is the correct user
	if [[ "$TARGET_USER" == "$USER" ]]; then
		main "$@"
	else
		# Check if user exists
		if [[ "$(check_user_Exists $TARGET_USER)" == "1" ]]; then
			# Exists
			echo "User is not the one specified, please login to the new user"
			# If user exists, get home directory
			TARGET_USER_HOME_DIR=$(su - $TARGET_USER -c "echo \$HOME")
			cp $0 $TARGET_USER_HOME_DIR/$PROGRAM_SCRIPTNAME
			chown -R $TARGET_USER:$TARGET_USER_PRIMARY_GROUP $TARGET_USER_HOME_DIR/$PROGRAM_SCRIPTNAME

			echo "> Script has been copied to the user's home directory"
			echo "> Please execute inside that folder"
			echo "Thank you!"
			exit
		else
			# Doesnt exist
			echo "This user does not exist"
			user_mgmt
		fi
	fi
    END
fi

