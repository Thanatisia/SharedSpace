#
# Post Installation setup
# Author: Asura
# Created by: 2021-05-25 0821H, Asura
# Modified by: 
#	2021-05-25 0821H, Asura
#	2021-05-30 1217H, Asura
#	2021-06-06 1230H, Asura
# Background Info:
#	A simple post installation script much like [postinstallations.sh] but it contains commands of what I consider are essential folders to create or commands to execute after 
#	any post installations
#	- You can modify this script to adjust it to what you consider are essential custom paths, files or folders
#	- Use this alongside [setup.sh] and [postinstallations.sh] to install/create a complete fundamental Out-of-the-Box (OOTB) linux experience with the basic requirements such as
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
#	- Customizable/Adjustable commands, links and changes that are what i would consider essentials such as
#		1. making a 'personal folder' on HOME directory for storing all dotfiles for portable use
#

#
# Input
#

## Default Variables

## Arrays
custom_Dir=(
	~/portable/dotfiles/BashRC/aliases
)

## Declare Associative Array variable
declare -A custom_Files=(
	[bashrc-personal]=~/portable/dotfiles/BashRC/.bashrc-personal
)

# Local Variables
bashrc_Personal="${custom_Files["bashrc-personal"]}"


# --- Processing

# 
# Setup
#

#================= 1. Defaults ===================#
### S1. Create default directories ###
for d in "${custom_Dir[@]}"; do
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

### S2. Create default files ###
for f in "${custom_Files[@]}"; do
	if [[ ! -f $f ]]; then
		# If file does not exist, create
		touch "$f"
	fi
done

#
# Main
#

#================= 2. BashRC ===================#

### 1. Link .bashrc with .bashrc-personal ###
echo """
# Link .bashrc with .bashrc-personal #
if [[ -f "$bashrc_Personal" ]]; then
	# File exists
	. "$bashrc_Personal"
fi
""" | tee -a ~/.bashrc

### 2. Edit .bashrc-personal ###
echo """#
# Bash Resource Control (BashRC) [Personal]
#
""" | tee -a $bashrc_Personal


# --- Output

#================= Finishing Touches ================#

# Reload Terminal
source ~/.bashrc

### Finish ###
complete_uInput=""
read -p "Setup is complete, please run setup.sh and/or postinstallations.sh for a complete OOTB experience if you have time and have not done so :)" complete_uInput

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
