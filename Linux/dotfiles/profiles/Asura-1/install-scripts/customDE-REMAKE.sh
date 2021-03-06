# ===================== CustomDE simple query structured redesign ===================== #
# For visualization of the project flow                                                 #
# ===================================================================================== #
# Author: Asura                                                                         #
# Created By: 2021-07-13 1127H, Asura                                                   #
# Modified By:                                                                          #
#   - 2021-07-13 1127H, Asura                                                           #
#   - 2021-07-14 0934H, Asura                                                           #
#   - 2021-07-14 2211H, Asura                                                           #
#   - 2021-07-15 0925H, Asura                                                           #
#   - 2021-07-15 1129H, Asura                                                           #
#   - 2021-07-15 1156H, Asura                                                           #
#   - 2021-07-15 1221H, Asura                                                           #
#   - 2021-07-18 0630H, Asura                                                           #
#   - 2021-07-26 1839H, Asura                                                           #
#   - 2021-07-27 1108H, Asura                                                           #
#   - 2021-07-27 1233H, Asura                                                           #
#   - 2021-07-27 1341H, Asura                                                           #
#   - 2021-07-27 2257H, Asura                                                           #
#   - 2021-08-01 0034H, Asura                                                           #
#   - 2021-08-01 1034H, Asura                                                           #
#   - 2021-08-01 1620H, Asura                                                           #
# Changelogs:                                                                           #
#   - 2021-07-13 1127H, Asura                                                           #
#       i. Copied from 'customDE-simple_flow.sh'                                        #
#   - 2021-07-13 2250H, Asura                                                           #
#       i. Realised using $PWD in sudo retains the working directory of user            #
#       ii. Added function 'change_owner'                                               #
#   - 2021-07-13 2336H, Asura                                                           #
#       i. Added a check for sudo privileges                                            #
#   - 2021-07-14 0934H, Asura                                                           #
#       i. Added delays to startx in .bash_profile                                      #
#       ii. Modified setup_AUR()                                                        #
#   - 2021-07-14 2211H, Asura                                                           #
#       i. Added 'sudo' (temporarily) to all functions that requires sudo as a bypass   #
#           to get the script to work as a Proof-of-Concept                             #
#           - To find out how to install AUR helpers when i sudo the script file        #
#   - 2021-07-14 2224H, Asura                                                           #
#       i. Added sleep after every function                                             #
#   - 2021-07-15 0925H, Asura                                                           #
#       i. Seperated yay from aur                                                       #
#           - yay refers to the installation of                                         #
#               aur packages with the use of an aur helper                              #
#           - aur refers to the installation of aur packages via manual methodolgy      #
#   - 2021-07-15 1129H, Asura                                                           #
#	    i. Fixed installation of aur via manual method (makepkg -si)                    #
#		    - appears to be stable                                                      #
#	    ii. Added functions                                                             #
#           - [countdown, progressbar and sleep_with_message]                           #
#   - 2021-07-15 1156H, Asura                                                           #
#       i. Modified 'sleep_with_message' to contain special messages with 'reverse' in  #
#           its name - these are for the order of display                               #
#               i.e.                                                                    #
#                   normal: 0,1...--> n                                                 #
#                   reverse: n,n-1,n-2...->0                                            #
#   - 2021-07-15 1221H, Asura                                                           #
#       i. Fixed countdown                                                              #
#           - Changed 'max' to 0                                                        #
#           - Fixed typos                                                               #
#   - 2021-07-18 0630H, Asura                                                           #
#       i. Added sudo to useradd (permission error)                                     #
#       ii. Added validation for 'aur_install()' --> Check if git is installed          #
#   - 2021-07-26 1839H, Asura                                                           #
#       i. Fixed typo error with package name 'subime-text-dev' --> 'sublime-text-dev'  #
#       ii. Added sudo behind chown just in case                                        #
#   - 2021-07-27 1108H, Asura                                                           #
#       i. DEBUGGING: using pacman -Qi $package_name > /dev/null instead of grep for    #
#           package checking                                                            #
#   - 2021-07-27 1233H, Asura                                                           #
#       i. Created function 'is_pkg_installed' to check if package is installed         #
#       ii. Realized that the reason why package checking is screwed is because         #
#           of binary bs, darn it, added '!' to the pack of if package is installed     #
#   - 2021-07-27 1341H, Asura                                                           #
#       i. Removed 'echo $?' from aur package install function to use "$?" after        #
#           running the function                                                        #
#   - 2021-07-27 2257H, Asura                                                           #
#       i. Created functions [setup_swapfile] and [setup_audio] for swapfile and audio  #
#           respectively                                                                #
#       ii. Set [setup_swapfile] and [setup_audio] in body()                            #
#       iii. Added variable 'swapfile_size' for setup_swapfile                          #
#       iv. Created associative array 'audioinfo' -> to contain audio parameters        #
#           - for use in audio setup & definitions such as unmute, mute and packages    #
#   - 2021-08-01 0034H, Asura                                                           #
#       i. Added variable 'default_wmde_start_command'                                  #
#           - Contains the exec command of the default window manager                   #
#               to use when defining "exec" (if applicable)                             #
#   - 2021-08-01 1034H, Asura                                                           #
#       i. Removed $default_wmde_config from files to edit                              #
#       ii. Added function 'setup_wm' => To setup window manager                        #
#           - To remove in postinstllation script => Have both DE and WM                #
#   - 2021-08-01 1620H, Asura                                                           #
#       i. Fixed setup_audio                                                            #
# ===================================================================================== #

: "--- NOTES
1. Please run this with sudo to maximize the output because this includes some features
not limited to
    i. Installation
    EDIT 2021-07-14 1007H : Temporarily added sudo into all functions that requires sudo
        - Currently you do not need to use sudo on the script
            - WIP

2. 
"

# --- Variables

### Program ###
PROGRAM_SCRIPTNAME="customDE-simple_flow"
PROGRAM_NAME="Window Manager to Desktop Environment Custom Setup Script - Structured Flow Viewer"
PROGRAM_TYPE="Main"
MODE="${1:-DEBUG}" # { DEBUG | RELEASE }
DISTRO="ArchLinux" # { ArchLinux | Debian | NixOS | Void Linux | Gentoo }

### User Details ###
TARGET_USER="asura"
TARGET_USER_HOME_DIR="$PWD"
TARGET_USER_PRIMARY_GROUP="wheel"
# This contains all users that the user will need to choose to setup on; 
# Please specify all users you want to choose from by default in here
USER_SET=("asura")

### Defaults ###
default_wmde="qtile"    # Default Window Manager or Desktop Environment

### Constants ###
# User's Home Directory; Realised that using $PWD in sudo retained the working directory of user instead of the root
const_HOME_DIR=$PWD    
# Folders
config_path=$const_HOME_DIR/.config
# Files
bashrc=$const_HOME_DIR/.bashrc
xinitrc=$const_HOME_DIR/.xinitrc
xresources=$const_HOME_DIR/.Xresources
bashrc_personal=$const_HOME_DIR/personal/dotfiles/bash/.bashrc-personal
bash_profile=$const_HOME_DIR/.bash_profile
aur_install_Logs=$const_HOME_DIR/personal/dotfiles/bash/.aur-installs
case "$default_wmde" in
    "qtile")
        # Default Template Directory
        # Requires sudo
        default_wmde_config_fldr="/usr/share/doc/qtile"
        default_wmde_config_file=default_config.py
        default_wmde_config_fullpath=$default_wmde_config_fldr/$default_wmde_config_file
        # User's home directory
        wmde_home_config_fldr=$config_path/qtile
        wmde_home_config_file=config.py
        wmde_home_config_fullpath=$wmde_home_config_fldr/$wmde_home_config_file
        # Other WM Defaults
        default_wmde_start_command="exec qtile start"
        # Required Packages
        required_pkgs=(
            "python-pip" 
        )
        ;;
    "bspwm")
        # Default Template Directory
        # Requires sudo
        default_wmde_config_fldr="/usr/share/doc/bspwm"
        default_wmde_config_file=bspwmrc
        default_wmde_config_fullpath=$default_wmde_config_fldr/$default_wmde_config_file
        # Other Required default template directories
        default_sxhkd_config_fldr="/usr/share/doc/sxhkd"
        default_sxhkd_config_file=sxhkdrc
        default_sxhkd_config_fullpath=$default_sxhkd_config_fldr/$default_sxhkd_config_file
        # User's home directory
        wmde_home_config_fldr=$config_path/bspwm
        wmde_home_config_file=bspwmrc
        wmde_home_config_fullpath=$wmde_home_config_fldr/$wmde_home_config_file
        # User's additional config home directories
        sxhkd_home_config_fldr=$config_path/sxhkd
        sxhkd_home_config_file=sxhkdrc
        sxhkd_home_config_fullpath=$sxhkd_home_config_fldr/$sxhkd_home_config_file
        # Other WM Defaults
        default_wmde_start_command="exec bspwm"
        # Required Packages
        required_pkgs=(
            "sxhkd"
        )
        ;;
    *)
        default_wmde_config_fldr=$config_path
        default_wmde_config_file=""
        default_wmde_start_command="exec"
        ;;
