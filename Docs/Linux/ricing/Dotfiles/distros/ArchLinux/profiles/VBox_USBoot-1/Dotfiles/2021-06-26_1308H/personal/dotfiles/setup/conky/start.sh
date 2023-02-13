#
# Setup conky config folder
# Author: Asura
# Created: 2021-05-11 1356H
# Modified: 
#	2021-05-11 1356H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-11 1356H, Asura:
#		- Created script file
#

# --- Variables
PROGRAM_NAME="Setup Config: Conky"

create_dir()
{
	#
	# Create directories
	#

	# --- Input

	# Variables
	target_Dir=(
		~/.config/conky
	)
	ret_code="0"

	# --- Processing
	for d in "${target_Dir[@]}"; do
		mkdir -p $d ||\
			echo "Error creating directory [$d]"\
			ret_code="1"
	done

	# --- Output
	echo "$ret_code"
}

create_config()
{
	#
	# Create config file
	#

	# --- Input
	# Local Variables
	template="
	"
	config_Path=~/.config/conky
	config_Name=conky.conf
	config_File=$config_Path/$config_Name
	prog_default_config="conky --print-config"
	ret_code="0"

	# --- Processing
	# Get default config
	template="$($prog_default_config)"

	# Output to config path
	if [[ ! -f $config_File ]]; then
		# File does not exist
		# echo "$template" | tee -a $config_File
		echo "$template" >> $config_File
	else
		# File exists
		ret_code="1"
		ret_str="
Config file already exists, please delete the existing one before retrying.
	Config Path: $config_Path
	Config Name: $config_Name
		"
	fi
	# --- Output
	echo "$ret_code"
}

function main()
{
	# --- Create config directory
	ret_code="$(create_dir)"
	echo "Return Code: $ret_code"

	case "$ret_code" in
		"0")
			echo "Directories successfully created."
			;;
		*)
			echo "Error creating Directories / Directories already exist."
			;;
	esac

	# --- Create config file
	ret_code="$(create_config)"
	echo "Return Code: $ret_code"

	case "$ret_code" in
		"0")
			echo "Config successfully created."
			;;
		*)
			echo "Error creating Config / Config already exist."
			;;
	esac

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

