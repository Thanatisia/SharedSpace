#
# GTK Control Utilities
# Author: Asura
# Created: 2021-06-13 2350H, Asura
# Modified: 
#	- 2021-06-13 2350H, Asura
#	- 2021-06-14 2159H, Asura
# Features: 
# Background Information: 
#	- A GTK utility library script that allows for easy manual setting of GTK
#		irregardless of GTK 2.0, GTK 3.0 or GTK 4.0
#

# --- Variables
PROGRAM_SCRIPTNAME="gtk_util"
PROGRAM_NAME="GTK Utilities Library"
PROGRAM_TYPE="Library"
MODE="DEBUG" # { DEBUG | RELEASE }

# --- Functions

# Helpful Functions

# General Functions

# [ GTK Themes ]
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

# [ GTK Icons ]
get_gtk_icon()
{
	#
	# Get current gtk icon set
	#

	# --- Input
	# Local Variables
	schema=org.gnome.desktop.interface
	key=icon-theme
	ret_gtk_icon=""

	# --- Processing
	ret_gtk_icon=$(gsettings get $schema $key)
	
	# --- Output
	echo $ret_gtk_icon	
}

set_gtk_icon()
{
	#
	# Set a new gtk icon set
	#

	# --- Input
	# Command Line Variables
	target_icon_set=$1

	# Local Variables
	schema=org.gnome.desktop.interface
	key=icon-theme

	# --- Processing
	ret_gtk_icon=$(gsettings set $schema $key $target_icon_set)
	
	# --- Output
	echo $ret_gtk_icon	
}

reload_gtk_icon()
{
	#
	# Get current gtk icon set
	#

	# --- Input
	# Local Variables
	schema=org.gnome.desktop.interface
	key=icon-theme
	ret_gtk_icon=""

	# --- Processing
	# Backup the current theme
	curr_theme=$(gsettings get $schema $key)
	# Empty the gtk theme
	gsettings set $schema $key ''
	sleep 1
	# Reset back to the original theme
	gsettings set $schema $key $curr_theme

	# --- Output
}

# [ General Keys ]
handle_gtk_key()
{
	#
	# Generic GTK controller
	# Get current gtk value based off user's input key
	#

	# Associative Arrays
	declare -A schemas=(
		[gtk-interface]="org.gnome.desktop.interface"
		[wm-preferences]="org.gnome.desktop.wm.preferences"
	)

	declare -A keys=(
		[gtk-theme]="gtk-theme"
		[gtk-icon-theme]="icon-theme"
		[wm-theme]="theme"
	)

	declare -A contents=(
		# Content Tree of Variables
		# - option
		# - key
		# - value

		[option]=""
		[key]=""
		[value]=""
	)

	# Local Variables
	ret_gtk_icon=""
	comm="gsettings"

	# Default Values
	def_opts="get"
	def_key="${schemas["gtk-interface"]}"
	
	# --- Input
	# Command Line Variables

	### Command Line Variable Data Sanitization
	
	#
	# ::Params
	#	$1 : 
	#		Variable Name: Options
	#		Type: String
	#	$2 : 
	#		Variable Name: Schema Key
	#		Type: String
	#	$3 : 
	#		Variable Name: Value
	#		Type: String
	#

	if [[ "$1" == "" ]]; then
		# If Param [1] is Empty
		contents["option"]=$def_opts
		contents["key"]=$def_key
		contents["value"]=""
		echo "Option, Key and Values are Empty"
	else
		# If Param [1] is NOT Empty
		contents["option"]=$1

		if [[ "$2" == "" ]]; then
			# If Param [2] is Empty
			contents["key"]=$def_key
			contents["value"]=""
			echo "Key and Values are Empty"
		else
			# If Param [2] is NOT empty
			contents["key"]=$2

			if [[ "$3" == "" ]]; then
				# If Param [3] is Empty
				contents["value"]=""

				# If option is 'set' but no values provided
				if [[ "${contents["option"]}" == "set" ]]; then
					echo "No Values set"
				fi
			else
				contents["value"]=$3
			fi
		fi
	fi

	### Post Sanitization
	option="${contents["option"]}"
	key="${contents["key"]}"
	val="${contents["value"]}"

	echo "Option Input: $option"
	echo "Key    Input: $key"
	echo "Value  Input: $val"

	# --- Processing
	# Option Handler
	case "$option" in
		"get")
			comm+=" get "
			;;
		"set" | "reload" )
			comm+=" set "
			;;
		"help")
			echo "============="
			echo "Help & Manual"
			echo "============="
			for c in "${!contents[@]}"; do
				echo "[$c] : ${contents[$c]}"
			done

			read -p "Press anything to finish..." finish
			exit 1
			;;
		*)
			echo "Error Detected: Incorrect command"
			echo "Defaulting to [get]"
			comm+=" $def_opts "
			;;
	esac

	# Target Key
	case "$key" in
		"gtk-theme")
			comm+="${schemas["gtk-interface"]} ${keys["gtk-theme"]}"
			;;
		"icon-theme")
			comm+="${schemas["gtk-interface"]} ${keys["gtk-icon-theme"]}"
			;;
		"window-theme")
			comm+="${schemas["wm-preferences"]} ${keys["wm-theme"]}"
			;;
		*)
			comm+="$def_key"
			;;
	esac

	# Set Value if option == set
	if [[ "$option" == "set" ]]; then
		# Set Value
		if [[ ! "$val" == "" ]]; then
			# Data Validation: NOT Null/Empty Value
			comm+=" $val"
		fi
	fi

	# --- Output
	if [[ "$MODE" == "DEBUG" ]]; then
		echo "Command: $comm"
	else
		$comm
	fi

	ret_code="$?"
	echo $ret_code
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

#
# Changelog:
#	- 2021-06-13 2350H, Asura
#		- Created script file
#	- 2021-06-14 2159H, Asura
#		- Added functions [ 'set_gtk_icon' , 'get_gtk_icon', 'reload_gtk_icon', 'handle_gtk_key' ]
#		- Converted Program Type from [Main] -> [Library]
#
