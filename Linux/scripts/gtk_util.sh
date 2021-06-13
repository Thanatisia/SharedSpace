#
# GTK Control Utilities
# Author: Asura
# Created: 2021-06-13 2350H, Asura
# Modified: 
#	- 2021-06-13 2350H, Asura
# Features: 
# Background Information: 
#	- A GTK utility library script that allows for easy manual setting of GTK
#		irregardless of GTK 2.0, GTK 3.0 or GTK 4.0
# Changelog:
#	- 2021-06-13 2350H, Asura
#		- Created script file
#

# --- Variables
PROGRAM_SCRIPTNAME="gtk_util"
PROGRAM_NAME="GTK Utilities"
PROGRAM_TYPE="Main"

# --- Functions

# General Functions
get_gtk_theme()
{
	#
	# Get the current gtk theme
	#

	# --- Input

	# Command Line Variables

	# Local Variables
	schema=org.gnome.desktop.interface 
	key=gtk-theme

	# --- Processing
	curr_theme=$(gsettings get $schema $key)

	# --- Output
	echo $curr_theme
}

set_gtk_theme()
{
	#
	# Set a new GTK theme
	#

	# --- Input

	# Command Line Variables
	new_theme=$1

	# Local Variables
	schema=org.gnome.desktop.interface 
	key=gtk-theme

	# --- Processing
	gsettings set $schema $key $new_theme

	# --- Output
	echo $(gsettings get $schema $key)
}

reload_gtk_theme()
{
	#
	# Reload the GTK theme
	#

	# --- Input
	# Local Variables
	schema=org.gnome.desktop.interface 
	key=gtk-theme

	# --- Processing
	# Backup the current theme
	curr_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
	# Empty the gtk theme
	gsettings set org.gnome.desktop.interface gtk-theme ''
	sleep 1
	# Reset back to the original theme
	gsettings set org.gnome.desktop.interface gtk-theme $curr_theme

	# --- Output
}

# Main functions
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
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

