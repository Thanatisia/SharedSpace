#
# Setup Samba
# Author: 
# Created: 
# Modified: 
# Features: 
# Background Information: 
# Changelog:
#

# --- Variables
PROGRAM_NAME="NIL"
PROGRAM_TYPE="Main | Library"

# --- Functions

# General Functions
function func_Name()
{
	# --- Input
	# Command Line Variables
    if [[ "$1" == "" ]]; then
		# Pipe Input
		read -p "Input: " uInput
	else
		uInput="$1"
	fi
	
	# Local Variables

	# --- Processing
    proc=$uInput
    sysOut=$proc

	# --- Outut
    echo "$sysOut"
}

# Main functions
initial_check()
{
	#
	# Check First time use
	# ---
	# Check if
	#	> config files or relevant files exist
	# ---
	#

	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code=True

	# --- Processing
	# echo "First Time Check"
	
	# --- Output
	echo "$ret_code"
}

initial_setup()
{
	#
	# Setup procedure if 
	#	first time use
	#
	
	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code="0"

	# --- Processing
	# echo "Initial Setup"
	# Temporary
	ret_code="1"

	# --- Output
	echo "$ret_code"
}

add_env()
{
	#
	# Add Environment Variables
	#

	# --- Input
	# Command Line Variables
	# Local Variables
	ret_code="0"

	# --- Processing
	echo "Add Environment Variables"

	# --- Output
	echo "ret_code"
}

init()
{
	#
	# On Runtime initialization
	#
	echo "Program Name: $PROGRAM_NAME"
}

startup()
{
	#
	# Run on startup
	#

	# --- Input

	# Command Line Variables
	# Local Variables
	ret_code="1"

	# --- Processing
	# Check First Run
	chk_first_Run="$(initial_check)"
	
	# Validate First Run
	if [[ "$chk_first_Run" == "True" ]]; then
		init="$(initial_setup)"
		if [[ ! "$init" == "1" ]]; then
			ret_code="0"
		fi
	fi

	# --- Output
	echo "$ret_code"
}

function START()
{
	# --- Input
	ret_code="0"
	
	# --- Processing 
	ret_code="$(startup)"

	# --- Output
	echo "$ret_code"
}

