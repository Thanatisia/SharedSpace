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
#	2021-05-29 2209H, Asura
#	2021-05-30 0958H, Asura
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
	# Just add a new key and append '-n' and add the value for easy understanding
	# i.e.
	# (OLD) : [editor]="nano"
	# (NEW) : 	[editor-1]="nano"
	#			[editor-2]="vim"
	[audio]="alsa"			    # Audio Driver
	[terminal]="rxvt-unicode"	# Terminal Emulator
	[browser]="firefox"		    # Browser
	[editor-1]="nano"		    # Text Editors
	[editor-2]="vim"
	[file_manager]="pcmanfm"	# File Manager
	[compositor]="picom"	    # Compositor
	[fonts-1]="Jetbrains Mono"  # Fonts
	[fonts-2]="Hack"
	[clipboard-manager]="xclip" # Clipboard Manager
	[screenlocker]=""           # Screenlocker
	[wm]="bspwm"			    # Window Manager
	[others-1]="sxhkd"		    # Other packages : Can be removed if NIL; not mandatory for a less-bloat starting build; put 'sxhkd' if you are using bspwm because you need bspwm and sxhkd for BSPWM
	[others-2]="xautolock"
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

	echo ""

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

### M3. Setup Window Managers ###
case "${pkgs["wm"]}" in
	"i3")
		echo "i3"
		;;
	"qtile")
		echo "Qtile"
		;;
	"bspwm")
		echo "BSPWM"
		;;
	"herbstluftwm")
		echo "herbstlufwm"
		;;
	"")
		echo "No Window Manager stated/installed"
		;;
	*)
		echo "Invalid Window Manager"
		;;
esac



# --- Output


#================= Finishing Touches ================#


### Finish ###
complete_uInput=""
read -p "Setup is complete, please run setup.sh for a complete OOTB experience if you have time :)" complete_uInput