esac
declare -A records_aur_links=()

############# EDIT THIS #############
# Edit everything placed under here #
#####################################

declare -A user_profiles=(
    # Place all user profiles
    # that you want to create here
    # [Parameters]
    #   primary_group : Your Primary Groups for the user (-g)
    #   secondary_groups : Your Secondary Groups for the user (-G)
    #   home_dir : Custom Home Directory (if exists)
    #   other_Params : Any other parameters (optional : if you know any others other than the top 3)
    # [Notes]
    #   1. Please put 'NIL' for all empty values
    #   2. Please seperate each column with delimiter ','
    #   3. Please seperate each subvalue of a column with delimiter ';'
    #   4. Please put either 'Yes' or 'No' for all yes/no; true/false values
    #   5. Elements [1], [2] and [3] are for the primary_group, secondary_groups and home_dir respectively, 
    #       State all additional parameters outside of the first 3 elements to the 4th column and beyond
    #       (shown in the syntax)
    # [Examples]
    #   1. other_Params : 
    #       [admin]="wheel,NIL,/home/profiles/admin,\"-c comment\", \"-b base-dir\""
    # [Syntax]
    #   [user_name]="primary_group,secondary_groups,home_dir,other_parameters"
    [admin]="wheel,NIL,/home/profiles/admin,NIL"
)
folders_to_create=(
    # Place all the folders you would like to create
	# [Syntax]
	#	i. /home/profiles/$user_name/{folder_1,folder_2,...folder_n}
	#	ii. /path/to/folder/{folder_1,folder_2,...folder_n}
    #   iii. ~/{folder_1,folder_2,...}
    #   iv. $HOME/{folder_1,folder_2,....}
    #   v. ~/folder
    #   vi. $HOME/folder
    $const_HOME_DIR/.logs/$PROGRAM_SCRIPTNAME
    $config_path
    $const_HOME_DIR/.script
    $const_HOME_DIR/.tmp
    $const_HOME_DIR/personal/dotfiles/bash
    $wmde_home_config_fldr
)
files_to_create=(
    # ==============================================
    # Place all the files you would like to create here
    # [Syntax]
    #   i. /home/profiles/$user_name/file_1
    #   ii. /path/to/folder/file
    #   iii. ~/file
    #   iv. $HOME/file
    # ==============================================
    $bashrc_personal
)
declare -A files_to_edit=(
    # Place your files and the content you want to append
    # [Syntax]
    #   Single Line:
    #      [folder_path]="Contents"
    #   Multi Line:
    #       [folder_path]="line 1\
    # line 2 \
    # line 3"
	[$bashrc]="
# --- Adding external Bashrc personal file
if [[ -f $bashrc_personal ]]; then
	# If found
	. $bashrc_personal
fi"

	[$bashrc_personal]="#
# --- BashRC [Personal]
#

### Alias ###
alias ls=\"ls -l\"
"

    [$bash_profile]="# --- Bash Profile
# This file runs when bash is first initialized (ie in the terminal's first startup)

if [[ \"\$(tty)\" = \"/dev/tty1\" ]]; then
    echo \"Starting in 3 seconds...\"
    echo \" Please press 'Ctrl + c' to stop the launch...\"
    for (( i=0; i < 3; i++ )); do
        sleep 1s    # Startx with delay
        echo \$i
    done
    startx ~/.xinitrc
fi
"

    [$xinitrc]="# --- X Initialization Resource Control
# This file executes whenever you run 'startx ~/.xinitrc'

session=\${1:-$default_wmde} # wmde : Window Manager | Desktop Environment
case \"\$session\" in
    \"$default_wmde\")
        # exec $default_wmde
        $default_wmde_start_command
        ;;
    *)
        # echo Invalid Window Manager or Desktop Environment
        # exec $1
        exec \$session
        ;;
esac
"
)
declare -A sysinfo=(
	# System Information here
	# - Place all your system information defining the build such as
	#	1. AUR Helper
	# - Please seperate all values with ';' delimiter if your parameter has multiple values
    # - Please seperate all subvalues with ',' delimiter if your parameter has subvalues
	# [Syntax]:
	#	[parameter]="value"
	# [Supported/Used Parameters]:
	#	1. for ArchLinux
	#		i. aur-helper : Your main AUR helper programs
	#	2. Others
	#		i. package-manager etc.
	[aur-helper]="yay-git"
)
declare -A pkgs=(
	# Place all your packages you want to be in the 
	# Desktop Environment here
	# according to category
	# - Please seperate each package with ';'
    # - Please seperate each package sub-value with ','
	# Syntax:
	#	[<category>]="package_name,installation_Method;package_name,installation_Method"
	# Examples:
	#	[file-browser]="package-1,pacman;package-2,yay;package-n,method-n"
    [audio]="alsa,pacman"
	[file-browser]="pcmanfm,pacman"
	[window-manager]="qtile,pacman"
	[terminal-emualator]="alacritty,pacman"
	[web-browser]="brave-bin,aur"
	[graphical-text-editor]="sublime-text-dev,aur"
	[image-setter]="nitrogen,pacman"
	[compositor]="picom,pacman"
	[system-monitor]="conky,pacman"
	[bluetooth-manager]="bluez,pacman"
	[ricing]="lxappearance-gtk3,pacman"
	[fetch]="neofetch,pacman"
	[x]="xorg-xinit,pacman;xorg,pacman;xorg-server,pacman"
	[others]=""
)
declare -A aur_helpers=(
    # Please place all your AUR helpers here alongside the links of their tar files
    # - Please seperate all column values with delimiter ','
    # - Please seperate all subvalues with delimiter ';'
	# Notes:
    # - This is for aur helpers only
    # - This is for all aur helpers with regards to installing aur helpers
    # Syntax:
	#	[helper-name]="filename,https://domain.com/package.git"
	# Example:
	#	[yay]="yay_*_x86_64,https://api.github.com/repos/Jguer/yay/releases/latest"
    [yay-git]="yay_*_x86_64,https://api.github.com/repos/Jguer/yay/releases/latest"
)
declare -A git_aur_packages_manual=(
	# Place all your AUR packages (aka git packages) here alongside the links
    # - Please seperate all column values with delimiter ','
    # - Please seperate all subvalues with delimiter ';'
    # Notes:
    # - This is for all AUR packages and manually installation without the use of an AUR helper
	# Syntax:
	#	[package-name]="filename,https://domain.com/package.git"
	# Example:
	#	[yay]="yay-git,https://aur.archlinux.org/yay-git.git"
	#   [yay-git]="git,https://aur.archlinux.org/yay-git.git"
    [brave-bin]="brave-bin,https://aur.archlinux.org/brave-bin.git"
    [sublime-text-dev]="sublime-text-dev,https://aur.archlinux.org/sublime-text-dev.git"
)
declare -A git_aur_packages_aur_Helper=(
	# Place all your AUR packages (aka git packages) here alongside the links
    # - Please seperate all column values with delimiter ','
    # - Please seperate all subvalues with delimiter ';'
    # Notes:
    # - This is for all AUR packages to be installed via an AUR helper
	# Syntax:
	#	[package-name]="filename,https://domain.com/package.git"
	# Example:
	#	[yay]="yay-git,https://aur.archlinux.org/yay-git.git"
	#   [yay-git]="git,https://aur.archlinux.org/yay-git.git"
)
declare -A pkg_install_methods=(
	# Place all your packages (value) and the method of installation (key) you want to be in the 
	# Desktop Environment here
	# according to category
	# - Please seperate each package with ';'
    # - Please note that aur and yay are seperated because yay is the helper while aur means manually cloning without the use of an AUR helper
	# Syntax:
	#	[<install-method>]=""
	# Examples:
	#	[pacman]="package-1;package-2;package-n"
	#	[aur]="package-1;package-2;package-n"
    #   [yay]="package-1;package-2;package-n"
	# Official
	[pacman]="pcmanfm;qtile;alacritty;nitrogen;picom;conky;bluez;lxappearance-gtk3;neofetch;xorg;xorg-server;xorg-xinit"
	# AUR
    [aur]="brave-bin;sublime-text-dev"
    # AUR Helpers
	[yay]=""
)
# Your swapfile size ; 
# Example: N {GB|GiB|MB|MiB} or N.0 {GB|GiB|MB|MiB} ; 
# Example: 4 {GB|GiB|MB|MiB} or 4.0 {GB|GiB|MB|MiB}
swapfile_size="4.0GiB"
declare -A audioinfo=(
    # Audio Info
    #   - Please seperate all column values with delimiter ','
    #   - Please seperate all column subvalues with delimiter ';'
    # [Keywords]
    #   audio-frameworks : The system you want to use for audio - ALSA or Pulseaudio or OSS
    #   audio-pkgs : The Packages you want to use for audio - alsa-utils, pulseaudio
    #   audio-unmute : Sections (Master, Speaker, Headphone) you want to unmute
    #   audio-mute : Sections (Master, Speaker, Headphone) you want to mute
    # [Syntax]
    #   [audio-pkgs]="alsa,pulseaudio" 
    [audio-frameworks]="alsa"
    [audio-pkgs]="alsa-utils"
    [audio-unmute]="Master,Speaker,Headphone"
    [audio-mute]=""
)

########## END EDIT ##########
# Edit variables stops here  #
##############################

### General ###
declare -A install_commands=(
	[ArchLinux]="sudo pacman -S --noconfirm --needed"
	[Debian]="sudo apt install"
)

### Essentials ###
install_Command="${install_commands["$DISTRO"]}"

# --- Functions

### General ###
create_directories()
{
	folders=("$1")
	
	# Create folders if doesnt exist
	for d in "${folders[@]}"; do
		if [[ ! -d $d ]]; then
			mkdir -p $d
		fi
	done
}

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

log_datetime()
{
	#
	# Return datetime as of setting
	#
	format=${1:-'%d-%m-%y %H-%M-%S'}
	echo "$(date +'%d-%m-%y %H-%M-%S')"
}

comment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '$regex_Pattern/s/^/#/g' $filename
}
uncomment_line()
{
	#
	# Uncomment line that contains a keyword using
	#	sed : Regular Expression
	#
	regex_Pattern="$1"
	filename="$2"
	sed -i '$regex_Pattern/s/^#//g' $filename
}
sleep_with_message()
{
    # Sleeping with messages
    # Special message types:
    #   1. loadingbar : For Progress Bars
    #   2. Print only the index
    max=$1
    min=${2:-0}
    increment=${3:-1}
    sleep_duration=${4:-1}
    msg=${5:-""}  # Message you want to display every time it sleeps; special characters : 'loadingbar', 'index'

    # Preparation of special messages
    case "$msg" in
        "loadingbar")
            echo "|"
            ;;
        *)
            ;;
    esac

    if [[ "$(echo $msg | grep 'reverse')" == "" ]]; then
        # If message does not contain 'reverse'
        if [[ "$increment" == "1" ]]; then
            if [[ "$min" == "0" ]]; then
                # Start from 0
                for (( i=$min; i < $max; i++ )); do
                    # sleep 1s
                    sleep $sleep_duration
                    case "$msg" in
                        # Special Messages
                        "loadingbar")
                            echo -n "=" # Append character to the same line
                            ;;
                        "index")
                            echo "$i"
                            ;;
                        *)
                            echo "$msg"
                            ;;
                    esac
                done
            else
                # Start from non-0
                for (( i=$min; i <= $max; i++ )); do
                    # sleep 1s
                    sleep $sleep_duration
                    case "$msg" in
                        # Special Messages
                        "loadingbar")
                            echo -n "=" # Append character to the same line
                            ;;
                        "index")
                            echo "$i"
                            ;;
                        *)
                            echo "$msg"
                            ;;
                    esac
                done
            fi
        else
            if [[ "$min" == "0" ]]; then
                # Start from 0
                for (( i=$min; i < $max; i+=$increment )); do
                    # sleep 1s
                    sleep $sleep_duration
                    case "$msg" in
                        # Special Messages
                        "loadingbar")
                            echo -n "="
                            ;;
                        "index")
                            echo "$i"
                            ;;
                        *)
                            echo "$msg"
                            ;;
                    esac
                done
            else
                # Start from non-0
                for (( i=$min; i <= $max; i+=$increment )); do
                    # sleep 1s
                    sleep $sleep_duration
                    case "$msg" in
                        # Special Messages
                        "loadingbar")
                            echo -n "="
                            ;;
                        "index")
                            echo "$i"
                            ;;
                        *)
                            echo "$msg"
                            ;;
                    esac
                done
            fi
        fi
    else
        # Reverse
        # Trim 'reverse' from the text
        msg="$(echo $msg | cut -d '-' -f1)"
        if [[ "$increment" == "1" ]]; then
            # Start from non-0
            for (( i=$min; i > 0; i-- )); do
                # sleep 1s
                sleep $sleep_duration
                case "$msg" in
                    # Special Messages
                    "loadingbar")
                        echo -n "=" # Append character to the same line
                        ;;
                    "index")
                        echo "$i"
                        ;;
                    *)
                        echo "$msg"
                        ;;
                esac
            done
        else
            # Start from non-0
            for (( i=$min; i > 0; i-=$increment )); do
                # sleep 1s
                sleep $sleep_duration
                case "$msg" in
                    # Special Messages
                    "loadingbar")
                        echo -n "="
                        ;;
                    "index")
                        echo "$i"
                        ;;
                    *)
                        echo "$msg"
                        ;;
                esac
            done
        fi
    fi

    # Packing up and finishing of special messages
    case "$msg" in
        "loadingbar")
            echo -n ">|" # Close off the loading bar
            echo "" # New Line
            ;;
        *)
            ;;
    esac
}
countdown()
{
    # Countdown Timer
    # Count from n --> 0
    # max=$1
    # min=${2:-0}
    # increment=${3:-1}
    # sleep_duration=${4:-1}
    min=$1
    max=0
    increment=${2:-1}
    sleep_duration=${3:-1}
    message="index-reverse"
    sleep_with_message $max $min $increment $sleep_duration "$message"
}
progressbar()
{
    # A progress bar
    max=$1
    min=${2:-0}
    increment=${3:-1}
    sleep_duration=${4:-1}
    message="progressbar"
    sleep_with_message $max $min $increment $sleep_duration "$message"
}