body()
{
	#
	# Main function to run
	#
	
	# --- Input
	# Command Line Arguments
	argv=("$@")
	argc="${#argv[@]}"

	## Local Variables

	# General
	token="Failed"
	init_System="Systemd"

	# Script
	script_Path=~/personal/dotfiles/setup/samba
	progress_list_fileName=setup-checklist.log
	progress_List=$script_Path/$progress_list_fileName

	# Samba
	samba_config_filePath=/etc/samba
	samba_config_fileName=smb.conf
	samba_config_file=$samba_config_filePath/$samba_config_fileName
	samba_default_Config="https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD"
	samba_Service=smb

	# UFW
	ufw_config_filePath=/etc/ufw
	ufw_applications_filePath=$ufw_config_filePath/applications.d
	ufw_applications_samba_fileName=samba
	ufw_applications_samba_File=$ufw_applications_filePath/$ufw_applications_samba_fileName

	# --- Processing
	echo "### 1. Check Samba config file ###"
	if [[ ! -f $samba_config_file ]]; then
		# If file not available
		# Download default samba file
		echo "File does not exist, downloading default config file..."
		curl -o $samba_config_file "$samba_default_Config"

		# Verify file exists
		if [[ -f $samba_config_file ]]; then
			token="Success"
		fi
	fi
	echo "1. Samba config file : $token" | tee -a $progress_List
	
	echo "### 2. Check if Package [samba] is installed ###"
	chk="$(pacman -Qq | grep samba)"
	if [[ "$chk" == "" ]]; then
		# Not Installed
		sudo pacman -S samba |& tee -a $script_Path/samba-install.log

		# Verify installation
		chk="$(pacman -Qq | grep samba)"
		if [[ ! "$chk" == "" ]]; then
			# Installed
			token="Success"
		fi
	fi
	echo "2. Package [samba] is installed : $token" | tee -a $progress_List

	echo "### 3. IF Samba is Installed : Start samba service" 
	case "$init_System" in
		# Default: Systemd
		"Systemd")
			sudo systemctl start $samba_Service
			res="$?"
			
			# Validation
			if [[ "$res" == "0" ]]; then
				# Success
				token="Success"
			fi
			;;
		*)
			;;
	esac
	echo "3. Service [$samba_Service] started : $token" | tee -a $progress_List
		
	echo "### 4. Check if Package [ufw] is installed ###"
	chk="$(pacman -Qq | grep ufw)"
	if [[ "$chk" == "" ]]; then
		# Not Installed
		sudo pacman -S ufw |& tee -a $script_Path/ufw-install.log

		# Verify installation
		chk="$(pacman -Qq | grep ufw)"
		if [[ ! "$chk" == "" ]]; then
			# Installed
			token="Success"
		fi
	fi
	echo "4. Package [ufw] is installed : $token" | tee -a $progress_List

	echo "### 5. Allow Samba in UFW ###"
	sudo ufw allow CIFS
	res="$?"
	if [[ "$res" == "0" ]]; then
		token="Success"
	fi
	echo "5. Samba allowed in UFW : $token" | tee -a $progress_List	

	echo "### 6. Create Samba profile in UFW directory ###"
	if [[ ! -f $ufw_applications_samba_File ]]; then
		# File does not exist
		echo "[Samba]" | sudo tee -a $ufw_applications_samba_File
		echo "title=LanManager-like file and printer server for Unix" | sudo tee -a $ufw_applications_samba_File
		echo "description=The Samba software suite is a collection of programs that implements the SMB/CIFS protocol for unix systems, allowing you to serve files and printers to Windows, NT, OS/2 and DOS clients. This protocol is sometimes also referred to as the LanManager or NetBIOS protocol." | sudo tee -a $ufw_applications_samba_File
		echo "ports=137,138/udp|139,445/tcp" | sudo tee -a $ufw_applications_samba_File
	fi
	echo "6. Samba profile in UFW directory created : $token" | tee -a $progress_List

	echo "### 7. Load the profile into UFW"
	sudo ufw app update Samba
	# Verify load
	res="$(sudo ufw app list | grep Samba)"
	if [[ ! "$res" == "" ]]; then
		# Found
		token="Success"
	fi
	echo "7. Profile loaded into UFW : $token" | tee -a $progress_List

	echo "### 8. Allow Samba in UFW"
	sudo ufw allow Samba
	res="$?"
	if [[ "$res" == "0" ]]; then
		token="Success"
	fi
	echo "8. Samba allowed in UFW : $token" | tee -a $progress_List

	echo "# =============== User Management =============== #"
	echo "### 9. Add a user ###"
	user_Type=""
	user_Name=""
	user_type_Validation="Invalid"
	while [[ "$user_Type" == "" ]] || [[ "$user_type_Validation" == "Invalid" ]]; do
		# While user_Type is not New or User
		read -p "Add User [(N)ew | (E)xisting]: " user_Type
		case "$user_Type" in
			"N" | "New")
				# New User
				echo "Please create a new user before rerunning"
				user_type_Validation="Valid"
				;;
			"E" | "Existing")
				# Existing User
				while [[ "$user_Name" == "" ]]; do
					read -p "Chosen Samba user account: " user_Name
				done
				# Set password to a user
				sudo smbpasswd -a $user_Name
				res="$?"
				if [[ "$res" == "0" ]]; then
					token="Success"
				fi
				user_type_Validation="Valid"
				;;
			*)
				;;
		esac
	done
	echo "9. User added : $token" | tee -a $progress_List
	echo "# ============= End User Management =============== #"
}

function END()
{
    line=""
    read -p "Pause" line
}

function main()
{	
	ret_code="$(START)"
	if [[ "$ret_code" == "1" ]]; then
		# Success
		# Your body here
		res="$(body "$@")"
		# echo "Return Result: $res"
		echo "$res"
	else
		echo -e "Error: \n$ret_code"
	fi
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

