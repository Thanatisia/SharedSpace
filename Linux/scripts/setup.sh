#
# Basic Setup after a complete / minimal installation
# Author: Asura
# Created by: 2021-05-23 1934H, Asura
# Modified by: 
#	2021-05-23 1934H, Asura
#	2021-05-23 1942H, Asura
#	2021-05-23 2004H, Asura
#	2021-05-25 0831H, Asura
# Background Info:
#	A basic setup script that will setup the basic requirements after a complete/minimal installation such as making default directories, 
#	installing basic packages if they were not installed during setup
#	- Use this alongside [postinstallations.sh] to install/create a complete fundamental linux experience Out-of-the-Box (OOTB) with the basic requirements such as
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


#
# Output
#

#================= Finishing Touches ================#

# Finish
complete_uInput=""
read -p "Setup is complete, please run postinstallations.sh for a complete OOTB experience if you have time :)" complete_uInput