### Git ###
git_clone()
{
    git_url="$1"
    out_path=${2:-$PWD}

    # Change Directory if got different output
    if [[ ! "$out_path" == "$PWD" ]]; then
        cd "$out_path"
    fi

    git clone "$git_url"
}

### Data Structures ###
if_in_Arr()
{
	#
	# Check if element is in array
	#
	str="$1"
	arr=("$2")
	found="0"

	for e in "${arr[@]}"; do
		if [[ "$e" == "$str" ]]; then
			# Element is string
			found="1"
			break
		fi
	done

	echo "$found"
}
slice()
{
    # Slice an array according to a format
    # [Syntax]
    #   format:
    #   when taking a slice,
    #       * if left to right
    #       :n(1):n(2)
    #           n(1) is the Starting Index
    #           n(2) is the slice length (how many elements from the starting index you want to slice)
    #       * if counting reverse
    #       -n(1):n(2)
    #           n(1) is the Starting Index counting backwards (index '0' is the last element in the array, '1' is the second last etc.)
    #           n(2) is the slice length (how many elements from the starting index you want to slice - backwards)
    #       * Individual elements
    #       n(x)
    #           x is the index you want to take
    #       * All elements (array)
    #       n(@)
    #           @ is taking all elements in array format
    #       * All elements (string)
    #       n(*)
    #           * is taking all elements in string format
    # [Examples]
    #   let arr=("Hello world" 54 32 12 "Hello!")
    #   slice "${arr[@]}" ":3"  # Starts taking a slice at index 3

    # --- Input
    arr=("$1")
    format=""
    res=()

    # --- Processing
    if [[ ! "$format" == "" ]]; then
        # Format not empty
        res=("${arr[@]$format}")   
    fi

    # --- Output
    # Return Array
    echo "${res[@]}"
}
arr_append()
{
    #
    # Append to Array
    #
    arr=("$1")
    str=${@:2}  # Start taking all arguments from index 2 onwards
    strlen="${#str[@]}"

    # Loop through all the strings and 
    # append into array one by one
    for ((i=0; i < $strlen; i++)); do
        arr+=("${str[$i]}")
    done
}

