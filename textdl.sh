######## Text File Download Manager #########
#	Program Name: textdl                    #
#	Program Version: v1.0.0                 #
#	Project Name: Proj DL                   #
#	Code Name: Code U.T.I.L.I.Z.E           #
#	Author: Asura                           #
#	Created by: 2021-07-18 17:19H, Asura    #
#	Modified by:                            #
#		- 2021-07-18 17:19H, Asura          #
#	Changelogs:                             #
#		- 2021-07-18 17:19H, Asura          #
#			- Created script file           #
#		- 2021-07-19 14:45H, Asura          #
#			- To test textdl                #
#			- Added skeleton & functions    #
#		- 2021-07-21 09:11H, Asura          #
#			- Modified                      #
#			'if "__name__" == "__main__"''  # 
#				condition to read success   #
#				code                        # 
#############################################

# [Command Line Variables]

# Cloning function options: curl, git etc.
#	supported options:
#		curl		: Curling any file
#		curl-git	: Curling specifically a git raw text file
#		git			: Git cloning a repository
clone_options=${1:-"curl"}

# Switch-case the clone option selected
#	of the supported options
case "$clone_options" in
	"curl")
		path_to_file="$2"
		file_name="$3"
		other_params="${4:-""}"
		;;
	"curl-git")
		repo_author="$2"
		repo_name="$3"
		repo_branch="$4"
		file_name="$5"
		path_to_file=${6:-""}
		other_params="${7:-""}"
		;;
	"git")
		repo_author="$2"
		repo_name="$3"
		repo_branch="$4"
		other_params="${5:-""}"
		;;
	*)
		;;
esac

# [Global Variables]

declare -A cloning_Functions=(
	### Place all your cloning-related functions here ###
	#	- Raw file:										#
	#		curl, wget									#
	#	- Git repositories								#
	#		git clone									#
	#####################################################
	[curl]="curl -L -O"
	[git]="git clone"
)

# [Functions]

### General ###
end()
{
	### End the program ###
	end_msg=${1:-"Press anything to exit..."}
	read -p "$end_msg" tmp
	exit
}


### Program ###
print_proginfo()
{
	### Print the program information ###
	echo "Project Name: $PROJ_NAME"
	echo "Code Name: $CODE_NAME"
	echo "Program Name: $PROG_NAME"
	echo "Program Version: $PROG_VERS"
}

set_proginfo()
{
	### Set Program Info ####
	# 	Default: itself		#
	#########################
	PROJ_NAME="${1:-$PROJ_NAME}"
	CODE_NAME="${2:-$CODE_NAME}"
	PROG_NAME="${3:-$PROG_NAME}"
	PROG_VERS="${4:-$PROG_VERS}"
}


### Bootup Processing ###
init()
{
	##### Initialization process ####
	# - Variables etc				#
	# - Prints etc.					#
	#################################
	echo "Bootup, starting check..."
}

setup()
{
	##### Setup process #####
	# - Populate variables	#
	#########################
	set_proginfo "Proj DL" "Code U.T.I.L.I.Z.E" "textdl" "v1.0.0"
}

bootup()
{
	###### Bootup Process #######
	# What to do after bootup  	#
	#	aka startup				#
	#############################
	init
	setup
	print_proginfo
	echo "Startup completed"
}

### Project Functions ###
curl_funcs()
{
	curl_url=$path_to_file/$file_name

	### Curl the raw text ####
	${cloning_Functions["curl"]} $other_params $curl_url
}
curl_git_rawtext()
{
	### Curl a git raw text ###

	# Git Raw text Curl parameters
	git_repo_raw_url="https://raw.githubusercontent.com/$repo_author/$repo_name/$repo_branch/"
	
	# null validation
	if [[ "$path_to_file" == "" ]]; then
		git_repo_raw_url+="$file_name"
	else
		git_repo_raw_url+="$path_to_file/$file_name"
	fi

	# Curl the repo
	${cloning_Functions["curl"]} $other_params $git_repo_raw_url
}
clone_git_repo()
{
	### Clone a git repository ###

	# Git Repository Parameters
	git_repo_url="https://github.com/$repo_author/$repo_name"

	# Clone the repository
	${cloning_Functions["git"]} $other_params $git_repo_raw_url
}

### Mains ###
error()
{
	### Run if errors are detected ###
	error_msg="$1"

	# Local Variables
	declare -A errorcode=(
		#### All your error code ID here ####
		#	Arranged according to ID		#
		#####################################
		[1]="0x1"
	)
	declare -A errorlist=(
		### All your error code Messages here ###
		#	Arranged according to error code	#
		#########################################
		[0x1]="Invalid Command"
	)
	err_Detected="0"	# Error Code: default: 0, if Error is detected: 1

	case "$error_msg" in
		"${errorcode[1]}")
			# Invalid command
			echo "Error: ${errorlist[$error_msg]}"
			err_Detected="1"
			;;
		*)
			;;
	esac

	echo "$err_Detected"
}

body()
{
	#### Main codes here ###

	# Switch-case the clone option selected
	#	of the supported options
	case "$clone_options" in
		"curl")
			curl_funcs
			;;
		"curl-git")
			curl_git_rawtext
			;;
		"git")
			clone_git_repo
			;;
		*)
			;;
	esac
}

main()
{
	body "$@"
	res="$?"
	echo "Body Function Result Code: $res"
}

# Curl 
if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
	bootup
	if [[ "$?" == "0" ]]; then
		# No Error
		main "$@"
	fi
	end
fi