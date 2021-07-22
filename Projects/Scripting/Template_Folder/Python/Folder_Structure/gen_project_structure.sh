##### Generate Project Workstructure ####
# :: Example Project Structure			#
#	/MyApplication						#
#		|-- run.py						#
#		|-- config.py					#
#		|__ /app						#
#			|-- __init__.py				#
#			|-- /module_one				#
#				|-- __init__.py			#
#				|-- controllers.py		#
#				|-- models.py           #    
#			|__ /templates				#
#				|-- module_one			#
#					|-- hello.html		#
#			|__ /static					#
#			|__ ..						#
#			|__ .						#
#########################################

# References
# How To Package And Distribute Python Applications
#	https://www.digitalocean.com/community/tutorials/how-to-package-and-distribute-python-applications


# --- Project Information
app_language="$1"
app_name=${2:-"MyApplication"}
case $app_language in
	# Switch case input language
	"html")
		src_filename=${3:-"index.html"}
		;;
	"c")
		src_filename=${3:-"main.c"}
		;;
	"c++" | "cpp")
		src_filename=${3:-"main.cpp"}
		;;
	"cs" | "c#" | "csharp" | "CSharp")
		src_filename=${3:-"main.cs"}
		;;
	"python")
		src_filename=${3:-"main.py"}
		;;
	*)
		src_filename=${3:-"main.$app_language"}
		;;
esac

############## [EDIT THIS] ##############
#	- Pleae edit the variables in this	#
#########################################

# --- Global Variables
fldr_root=~/$app_name
fldr_app=$fldr_root/app
fldr_app_templates=$fldr_app/templates
fldr_app_static=$fldr_app/static

# --- Define General Folders and Files

fldrs=(
	$fldr_app_templates
	$fldr_app_static
)
files=(
	$fldr_root/run.py
	$fldr_root/config.py
	$fldr_app/__init__.py
)

# --- Define Modules, Folders and Files
declare -A module_dir=(
	############# Place Module Directories Here #############
	#	:: Notes											#
	#	:: Syntax											#
	#	[module_name_folder]="/path/to/module/"				#
	#########################################################
	[module_one_app]="$fldr_app/module_one"
	[module_one_templates]="$fldr_app_templates/module_one"
)
declare -A module_files=(
	########### Place Module Files Here #############
	#	:: Notes									#
	#	- Please seperate all subvalues with		#
	#		delimiter ','							#
	#	:: Syntax									#
	#	[module_name]="/path/to/module/files"		#
	#################################################
	[module_one]="${module_dir["module_one_app"]}/__init__.py,${module_dir["module_one_app"]}/controllers.py,${module_dir["module_one_app"]}/models.py,${module_dir["module_one_templates"]}/$src_filename"	# Runs when you import the project folder
)

#####################
#	EDITING END		#
#####################


### Functions ###

# --- General

seperate_by_Delim()
{
	#
	# Seperate a string into an array by the delimiter
	#

	# --- Input
	
	# Command Line Argument
	str="$1"			# String to be seperated
	delim="${2:-';'}"	# Delimiter to split

	# Local Variables

	# Array
	content=()			# Array container to store results
	char=''				# Single character for splitting element of a string

	# Associative Array

	# --- Processing
	# Split string into individual characters
	IFS=$delim read -r -a content <<< "$str"
	
	# --- Output
	echo "${content[@]}"
}

create_dir()
{
	# Create Directories
	for d in "${fldrs[@]}"; do
		mkdir -p $d
	done
}

create_files()
{
	# Create Files
	for f in "${files[@]}"; do
		touch $f
	done
}

create_module_folders()
{
	# Create Module Folders
	for k in "${!module_dir[@]}"; do
		# Key : Module Directory Names
		# Value : Path to Module Directory
		mkdir -p "${module_dir[$k]}"
	done
}

create_module_files()
{
	# Create Module Files
	for k in "${!module_files[@]}"; do
		# Key : Module Name
		# Values : (Seperated by ',' delimiter) Files
		curr_module_val="${module_files[$k]}"
		# Seperate files to be created
		arr_curr_module=($(seperate_by_Delim $curr_module_val ','))
		for v in "${arr_curr_module[@]}"; do
			# Files to be created
			touch $v
		done
	done
}

setup_project()
{
	#############################
	#	Setup Project Workspace	#
	#############################
	create_dir
	create_files
	create_module_folders
	create_module_files
}

main()
{
	setup_project
}