### Algorithms ###

### User Management ###
get_users_Home()
{
	#
	# Get the home directory of a user
	#
	USER_NAME=$1
	HOME_DIR=""
	if [[ ! "$USER_NAME"  == "" ]]; then
		# Not Empty
		HOME_DIR=$(su - $USER_NAME -c "echo \$HOME")
	fi
	echo "$HOME_DIR"
}
check_user_Exists()
{
	#
	# Check if user exists
	#
	user_name="$1"
	exist_Token="0"
	delimiter=":"
	res_Existence="$(getent passwd $user_name)"

	if [[ ! "$res_Existence" == "" ]]; then
		# Something is found
		# Check if is the user
		res_is_User=$(echo "$res_Existence" | grep "^$user_name:" | cut -d ':' -f1)

		if [[ "$res_is_User" == "$user_name" ]]; then
			exist_Token="1"
		fi
	fi

	echo "$exist_Token"
}
useradd_get_default_Params()
{
    #
    # Useradd
    #   - Get Default Parameters
    #
    declare -A params=(
        [group]="$(useradd -D | grep GROUP | cut -d '=' -f2)"
        [home]="$(useradd -D | grep HOME | cut -d '=' -f2)"
        [inactive]="$(useradd -D | grep INACTIVE | cut -d '=' -f2)"
        [expire]="$(useradd -D | grep EXPIRE | cut -d '=' -f2)"
        [shell]="$(useradd -D | grep SHELL | cut -d '=' -f2)"
        [skeleton-path]="$(useradd -D | grep SKEL | cut -d '=' -f2)"
        [create-mail-spool]="$(useradd -D | grep CREATE_MAIL_SPOOL | cut -d '=' -f2)"
    )
    default_Params=()

    keywords=(
        "GROUP"
        "HOME"
        "INACTIVE"
        "EXPIRE"
        "SHELL"
        "SKEL"
        "CREATE_MAIL_SPOOL"
    )
    for k in "${keywords[@]}"; do
        # Put all keywords with the default values
        # default_Params[$k]="$(useradd -D | grep $k | cut -d '=' -f2)"
        default_Params+=("$(useradd -D | grep $k | cut -d '=' -f2)")
    done

    echo "${default_Params[@]}"
}
get_all_users()
{
	#
	# Check if user exists
	#
	exist_Token="0"
	delimiter=":"
	res_Existence="$(getent passwd)"
    all_users=($(cut -d ':' -f1 /etc/group | tr '\n' ' '))

	echo "${all_users[@]}"
}
get_user_primary_group()
{
    #
    # Just retrieves the user's primary group (-g)
    #
    user_name="$1"
    primary_group="$(id -gn $user_name)"
    echo "$primary_group"
}
create_user()
{
    # =========================================
    # :: Function to create user lol
    #   1. Append all arguments into the command
    #   2. Execute command and create
    # =========================================

    # --- Head
    ### Parameters ###
    u_name="$1"                 # User Name
    # Get individual parameters
    u_primary_Group="$2"        # Primary Group
    u_secondary_Groups="$3"     # Secondary Groups
    u_home_Dir="$4"             # Home Directory
    u_other_Params="$5"         # Any other parameters after the first 3

    # Local variables
    u_create_Command="useradd"
    create_Token="0"            # 0 : not Created; 1 : Created

    # --- Processing
    # Get Parameters
    if [[ ! "$u_home_Dir" == "NIL" ]]; then
        # If Home Directory is not Empty
        u_create_Command+=" -m "
        u_create_Command+=" -d $u_home_Dir "
    fi

    if [[ ! "$u_primary_Group" == "NIL" ]]; then
        # If Primary Group is Not Empty
        u_create_Command+=" -g $u_primary_Group "
    fi

    if [[ ! "$u_secondary_Groups" == "NIL" ]]; then
        # If Primary Group is Not Empty
        u_create_Command+=" -G $u_secondary_Groups "
    fi

    if [[ ! "$u_other_Params" == "NIL" ]]; then
        # If there are any miscellenous parameters
        u_create_Command+=" $u_other_Params "
    fi

    u_create_Command+="$u_name"

    # Create users
    if [[ "$MODE" == "DEBUG" ]]; then
        echo "$u_create_Command"
    else
        $u_create_Command

        # Change Password of user
        if [[ "$?" == "0" ]]; then
            echo "============================="
            echo " Password change for $u_name "
            echo "============================="
            passwd $u_name

            # Set token to created (1)
            create_Token="1"
        fi

        # Append user to userset
        # Verify: Duplicates exists
        #   - Do not append if exists
        u_Duplicates="$(if_in_Arr $u_name ${USER_SET[@]})"
        if [[ ! "$u_Duplicates" == "1" ]]; then
            # Does not Exists
            USER_SET+=("$u_name")
        fi
    fi

    # --- Output
    echo "$create_Token"
}
change_owner()
{
    ###  Change the owner of a folder ###
    # [Syntax]
    #   Change owner of folder (recursively) to new owner and primary group
    #   chown -R $u_name:$primary_group $directory/file
    target=$1 # Can be either folder or file
    new_owner_uname="${2:-$TARGET_USER}"
    new_owner_primary_group="${3:-$TARGET_USER_PRIMARY_GROUP}"

    if [[ ! "$target" == "" ]]; then
        # if a target is stated
        if [[ "$MODE" == "DEBUG" ]]; then
            echo -e "chown -R $new_owner_uname:$new_owner_primary_group \"$target\""
        else
            sudo chown -R $new_owner_uname:$new_owner_primary_group "$target"
        fi
    else
        echo "No file/folder specified."
    fi
}


