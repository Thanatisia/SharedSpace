#
# Profile Build Installer
# Author: Asura
# Created: 2021-06-15 0104H, Asura
# Modified: 
#	- 2021-06-15 0104H, Asura
#	- 2021-06-15 0154H, Asura
# Features: 
#	- Full minimal user input install script
# Background Information: 
#	A full minimal user-input, modular install script that allows user to
#	change just afew variables and be able to effectively customize their system according to what they need
#	with just afew changes
# Changelog:
#	- 2021-06-15 0104H, Asura
#		- Created script file
#	- 2021-06-15 0154H, Asura
#		- Added other features
#

# --- Variables

# [Program]
PROGRAM_SCRIPTNAME="installer"
PROGRAM_NAME="ArchLinux Profile Setup Installer"
PROGRAM_TYPE="Main"
MODE="DEBUG" # { DEBUG | RELEASE }

# [Associative Array]
declare -A device_Parameters=(
	[device_Type]=""
	[device_Name]=""
	[device_Size]=""
	[device_Boot]=""
)

declare -A partition_Parameters=(
	[part_ID]=1
	[part_Name]="Boot"
	[part_file_Type]="ext4"
	[part_start_Size]="1MiB"
	[part_end_Size]="1024MiB"
	[part_Bootable]=True
	[part_Others]=""
)

declare -A partition_Configuration=(
	# Compilation of all partitions
)

# --- Functions

# General Functions
debug_printAll()
{
	#
	# Debugger : Print all
	#
	cat="$1"

	case "$cat" in
		"device_Parameters")
			for k in "${!device_Parameters[@]}"; do
				echo "[$k] : ${device_Parameters[$k]}"
			done
			;;
		"partition_Parameters")
			for k in "${!partition_Parameters[@]}"; do
				echo "[$k] : ${partition_Parameters[$k]}"
			done
			;;
		"partition_Configuration")
			for k in "${!partition_Configuration[@]}"; do
				echo "[$k] : ${partition_Configuration[$k]}"
			done
			;;
		*)
			;;
	esac
}

# Installation stages
get_device_Information()
{
	#
	# Get Device Information
	#	- Device Type
	#	- Device Name
	#	- Device Size
	#	- Device Boot Type (MBR Master Boot Record / UEFI)
	#

	# Loop the key of the associative array
	# and get user input to that parameter
	for dp in "${!device_Parameters[@]}"; do
		case "$dp" in
			"device_Name")
				read -p "$dp [i.e. /dev/sdX]: " tmp_input	
				;;
			*)
				read -p "$dp: " tmp_input
				;;
		esac
		device_Parameters[$dp]=$tmp_input
	done
}

get_partition_Information_uInput()
{
	#
	# Get Partition Information
	#	- Partition (Row) ID
	#	- Partition Name
	#	- Partition File Type
	#	- Partition Start Size
	#	- Partition End Size
	#	- Partition Bootable
	#	- Partition Other Properties
	#

	# --- Input

	# Local Variables
	add_conf="Y"
	count=0

	# Associative Array
	options=(
		"add"
		"remove"
		"modify"
		"view"
		"exit"
	)

	echo "====================="
	echo "  Partition Manager  "
	echo "====================="

	# --- Processing
	while true; do
		# Get user input
		for opt in "${!options[@]}"; do
			echo "[$opt] : ${options[$opt]}"
		done

		PS3="Select your option [Number]> "
		read -p "$PS3" option

		selection="${options[$option]}"
		case "$selection" in
			"add")
				# Loop the key of the associative array
				#	and get user input to that parameter
				for k in "${!partition_Parameters[@]}"; do
					read -p "$k: " tmp_input
					partition_Parameters[$k]="$tmp_input"
				done

				count=${partition_Parameters["part_ID"]}
				partition_Configuration[$count]="${partition_Parameters[@]}"

				echo "======"
				echo " Added"
				echo "======"
				for p in "${!partition_Configuration[@]}"; do
					# echo "[$p] : [${!partition_Configuration[$p]}]"
					echo "[$p]"
				done
				;;
			"remove")
				read -p "Remove partition number?: " part_no
				unset "${partition_Configuration[$part_no]}"
				;;
			"view")
				# View all Partitions
				for part_k in "${!partition_Configuration[@]}"; do
					echo "[$part_k] : [${!partition_Configuration[$part_k]}]"
				done
				;;
			"modify")
				;;
			"exit")
				break
				;;
			*)
				;;
		esac

		echo ""
	done

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

installer()
{
	#
	# Main setup installer
	#

	#echo "Stage 1: Get User Input - Device Information"
	#get_device_Information

	#echo ""

	echo "Stage 2: Get User Input - Partition Information"
	get_partition_Information_uInput

	debug_printAll "$device_Parameters"
	debug_printAll "$partition_Parameters"
	debug_printAll "$partition_Configuration"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"

	installer
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

