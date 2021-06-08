#
# Integrated Git Package Manager (IGpm)
# Author: Asura
# Created: 2021-06-07 2344H, Asura
# Modified: 
#	- 2021-06-07 2344H, Asura
#	- 2021-06-08 2211H, Asura
#	- 2021-06-09 0000H, Asura
# Features: 
# Background Information: 
#	An all-in-one Git package manager that allows the user to
#		i. Create git repos easily
#		ii. Add files to a git repo
#		iii. Commit files to a git repo
#		iv. Handle and Manage transition/transmission between local and remote repositories seamlessly (target)
#				> push
#				> fetch
#				> merge
#				> pull
# Changelog:
#	- 2021-06-07 2344H, Asura:
#		- Created script file
#	- 2021-06-08 2211H, Asura:
#		- Updated [background information] 
#	- 2021-06-09 0000H, Asura:
#		- Modified 'body'
#		- Modularfied [print_Help and the menu function]
#

# --- Variables

# [Program]
PROGRAM_NAME="Git Manager"
PROGRAM_TYPE="Main"

# [Global]
local_Files="*"
local_commit_Message="Created and added some files"
remote_repository_URL="origin"
remote_repository_Branch="main"

# [Arrays]

# [Associative Arrays]
declare -A git_config_Params=(
	[global]="--global"
)

declare -A git_local_Commands=(
	[create-repo]="git init"
	[add-files]="git add $local_Files"
	[commit-files]="git commit -m $local_commit_Message"
	[config]="git config"
)

declare -A git_config_Commands=(
	[config-global-add-username]="git config ${git_config_Params["global"]} user.name"
	[config-global-add-email]="git config ${git_config_Params["global"]} user.email"
	[config-add-username]="git config user.name"
	[config-add-email]="git config user.email"
)

declare -A git_remote_Commands=(
	[push-remote_server]="git push -u $remote_repository_URL $remote_repository_Branch"
	[get-changes]="git fetch"
	[merge-changes]="git merge"
	[fetch-and-merge]="git pull"
)

declare -A git_Commands=(
	[local]="${!git_local_Commands[@]}"
	[config]="${!git_config_Commands[@]}"
	[remote]="${!git_remote_Commands[@]}"
)

# [Derivative]
number_of_config_Params="${#git_config_Params[@]}"
number_of_local_Commands="${#git_local_Commands[@]}"
number_of_config_Commands="${#git_config_Commands[@]}"
number_of_remote_Commands="${#git_remote_Commands[@]}"
number_of_Commands="${#git_Commands[@]}"

# --- Functions

# General Functions


# Pre-Requisite Functions
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

# Library Functions
print_Arguments()
{
	argv=("$@")
	argc="${#argv[@]}"

	echo "[All Arguments]"
	echo "[0] : [$0]"
	for (( i=0; i < $argc; i++ )); do
		echo "[$((i+1))] : [${argv[$i]}]"
	done
}

print_Help()
{
	#echo "[Local Commands]"
	#for local_cmd in "${!git_local_Commands[@]}"; do
	#	echo "[$local_cmd] : ${git_local_Commands[$local_cmd]}"
	#done

	#echo ""

	#echo "[Config Commands]"
	#for config_cmd in "${!git_config_Commands[@]}"; do
	#	echo "[$config_cmd] : ${git_config_Commands[$config_cmd]}"
	#done

	#echo ""

	#echo "[Remote Commands]"
	#for remote_cmd in "${!git_remote_Commands[@]}"; do
	#	echo "[$remote_cmd] : ${git_remote_Commands[$remote_cmd]}"
	#done

	for uCommand in ${!git_Commands[@]}; do
		echo "[ $uCommand Commands ]"
		for k in ${git_Commands[$uCommand]}; do
			case "$uCommand" in
				"local")
					v="${git_local_Commands[$k]}"
					;;
				"remote")
					v="${git_remote_Commands[$k]}"
					;;
				"config")
					v="${git_config_Commands[$k]}"
					;;
				*)
					;;
			esac
			echo " [ $k -> $v ]"
		done
	done
}

menu_Git()
{
	#
	# Git Package Manager
	#
	
	# --- Input

	# [Local Variables]
	# Arrays
	key_git_commands_Local="${!git_local_Commands}"
	value_git_commands_Local="${git_local_Commands}"
	key_git_commands_Config="${!git_config_Commands}"
	value_git_commands_Config="${git_config_Commands}"
	key_git_commands_Remote="${!git_remote_Commands}"
	value_git_commands_Remote="${git_remote_Commands}"

	# Strings and Inputs
	PS3="Please enter your option: "
	uCommand=""

	# --- Processing
	# while true; do
	while sleep 1; do
		echo "[ Select Command ]"
		# Display options
		for s in "${!git_Commands[@]}"; do
			echo "	> $s"
		done

		# Get user input
		read -p "$PS3" uCommand	
		
		# Data Validation
		if [[ ! "$uCommand" == "" ]]; then
			# Data Validation : Empty / Null Value
			case "$uCommand" in
				"exit")
					break
					;;
				"")
					uCommand="Empty"
					;;
				*)
					echo "Selected:"
					# echo "	[$uCommand] -> ["${git_Commands[$uCommand]}"]"
					for k in ${git_Commands[$uCommand]}; do
						case "$uCommand" in
							"local")
								echo " [ $k -> ${git_local_Commands[$k]} ]"
								;;
							"remote")
								echo " [ $k -> ${git_remote_Commands[$k]} ]"
								;;
							"config")
								echo " [ $k -> ${git_config_Commands[$k]} ]"
								;;
							*)
								;;
						esac
					done
					;;
			esac
		else
			echo "No Selection"
			# break
		fi
	done

	# --- Output
	echo ""
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
	
	# --- Variables
	## Command Line Parameters
	argv=("$@")
	argc="${#argv[@]}"

	## Local Variables
	params="${argv[0]}" # 1st Item parsed in
	options="${argv[1]}"

	# Example : Remove this if you need to
	# Command Line Feature
	if [[ ! "$params" == "" ]]; then
		# Data Validation : NOT Empty / Null Value
		echo "Parameter: $params"
		case "$params" in
			"-h" | "--help")
				print_Help
				;;
			"-p" | "--print")
				print_Arguments "$@"
				;;
			*)
				echo "Invalid Parameter"
				;;
		esac
	else
		# Run terminal program (menu)
		menu_Git
	fi
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

	#ret_code="$(startup)"
	#if [[ "$ret_code" == "1" ]]; then
		# Success
		# Your body here
	#	res="$(body "$@")"
		# echo "Return Result: $res"
	#	echo "$res"
	#else
	#	echo -e "Error: \n$ret_code"
	#fi
	body "$@"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # START
    init
	main "$@"
    END
fi