### Distro-Specified Functions ###
# if [[ "$DISTRO" == "ArchLinux" ]]; then
case "$DISTRO" in
    "ArchLinux")
        ### AUR functions ###
        is_pkg_installed()
        {
            #
            # Check if package is installed
            #

            # --- Input
            # Command Line Arguments
            package_name="${1:-""}"

            # ---  Processing
            if [[ ! "$package_name" == "" ]]; then
                : '
                Is not empty
                - Output
                '
                pacman -Qi "$package_name" &> /dev/null

                # --- Output
                echo "$?"
            fi
        }
        setup_AUR()
        {
            #
            # Installs AUR of your choice
            #	1. yay
            #
            helper="${1:-yay}"
            user_name="${2:-$TARGET_USER}"

            # Check if git is installed
            if [[ "$(pacman -Qq | grep git)" == "" ]]; then
                # Git not installed
                $install_Command "git"
            fi

            # Check if wget is installed
            if [[ "$(pacman -Qq | grep wget)" == "" ]]; then
                # Git not installed
                $install_Command "wget"
            fi

            # Check AUR Helper
            case "$helper" in
                "yay" | "yay-git")
                    # Install if not
                    # aur_pkg="yay-git"
                    # dependencies=(
                    # 	"go"
                    # )
                    # for dep in "${dependencies[@]}"; do
                    # 	if [[ "$(pacman -Qq | grep $dep)" == "" ]]; then
                    # 		pacman -S --noconfirm --needed $dep
                    # 	fi
                    # done
                    # su - $user_name -c "git clone \"${git_aur_packages["$aur_pkg"]}\"" # Clone yay
                    # su - $user_name -c "cd $aur_pkg && makepkg -si"

                    # References:
                    #   1. https://gist.github.com/macchaberrycream/dacb5aa930c600db335845ffa448f5c7
                    # Repo for yay latest : https://api.github.com/repos/Jguer/yay/releases/latest
                    
                    # Check if yay exists
                    helper_Exists="$(pacman -Qq | grep yay)"
                    if [[ "$helper_Exists" == "" ]]; then
                        # Seperate 'git_aur_packages' string to array with delimiter ','
                        helper_properties="${aur_helpers["$helper"]}"
                        arr_Helper=($(seperate_by_Delim "$helper_properties" ','))

                        # Clone and install if yay does not exists
                        helper_filename="${arr_Helper[0]}"
                        helper_url="${arr_Helper[1]}"

                        if [[ ! -d $helper_filename ]]; then
                            # Clone if doesnt exist
                            # git clone "$helper_url"
                            # change_owner $PWD/$helper $TARGET_USER $TARGET_USER_PRIMARY_GROUP

                            # Get URL of the helper's latest tar file
                            dl_url="$(curl -sfLS \'$helper_url\' | grep 'browser_download_url' | tail -1 | cut -d '"' -f 4 )"
                            # Download latest .tar.gz file of the AUR
                            wget "$dl_url"
                            # Untar tar file
                            tar xzvf $PWD/$helper_filename.tar.gz
                        fi

                        # Change Directory to helper directory
                        cd $PWD/$helper_filename
                        ./yay -Sy yay-bin
                        
                        #cd $helper
                        #makepkg -si
    #                     if [[ ! -f $PWD/setup_aur.sh ]]; then
    #                         # Echo in if the script doesnt exist
    #                         echo -e "cd $PWD/$helper\n\
    # makepkg -si" | tee -a $PWD/setup_aur.sh
    #                         chmod +x $PWD/setup_aur.sh
    #                         change_owner $PWD/setup_aur.sh $TARGET_USER $TARGET_USER_PRIMARY_GROUP
    #                     fi
    #                     rm $PWD/setup_AUR.sh
                    fi
                    ;;
                *)
                    echo "Invalid helper : $helper"
                    ;;
            esac
        }
        aur_install()
        {
            # Manual Installation from AUR without helper
            # Installation methodology
            #   i. git clone <link-to-aur-git>
            #   ii. cd <aur-folder>
            #   iiia. makepkg -si        # Compile and build pakage and install
            #       or
            #   iiib. Compile and Install
            #       - makepkg -s         # Compile
            #       - pacman -U <pkgname>
            git_url="$1"                            # URL of git
            git_project="$2"                        # Output Git project name
            git_fldrname="${3:-$git_project}"       # Git's folder name; default: git file name
            out_fldr_path="${4:-$PWD}"              # Output folder where you want to clone to

            ### Validation ###
            # Check if 'git' is installed
            if [[ "$(pacman -Qq | grep 'git')" == "" ]]; then
                # If not installed
                $install_Command "git"
            fi

            # --- Processing
            if [[ ! -d $out_fldr_path/$git_fldrname ]]; then
                # if folder doesnt exist
                git_clone "$git_url" "$out_fldr_path"   # Change directory to the intended output folder and clone into it
            fi
            cd $git_fldrname                        # Jump into cloned git folder
            makepkg -si                             # Compile and build package and Install
            # echo "$?"
        }
        ;;
    *)
        ;;
# fi
esac


### Pre-Requisite Stage ###
##### Execute in Root #####
###########################
verify_network()
{
	#
	# Verify network is active
	#	0 : Success
	#	1 : Error
	#
	ping -c 5 8.8.8.8
	res=$?
	echo "$res"
}
enable_sudo()
{
	#
	# Uncomment '%wheel ALL=(ALL) ALL' in /etc/sudoers
	#	via
	#		1. visudo
	#		2. sed 
	#
	# [Regular Expression]
	#	\s : Any whitespaces
	#	\s* : Zero or more whispaces
	#	\s\+ : One or more whitespaces
	regex_Pattern="s/^#\s*\(%wheel\s\+ALL=(ALL)\s\+ALL\)/\1/"
	filename=/etc/sudoers
	# `uncomment_line $regex_Pattern $filename` 
	sudo sed -i $regex_Pattern $filename            # Warning, remove sudo if is an issue
}
user_mgmt()
{
    #
    # Create user
    #
	declare -A useradd_Params=(
        [do-not-check-badnames]="--badnames"
        [base-directory]="-b"
        [btrfs-subvolume-home-directory]="--btrfs-subvolume-home"
        [comment]="-c"
        [defaults]=""
		[create-home-directory-if-not-exist]="-m"
		[primary-group]="-g"
		[secondary-group]="-G"
		[home-directory]="-d"
	)
    # User Management
    # 3.i.  user_mgmt
    # 1. Check if users specified in variable [user_profiles] exists
    #   i. If does not exist
    #       a. Loop through and create users
    # 2. Check if user has a character to setup on
    #   i. If no character
    #       a. force to create a user to setup 
    #       b. restart function

    # [3.1]
    # Loop through all users in user_profiles and
    # See if it exists, follow above documentation
    for u_name in "${!user_profiles[@]}"; do
        # Check if user exists
        u_Exists="$(check_user_Exists $u_name)" # Check if user exists; 0 : Does not exist | 1 : Exists
        
        # Get all parameters
        u_Params=("${user_profiles[$u_name]}")  # User Parameters
        # Split all parameters from string into arr
        u_params_Arr=($(seperate_by_Delim ${u_Params[@]} ','))
    
        # Get individual parameters
        u_primary_Group="${u_params_Arr[0]}"        # Primary Group
        u_secondary_Groups="${u_params_Arr[1]}"     # Secondary Groups
        u_home_Dir="${u_params_Arr[2]}"             # Home Directory
        u_other_Params="${u_params_Arr[@]:3}"       # Any other parameters after the first 3

        if [[ ! "$u_Exists" == "1" ]]; then
            # 0 : Does not exist
            echo "User [$u_name] does not exist"

            u_create_Command="useradd"
            # Get Parameters
            if [[ ! "$u_home_Dir" == "NIL" ]]; then
                # If Home Directory is not Empty
                u_create_Command+=" -m "
                u_create_Command+=" -d $u_home_Dir "
            fi

            if [[ ! "$u_primary_Group" == "NIL" ]]; then
                # If Primary Group is Not Empty
                u_create_Command+=" -g $u_primary_Group "
            fi

            if [[ ! "$u_secondary_Groups" == "NIL" ]]; then
                # If Primary Group is Not Empty
                u_create_Command+=" -G $u_secondary_Groups "
            fi

            if [[ ! "$u_other_Params" == "NIL" ]]; then
                # If there are any miscellenous parameters
                u_create_Command+=" $u_other_Params "
            fi

            u_create_Command+="$u_name"

            # Create users
            if [[ "$MODE" == "DEBUG" ]]; then
                echo "$u_create_Command"
            else
                sudo $u_create_Command

                # Change Password of user
                if [[ "$?" == "0" ]]; then
                    echo "============================="
                    echo " Password change for $u_name "
                    echo "============================="
                    sudo passwd $u_name
                fi

                # Append user to userset
                # Verify: Duplicates exists
                #   - Do not append if exists
                u_Duplicates="$(if_in_Arr $u_name ${USER_SET[@]})"
                if [[ ! "$u_Duplicates" == "1" ]]; then
                    # Does not Exists
                    USER_SET+=("$u_name")
                fi
            fi
        fi
    done

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi
}

