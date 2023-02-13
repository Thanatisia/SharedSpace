#
# Wrapper for Scrot
# Author: Asura 
# Created: 2021-05-13 2308H, Asura
# Modified: 
#	2021-05-13 2308H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-13 2308H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="NIL"

# --- Functions

# General Functions
get_screenshot_Name()
{
	#
	# Get screenshot name
	#
	res="$(echo -e "default\n$PWD/screenshot_%Y-%m-%d_%H-%M-%S" | dmenu -p "File path/name (Press 'Escape' to use default): " -c -l 10)"
	echo "$res"
}

take_Screenshot()
{
	res="$1"
	if [[ "$res" == "default" ]] || [[ "$res" == "" ]]; then
		scrot '%Y-%m-%d_$wx$h_scrot.png'
	else
		scrot "$res"
	fi
}

# Body Functions
function main()
{
	name="$(get_screenshot_Name)"
	sleep 0.4;
	take_Screenshot "$name"
}

function START()
{
    echo "Program Name: $PROGRAM_NAME"
}

function END()
{
    line=""
    read -p "Pause" line
}


if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

