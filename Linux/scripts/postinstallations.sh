#
# Post Installation setup
# Author: Asura
# Created by: 2021-05-23 1900H, Asura
# Modified by: 
#	2021-05-23 1900H, Asura
#	2021-05-23 1942H, Asura
#	2021-05-23 2004H, Asura
#	2021-05-24 0233H, Asura
#	2021-05-25 0834H, Asura
# Background Info:
#	A simple post installation script that will run basic essential TODO stuff after a complete/minimal installation
#	such as installing window managers/desktop environment, terminals, file browsers etc.
#	- These are the "must do" after any basic/minimal installations to any distro, not just ArchLinux
#	- Use this alongside [setup.sh] to install/create a complete fundamental Out-of-the-Box (OOTB) linux experience with the basic requirements such as
#		[postinstallations.sh]
#		1. Window Managers/Desktop Environment
#		2. File Browser
#		3. Terminals
#		[setup.sh]
#		4. Proper home file directory structure (Home, Desktop, Documents, Media etc.)
#		5. A default OOTB universal preset that is easily understandable
#	- Use this alongside [customs.sh] to get dotfiles that will expand the linux OOTB experience and are considered essentials
#		1. Essential custom dotfiles, commands, files that can be adjusted to fit your needs
#			such as:
#				a bashrc-personal file in ~/.portable/dotfiles/BashRC/aliases folder (Path adjustable in customs.sh)
# Features:
#	- Installation fundamental linux packages, ricing packages and other useful utilities that are essential to any linux users and
#	- raw/new installations
#

# --- Input
# Command Line Arguments
argv=("$1")
argc="${#argv[@]}"

# Local Variables

## Default Variables
base_Distro="${argv[0]:-ArchLinux}"
pkgmgr="${argv[1]:-pacman}"
dirs=(
	~/.logs
)
## Declare Associative Array variable
declare -A pkgs=(
	# NOTE: 
	# Please feel free to change the values for whichever you deem important
	# Just append to the value corresponding to the key with a space delimiter
	# i.e.
	# (OLD) : [terminal]="urxvt"
	# (NEW) : [terminal]="urxvt alacritty"
	[editor-1]="nano"		# Text Editors
	[editor-2]="vim"
	[terminal]="rxvt-unicode"	# Terminal Emulator
	[browser]="firefox"		# Browser
	[file_manager]="pcmanfm"	# File Manager
	[wm]="bspwm"			# Window Manager
	[audio]="alsa"			# Audio Driver
	[others]="sxhkd"		# Other packages : Can be removed if NIL; not mandatory for a less-bloat starting build; put 'sxhkd' if you are using bspwm because you need bspwm and sxhkd for BSPWM
)
declare -A log_Files=(
	[changelog]=~/.logs/postinstaller.log
	[status]=~/.logs/postinstaller-status.log
)

# --- Processing

# 
# Setup
#

### S1. Make directory if does not exist
for d in "${dirs[@]}"; do
	if [[ ! -d "$d" ]]; then
		# if logs does not exists
		mkdir -p "$d"
	fi
done

#
# Main
#

### M1. Switch Case : Base Distribution ###
case "$base_Distro" in 
	"ArchLinux")
		pkgmgr="pacman"	
		;;
	"Debian")
		pkgmgr="apt"
		;;
	*)
		;;
esac


### M2. Install packages ###

## Package Details ## 
# Package categories
keys=("${!pkgs[@]}")
number_of_Keys="${#keys[@]}"

# Package names
val=("${pkgs[@]}")
number_of_Values="${#val[@]}"

## Processes ##
# Loop and Install packages
for(( i=0; i < $number_of_Values; i++ )); do
	curr_Key="${keys[$i]}"
	curr_Pkg="${val[$i]}"

	# Check if package exists in repository
	exists="$(pacman -Ss ^$curr_Pkg$)"
	if [[ ! "$exists" == "" ]]; then
		# Install
		sudo pacman -S $curr_Pkg | tee -a ${log_Files["changelog"]}
		res="$?"
	
		# Validation
		if [[ "$res" == "0" ]]; then
			res="Success"
		else
			res="Failed"
		fi
	fi
	echo "Installing [ $curr_Key --> $curr_Pkg ] : $res" | tee -a ${log_Files["status"]}
done

# --- Output

#================= Finishing Touches ================#


### Finish ###
complete_uInput=""
read -p "Setup is complete, please run setup.sh for a complete OOTB experience if you have time :)" complete_uInput