####### Setup Stage #####
##### Execute in User ###
#########################
create_dotfiles()
{
	#
	# Create : Dotfiles and Folders
	# [Stages]
	#	1 : Folders
	#	2 : Dotfiles / Configs
	#

    # Variables
    log_contents=()

	# --- Input
    user_name="$1"
	# --- Processing
	echo "================="
	echo "i. Create Folders"
	echo "================="

	for d in ${folders_to_create[@]}; do 
		if [[ "$MODE" == "DEBUG" ]]; then
			echo "Folder: $d"
		else
			if [[ ! -d $d ]]; then
				# If directory does not exist
				mkdir -p $d
				# echo "$(log_datetime) > Directory has been created : $d" | tee -a ~/.logs/stage-1-i.log
				log_contents+=("$(log_datetime) > Directory has been created : $d")
                # chown -R $TARGET_USER:$TARGET_USER_PRIMARY_GROUP $TARGET_USER_HOME_DIR
                change_owner $d $TARGET_USER $TARGET_USER_PRIMARY_GROUP
			else
				# echo "$(log_datetime) > Directory already exists : $d" | tee -a ~/.logs/stage-1-i.log
                log_contents+=("$(log_datetime) > Directory already exists : $d")
            fi
		fi
	done

    # Write logs to file
    for line in "${log_contents[@]}"; do
        echo "$line" | tee -a $const_HOME_DIR/.logs/stage-1-i.log
    done
    log_contents=()
	
    echo "==================="
	echo "ii. Create Configs "
	echo "==================="

	for f in ${files_to_create[@]}; do
		if [[ "$MODE" == "DEBUG" ]]; then
			echo "File: $f"
		else
			if [[ ! -f $f ]]; then
				# If file does not exist
				touch $f
				# echo "$(log_datetime) > File has been created : $f" | tee -a ~/.logs/stage-1-ii.log
                log_contents+=("$(log_datetime) > File has been created : $f")
                change_owner $f $TARGET_USER $TARGET_USER_PRIMARY_GROUP
			else
				# echo "$(log_datetime) > File already exists : $f" | tee -a ~/.logs/stage-1-ii.log
                log_contents+=("$(log_datetime) > File already exists : $f")
            fi
		fi
	done

    # Write logs to file
    for line in "${log_contents[@]}"; do
        echo "$line" | tee -a $const_HOME_DIR/.logs/stage-1-ii.log
    done
}
pkg_install()
{
    # Install specified packages

    # Local Variables
    log_contents=()
    pkg_category=("${!pkgs[@]}")    # Default package manager categories (pkgs variable)
    pkg_names=("${pkgs[@]}")        # Default packages to install (pkgs variable)
    arr_pkg_names=()
	arr_pkg_install_method=()
    declare -A TARGET_PKGS=()
    number_of_Packages=""
    pkginstall_Success=()               # Records all installed packages
    pkginstall_Failed=()                  # Failed installations

    # --- Processing
    # Split value string into container
    # ( "package-1,method-1" "package-2,method-2")
    for v in "${pkg_names[@]}"; do
        if [[ ! "$v" == "" ]]; then
            # If not empty; Ignore all empties
            tmp_val=($(seperate_by_Delim $v))   # Seperate the subvalues by delimiter ';' to get the subvalues
            for subvalues in "${tmp_val[@]}"; do
                tmp=($(seperate_by_Delim $subvalues ','))   # Seperate the subvalues by delimiter ',' to get 2 items: [0] - Package Name and [1] - Package installation method
            
                # Loop through split elements and get
                #   all elements in each string
                #       [0] : Package Name
                #       [1] : Install Method

                # DEBUG: Get package names
                if [[ "$MODE" == "DEBUG" ]]; then
                    for t in "${tmp[@]}"; do
                        echo "Subvalues: $t"
                    done
                    read -p "   Paused. " pause
                fi

                # Get package names
                pkg_name="${tmp[0]}"
                arr_pkg_names+=("$pkg_name")    # 1st Parameter
                # Get package install methods
                install_method="${tmp[1]}"
                arr_pkg_install_method+=("$install_method") # 2nd Parameter
                # Map target packages to install
                #   with its install method
                TARGET_PKGS[$pkg_name]="$install_method"
            done
        fi
    done
    number_of_pkgs="${#TARGET_PKGS[@]}" # Get Number of Packages

	# Confirm installation
	for p in "${!TARGET_PKGS[@]}"; do
        # [package-name] : [install-method]
        echo "[$p] : [${TARGET_PKGS[$p]}]"
    done
    #for p in "${!pkgs[@]}"; do
	#	echo "[$p] : [${pkgs[$p]}]"
	#done
	read -p "Confirm installation of the above following packages? [Y|N]: " conf

	echo ""

    if [[ ! "$conf" == "N" ]]; then
        # default: Yes
        # Install Packages
        target_pkg="${!TARGET_PKGS[@]}"
        for p in ${target_pkg[@]}; do
            if [[ ! "$p" == "" ]]; then
                # If not empty
                # - Install
                if [[ "$MODE" == "DEBUG" ]]; then
                    echo -e "$install_Command $p"
                else
                    # Check installation method 
                    # Example
                    #   [category]="package-name_n;install-method_n"
                    #   key: category
                    #   value:
                    #       key: package-name_n
                    #       value: install-method_n
                    method="${TARGET_PKGS[$p]}" # Get method of installation
                    # Switch case 
                    #   install method
                    case "$method" in
                        "pacman")
                            # Official
                            # Check if package is installed
                            pkg_installed="0"   # 0: Not Installed; 1: Installed
                            pkg_group_Check=$(pacman -Ss $p | grep "($p)")    # if search is founded with brackets
                            if [[ "$pkg_group_Check" == "" ]]; then
                                # If no bracket; Not a package group
                                # Check if individual is installed
                                # pacman -Qi "$p" &> /dev/null
                                # pkg_install_Check="$?"
                                pkg_install_Check=`is_pkg_installed $p`
                                # pkg_install_Check=$(pacman -Qq | grep $p)   # TBC To check for exact package name
                                # if [[ ! "$pkg_install_Check" == "" ]]; then
                                #     # Installed
                                #     pkg_installed="1"
                                # fi
                            else
                                # Get first item in the group list
                                pkg_group_first_Pkg=($(pacman -Ss $p | grep "($p)"))
                                first_pkg_Name=$(echo "${pkg_group_first_Pkg[0]}" | cut -d '/' -f2) # Get only the nmae (remove utilities library i.e. core)

                                # Check if item exists
                                # pkg_install_Check=$(pacman -Qq | grep $first_pkg_Name)
                                # pacman -Qi $first_pkg_Name &> /dev/null
                                # pkg_install_Check="$?"
                                pkg_install_Check=`is_pkg_installed $first_pkg_Name`
                                # if [[ ! "$pkg_install_Check" == "" ]]; then
                                #     # Installed
                                #     pkg_installed="1"
                                # fi
                            fi

                            # Install if not installed
                            if [[ ! "$pkg_install_Check" == "0" ]]; then
                                echo "Package does not exist, installing..."
                                echo "Package: $p"
                                $install_Command $p
                            
                                # Check if package is installed
                                if [[ ! "$(pacman -Qq | grep $p)" == "" ]]; then
                                    # Found
                                    # echo "$(log_datetime) > Package Installed : $p" | tee -a ~/.logs/installed-packages.log
                                    echo "$(log_datetime) > Package Installed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                    echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-installed.log
                                    pkginstall_Success+=("$p")
                                else
                                    # Not Found - Error installing
                                    # echo "$(log_datetime) > Package Install Failed : $p" | tee -a ~/.logs/installed-packages.log
                                    echo "$(log_datetime) > Package Install Failed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                    echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-failed-installs.log
                                    pkginstall_Failed+=("$p")
                                fi
                            else
                                echo "Package $p is installed."
                            fi
                            ;;
                        # AUR
                        "aur")
                            # AUR itself
                            # Arch-only feature
                            # Installation methodology
                            #   i. git clone <link-to-aur-git>
                            #   ii. cd <aur-folder>
                            #   iiia. makepkg -si        # Compile and build pakage and install
                            #       or
                            #   iiib. Compile and Install
                            #       - makepkg -s         # Compile
                            #       - pacman -U <pkgname>
                            if [[ "$DISTRO" == "ArchLinux" ]]; then
                                aurpkg_params="${git_aur_packages_manual[$p]}"
                                arr_aurpkg_params=($(seperate_by_Delim $aurpkg_params ','))
                                pkgname="${arr_aurpkg_params[0]}"
                                aur_url="${arr_aurpkg_params[1]}"
                                pkg_fldrname="$pkgname"
                                out_fldr_path="$PWD"
                                # pkg_install_Check=$(pacman -Qq | grep $p)
                                # if [[ ! "$pkg_install_Check" == "" ]]; then
                                #     # Installed
                                #     pkg_installed="1"
                                # fi
                                pkg_install_Check=`is_pkg_installed $p`
                                #pacman -Qi $p &> /dev/null
                                #pkg_install_Check="$?"

                                # Install if not installed
                                if [[ ! "$pkg_install_Check" == "0" ]]; then
                                    echo "Package does not exist, installing..."
                                    echo "Package Link: $aur_url"
                                    echo "Package File   Name: $pkgname"
                                    echo "Package Folder Name: $pkg_fldrname"
                                    echo "Package Output Path: $out_fldr_path"
                                    # Install AUR
                                    # ret_code=`aur_install "$aur_url" "$pkgname" "$pkg_fldrname" "$out_fldr_path"`
                                    aur_install "$aur_url" "$pkgname" "$pkg_fldrname" "$out_fldr_path"
                                    cd $const_HOME_DIR  # Change back to home page
                                    if [[ "$?" == "0" ]]; then
                                        # Success
                                        records_aur_links[$pkgname]="$aur_url"  # Append to AUR links records; used to git pull
                                        # Write to '.aur-installs'
                                        for name in "${!records_aur_links[@]}"; do
                                            tmp_link="${records_aur_links[$name]}"
                                            echo -e "$name,$tmp_link" | tee -a $aur_install_Logs
                                        done
                                    fi
                                    # Check if package is installed
                                    if [[ ! "$(pacman -Qq | grep $p)" == "" ]]; then
                                        # Found
                                        # echo "$(log_datetime) > Package Installed : $p" | tee -a ~/.logs/installed-packages.log
                                        echo "$(log_datetime) > Package Installed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                        echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-installed.log
                                        pkginstall_Success+=("$p")
                                    else
                                        # Not Found - Error installing
                                        # echo "$(log_datetime) > Package Install Failed : $p" | tee -a ~/.logs/installed-packages.log
                                        echo "$(log_datetime) > Package Install Failed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                        echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-failed-installs.log
                                        pkginstall_Failed+=("$p")
                                    fi
                                else
                                    echo "Package $p is installed."
                                fi
                            else
                                echo "Distro is not Arch-based, please change the installation method"
                            fi
                            ;;
                        # AUR Helpers
                        "yay" | "yay-git")
                            # An AUR helper
                            # Arch-only feature
                            if [[ "$DISTRO" == "ArchLinux" ]]; then
                                aur_helper="${sysinfo["aur-helper"]}"

                                # Install AUR Helper
                                setup_AUR "$aur_helper"

                                # Install package
                                if [[ "$aur_helper" == "yay-git" ]]; then
                                    # Git version checker
                                    # Default the git version to 'yay'
                                    aur_helper="yay"
                                fi
                                
                                # Install Package
                                # Parameters:
                                #   --needed : Download all required dependencies
                                #   --noconfirm : Download with asking anything
                                aur_pkg_installed="$($aur_helper -Qq | grep $p)"
                                if [[ "$aur_pkg_installed" == "" ]]; then
                                    # Not Found
                                    # Install
                                    echo "Package: $p"
                                    $aur_helper --needed --noconfirm -S $p
                                    
                                    # Check if package is installed
                                    if [[ ! "$($aur_helper -Qq | grep $p)" == "" ]]; then
                                        # Found
                                        # echo "$(log_datetime) > Package Installed : $p" | tee -a ~/.logs/installed-packages.log
                                        echo "$(log_datetime) > Package Installed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                        echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-installed.log
                                        pkginstall_Success+=("$p")
                                    else
                                        # Not Found - Error installing
                                        # echo "$(log_datetime) > Package Install Failed : $p" | tee -a ~/.logs/installed-packages.log
                                        echo "$(log_datetime) > Package Install Failed : $p" | tee -a $const_HOME_DIR/.logs/install-changelogs.log
                                        echo "$(log_datetime) > $p" | tee -a $const_HOME_DIR/.logs/package-failed-installs.log
                                        pkginstall_Failed+=("$p")
                                    fi
                                else
                                    echo "Package [$p] has been installed before."
                                fi
                            else
                                echo "Distro is not Arch-based, please change the installation method"
                            fi
                            ;;
                        *)
                            echo "Method is invalid / not implemented yet."
                            ;;
                    esac
                fi
            fi
            echo ""
            if [[ "$MODE" == "DEBUG" ]]; then
                read -p "Paused for debugging" resume_conf
            fi
        done
    fi

    if [[ "$MODE" == "DEBUG" ]]; then
        if [[ ! "$pkgInstall_Success" == "" ]]; then
            # Not Empty
            echo "Packages Install Successful:"
            for succ in "${pkgInstall_Success[@]}"; do
                echo "$succ"
            done
        fi

        if [[ ! "$pkgInstall_Failed" == "" ]]; then
            # Not Empty
            echo "Packages Install Failed"
            for err in "${pkgInstall_Failed[@]}"; do
                echo "$err"
            done
        fi
    fi
}
setup_dotfiles()
{
	# Setup : Dotfiles and file modification
	# [Stages]
	#	1. Append relevant files when necessary
	#	2. Uncomment / comment any settings files 
    # [Structure]
    #   Key: filepath
    #   Value: Contents to append
    # [Example]
    #   [/path/to/file]="line-1"
	# --- Input

	# Local Variables
	cmd_str=""

	# --- Processing

	echo "================="
	echo "i. Edit Dotfiles "
	echo "================="
	for file in ${!files_to_edit[@]}; do
		curr_val=${files_to_edit[$file]} # Get Content to append to file
		if [[ "$MODE" == "DEBUG" ]]; then
			echo -e "Content: \n\"$curr_val\" >> File: $file"
		else
			if [[ ! -f $file ]]; then
				# If does not exist, create
				touch $file
                change_owner $file $TARGET_USER $TARGET_USER_PRIMARY_GROUP
				echo "$(log_datetime) > File has been created : $file" | tee -a $const_HOME_DIR/.logs/stage-3-i.log
			fi
			# Append to file
			echo -e "$curr_val" | tee -a $file
			echo "$(log_datetime) > $curr_val append to file [ $file ]" | tee -a $const_HOME_DIR/.logs/stage-3-i.log
		fi
        echo ""
	done
}
setup_swapfiles()
{
    : "
    Setup Swapfiles 
    # EXAMPLE
        swapfile size = 4GB 
        fallocate -l 4G /swapfile
        chmod 600 /swapfile
        mkswap /swapfile
        swapon /swapfile
        echo # /swapfile | tee -a /etc/fstab
        echo /swapfile none swap defaults 0 0 | tee -a /etc/fstab
    "

    # Create Swap file
    # The ???fallocate??? program can create swap files faster than ???dd???. As an added perk, its syntax is also easier to remember
    # NOTE:
    #	the swapfile/swap partition size is generally about 2x your pc/laptop's RAM - minimum 4GB as a rule of thumb
    sudo fallocate -l $swapfile_size /swapfile
    # Change permission of swapfile to read+write
    sudo chmod 600 /swapfile
    # Make swap file
    sudo mkswap /swapfile
    # Enable swap file to begin using it
    sudo swapon /swapfile
    #  The operating system needs to know that it is safe to use this file for swap every time it boots up
    echo "# /swapfile" | sudo tee -a /etc/fstab
    echo "/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab

    # Check if swap is activated
    swap_exists=`free -h | grep Swap`
    if [[ ! "$swap_exists" == "" ]]; then
        echo "Swap of size [$swapfile_size] successfully created."
    else
        echo "Error creating swap of size [$swapfile_size]."
    fi
}
setup_audio()
{
    : "
    Setup Audio using either pulseaudio or ALSA
    "
    # Audioinfo Keys:   
    # [audio-frameworks]
    # [audio-pkgs]
    # [audio-unmute]
    # [audio-mute]
    total_keys="${#audioinfo[@]}"

    # Get String values from associative array
    str_audio_frameworks="${audioinfo["audio-frameworks"]}"
    str_audio_pkgs="${audioinfo["audio-pkgs"]}"
    str_to_unmute="${audioinfo["audio-unmute"]}"
    str_to_mute="${audioinfo["audio-mute"]}"

    # Split strings into arrays 
    # If not empty
    if [[ ! "$str_audio_frameworks" == "" ]]; then
        # if not empty
        audio_frameworks=($(seperate_by_Delim $str_audio_frameworks ","))
    fi

    if [[ ! "$str_audio_pkgs" == "" ]]; then
        audio_pkgs=($(seperate_by_Delim $str_audio_pkgs ","))
    fi

    if [[ ! "$str_to_unmute" == "" ]]; then
        to_unmute=($(seperate_by_Delim $str_to_unmute ","))
    fi

    if [[ ! "$str_to_mute" == "" ]]; then
        to_mute=($(seperate_by_Delim $str_to_mute ","))
    fi

    # Internal Functions
    alsa_setup()
    {
        : "
        Setup Audio using ALSA
        "
        
        # Unmute 
        for v in "${to_unmute[@]}"; do
            curr_section=$v
            amixer sset $curr_section unmute
        done

        # Mute 
        for v in "${to_mute[@]}"; do
            curr_section=$v
            amixer sset $curr_section mute
        done
        echo "ALSA audio setup completed."
        echo "Please test it via"
        echo "speaker-test -c 2"
    }
    pulseaudio_setup()
    {
        : "
        Setup Audio using Pulseaudio
        "
        echo "Pulseaudio still a WIP, if audio is not working
        - Please try to fix it yourself, apologies!
        "

        echo "Pulseaudio audio setup completed."
    }

    # Check and install packages if not installed
    for p in "${audio_pkgs[@]}"; do
        # check if package is installed
        rc=`is_pkg_installed $p`

        # if package is not installed ( != "0" )
        if [[ ! "$rc" == "0" ]]; then
            # Return Code [0] : Found, else : Not Installed
            echo "Audio package [$p] does not exist, installing..."
            $install_Command $p

            # Verify installation
            rc=`is_pkg_installed $p`
            if [[ "$rc" == "0" ]]; then
                # If is installed
                echo "  $p is installed."
            else
                # Install failed
                echo "  $p installation failed."
            fi
        fi
    done

    # Setup audio
    if [[ `is_pkg_installed "alsa-utils"` == "0" ]]; then
        # ALSA is found and installed
        if [[ `is_pkg_installed "pulseaudio"` == "0" ]]; then
            # Both alsa-utils and pulseaudio are installed
            read -p "Both alsa-utils and pulseaudio are found, 
which would you like to setup?: {'(b)oth' | '(a)lsa' | '(p)ulseaudio' | Default: None (Leave empty)}" audio_conf

            case "$audio_conf" in
                "b" | "both")
                    # Both ALSA and Pulseaudio

                    # --- Pulseaudio
                    pulseaudio_setup
                    
                    # --- ALSA
                    alsa_setup
                    ;;
                "a" | "alsa-utils")
                    # Alsa-utils setup
                    alsa_setup
                    ;;
                "p" | "pulseaudio")
                    # Pulseaudio setup
                    pulseaudio_setup
                    ;;
                *)
                    # Setup None
                    echo "do refer to the following websites for setup"
                    echo "  ALSA : https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture"
                    echo "  Pulseaudio : "
                    ;;
            esac
        else
            # Only alsa-utils is found
            # Alsa setup
            alsa_setup
        fi
    else
        # ALSA is not found
        if [[ `is_pkg_installed "pulseaudio"` == "0" ]]; then
            # Pulseaudio is found
            # Pulseaudio setup
            pulseaudio_setup
        fi
    fi
}
setup_wm()
{
    : "
        Setup Window Manager
    "

    # Install Required Packages
    for p in "${required_pkgs[@]}"; do
        # Loop array and install if not installed
        if [[ `is_pkg_installed $p` == "1" ]]; then
            # 1 : Not Installed
            echo "$p does not exist, installing..."
            echo ""
            $install_Command "$p"
        fi
    done

    # Create Configs folder and files (if any)
    if [[ ! -d $wmde_home_config_fldr ]]; then
        # Create user config folder
        mkdir -p $wmde_home_config_fldr
    fi

    # Copy config default files (if any)
    if [[ -d $default_wmde_config_fldr ]]; then
        # if directory exists
        if [[ -f $default_wmde_config_fullpath ]]; then
            # if file exists
            # "$(cat /usr/share/doc/qtile/default_config.py)"
            echo "Copying | [$default_wmde_config_fullpath] => [$wmde_home_config_fullpath]..."
            echo -e "$(cat $default_wmde_config_fullpath)" | tee -a $wmde_home_config_fullpath
        fi
    fi
}

