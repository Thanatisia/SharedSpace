#
# Basic Setup after a complete / minimal installation
# Author: Asura
# Created by: 2021-05-23 1934H, Asura
# Modified by: 
#	2021-05-23 1934H, Asura
#	2021-05-23 1942H, Asura
#	2021-05-23 2004H, Asura
#	2021-05-25 0831H, Asura
#	2021-05-30 1000H, Asura
#	2021-05-30 1218H, Asura
#	2021-05-30 1228H, Asura
#	2021-06-06 1230H, Asura
# Background Info:
#	A basic setup script that will setup the basic requirements after a complete/minimal installation such as making default directories, 
#	installing basic packages if they were not installed during setup
#	- Use this alongside [postinstallations.sh] to install/create a complete fundamental linux experience Out-of-the-Box (OOTB) with the basic requirements such as
#		[postinstallations-root.sh]
#		1. Creating user etc.
#		[postinstallations.sh]
#		1. Window Managers/Desktop Environment
#		2. File Browser
#		3. Terminals
#		[setup.sh]
#		1. Proper home file directory structure (Home, Desktop, Documents, Media etc.)
#		2. A default OOTB universal preset that is easily understandable
#	- Use this alongside [customs.sh] to get dotfiles that will expand the linux OOTB experience and are considered essentials
#		1. Essential custom dotfiles, commands, files that can be adjusted to fit your needs
#			such as:
#				a bashrc-personal file in ~/.portable/dotfiles/BashRC/aliases folder (Path adjustable in customs.sh)
# Features:
#	- Creating default directories
#	- Creating default files
#	- Linking ~/.bashrc with .bashrc-personal
#	- Networking
#	- Audio
#	- User Account
#

#
# Input
#

## Arrays
default_Dir=(
	# Single Directory
	~/.logs
	~/.scripts
	~/Documents
	~/Desktop
	# Multidirectory
	~/Media/pictures/jpg
	~/Media/pictures/png
	~/Media/pictures/gif
	~/Media/screenshots
	~/Media/music
	~/Media/videos
)
## Associative Arrays

## Local Variables


#
# Processing
#

#================= 1. Defaults ===================#
### 1. Create default directories ###
for d in "${default_Dir[@]}"; do
	curr_Dir="$d"
	if [[ ! -d "$curr_Dir" ]]; then
		# If does not exist
		mkdir -p "$curr_Dir" | tee -a ~/.logs/setup-changelog.log
		res="$?"

		# Validation
		if [[ -d "$curr_Dir" ]]; then
			# Exists
			res="Success"
		else
			# Does not exist
			res="Failed"
		fi
		echo "[$curr_Dir] : $res" | tee -a ~/.logs/setup-status.log
	fi
done

#================= 2. Setups ===================#
audio_Management()
{
	### 2. Audio ###
	audio_pkg=(
		"alsa"
		"alsa-utils"
	)
	number_of_Pkgs="${#audio_pkg[@]}"
	for pkg in ${audio_pkg[@]}; do
		echo "Current Package: $pkg"
		# DEBUG: echo "Package Check: $pkg_check"
		
		sudo pacman -S "$pkg"
		
		# Verify installation
		pkg_check="$(pacman -Qq | grep $pkg)"
		if [[ ! "$pkg_check" == "" ]]; then
			install_Token="Success"
		else
			install_Token="Error"
		fi
		echo "Installed: [$pkg] : $install_Token"

		echo ""
	done
}

swap_Management()
{
	### 3. Swapfile ###
	swap_Size=""
	read -p "Swap Size [n {MiB | MB | GiB | GB}]: " swap_Size
	# i. Create swap file
	fallocate -l $swap_Size /swapfile
	# ii. Change permission of swpafile to read-write
	chmod 600 /swapfile
	# iii. Make swap file
	mkswap /swapfile
	# iv. Enable swap file to begin using it
	swapon /swapfile
	# v. The Operating system need to know it is safe to use this file for swap everytime it boots up
	echo "# /swapfile" | tee -a /etc/fstab
	echo "/swapfile none swap defaults 0 0" | tee -a /etc/fstab
}
# Process
audio_Management
swap_Management

#
# Output
#

#================= Finishing Touches ================#

# Finish
complete_uInput=""
read -p "Setup is complete, please run postinstallations.sh for a complete OOTB experience if you have time :)" complete_uInput

confirm_Delete=""
read -p "Would you like to delete this file?: " confirm_Delete
case "$confirm_Delete" in
	"Y" | "y" )
		# Delete itself
		sudo rm $0
		;;
	*)
		# Do nothing, just end
		;;
esac
