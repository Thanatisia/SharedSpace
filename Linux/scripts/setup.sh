#
# Basic Setup after a complete / minimal installation
# Author: Asura
# Created by: 2021-05-23 1934H, Asura
# Modified by: 
#	2021-05-23 1934H, Asura
#	2021-05-23 1942H, Asura
#	2021-05-23 2004H, Asura
# Background Info:
#	A basic setup script that will setup the basic requirements after a complete/minimal installation such as making default directories, 
#	installing basic packages if they were not installed during setup
#	- Use this alongside [postinstallations.sh] to install/create a complete fundamental linux experience Out-of-the-Box (OOTB) with the basic requirements such as
#		[postinstallations.sh]
#		1. Window Managers/Desktop Environment
#		2. File Browser
#		3. Terminals
#		[setup.sh]
#		4. Proper home file directory structure (Home, Desktop, Documents, Media etc.)
#		5. A default OOTB universal preset that is easily understandable
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
	~/portable/dotfiles/BashRC/aliases
)
## Associative Arrays
declare -A default_Files=(
	[bashrc-personal]=~/portable/dotfiles/BashRC/.bashrc-personal
)

## Local Variables
bashrc_Personal="${default_Files["bashrc-personal"]}"

#
# Processing
#

#================= 1. Defaults ===================#
### 1. Create default directories ###
for d in "${default_Dir[@]}"; do
	curr_Dir="$d"
	if [[ ! -d "$curr_Dir" ]]; then
		# If does not exist
		mkdir -p "$curr_Dir" && tee -a ~/.logs/setup-changelog.log
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

### 2. Create default files ###
for f in "${default_Files[@]}"; do
	if [[ ! -f $f ]]; then
		# If file does not exist, create
		touch "$f"
	fi
done


#================= 2. BashRC ===================#

### 3. Link .bashrc with .bashrc-personal ###
echo """
# Link .bashrc with .bashrc-personal #
if [[ -f "$bashrc_Personal" ]]; then
	# File exists
	. "$bashrc_Personal"
fi
""" | tee -a ~/.bashrc

### 4. Edit .bashrc-personal ###
echo """
#
# Bash Resource Control (BashRC) [Personal]
#
""" | tee -a $bashrc_Personal



#
# Output
#

#================= Finishing Touches ================#

# Reload Terminal
source ~/.bashrc

# Finish
complete_uInput=""
read -p "Setup is complete, please run postinstallations.sh for a complete OOTB experience if you have time :)" complete_uInput