### Main functions ###
init()
{
	#
	# On Runtime initialization
	#	- When program initialized
	#
	echo "Program Name: $PROGRAM_NAME"
	echo "Running on  : $DISTRO"
}

body()
{
	#
	# Main function to run
	#
	argv=("$@")
	argc="${#argv[@]}"


	echo "========================================================"
	echo "             Custom Desktop Environment                 "
	echo "   Turning Window Managers into a Desktop Environment   "
	echo "========================================================"

	if [[ "$MODE" == "DEBUG" ]]; then
		echo "=============="
		echo " DEBUG NOTES: "
		echo "=============="
		echo "i. I am assuming that the user has created a user as per security design and protocol."
	fi

	echo ""

	echo "========================"
	echo "Pre-Req 1: Network Setup"
	echo "========================"
	res=`verify_network`
	if [[ ! "$res" == 0 ]]; then
		# Error
		sudo systemctl start NetworkManager
	fi

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=================================="
	echo "Pre-Req 2: Enable Sudo in sudoers "
	echo "=================================="
	enable_sudo

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "================================================"
	echo "Pre-Req 3:"
	echo " Security Protocol Design [1] : User Management "
	echo "================================================"
    user_mgmt

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "========================================="
	echo "Setup Stage 1: Create Dotfiles / Folders "
	echo "========================================="
	create_dotfiles

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "========================================="
	echo "Setup Stage 2: Install Relevant Packages "
	echo "========================================="
	pkg_install

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=============================="
	echo "Setup Stage 3: Setup Dotfiles "
	echo "=============================="
	setup_dotfiles

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=============================="
	echo "Setup Stage 4: Setup Swapfile "
	echo "=============================="
	setup_swapfiles

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "=============================="
	echo "Setup Stage 5: Setup Audio    "
	echo "=============================="
	setup_audio

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""

	echo "======================================="
	echo "Setup Stage 6: Setup Window Manager    "
	echo "======================================="
	setup_wm

    countdown 5

	if [[ "$MODE" == "DEBUG" ]]; then
		read -p "Paused."
	fi

	echo ""
    
	echo "======"
	echo " End  "
	echo "======"
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
#     if [[ ! "$(whoami)" == "root" ]]; then
#         echo -e "Please run this script from root user or with sudo priviledges\n\
# This is for the following features:\n\
#     i. Enabling sudoers (if you have not done so during the install process / did not use the install script)\n\
#     ii. Installing Packages\n\
#     iii. Installing AUR"
#     else
#         main "$@"
#     fi
    main "$@"
    END
fi