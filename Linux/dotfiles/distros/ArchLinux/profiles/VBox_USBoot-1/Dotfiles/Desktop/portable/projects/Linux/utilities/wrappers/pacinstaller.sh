#
# Wrapper - Package Installer for pacman (pacman -S)
# Author: Asura
# Created: 2021-04-19 08:17H
# Modified: 
#   2021-04-19 08:17H
#   2021-04-21 13:39H
# Features: 
#   - Install package via pacinstall
#   - Check if [pacinstaller] exist
#       - If does not exist: Create (mkdir -p)
#   - Write package name to log file 'pacinstaller/pacinstaller-installed.log'
#   - Write install log to log file 'pacinstaller/pacinstaller-changelog.log'
#   
# Background Information: 
# Changelog:
#   2021-04-19 08:17H, File created
#   2021-04-21 13:39H, Fix output issue
#

function check_Package()
{
	#
	# Check if packages exist in repo
	# References:
	#	https://bbs.archlinux.org/viewtopic.php?id=191442
	# Search: 
	#	ArchLinux pacman how to check if package exists in list : https://www.google.com/search?client=firefox-b-d&q=ArchLinux+pacman+how+to+check+if+package+exists+in+list
	#

	# --- Input
	# Command Line Variables
    src="$1"
	ret_code="1"
	# Local Variables
    
	# --- Processing
	# res="$(echo "$(pacman -Ss | grep $src | cut -d '/' -f2)" | cut -d ' ' -f1)"
    # sudo pacman -S $src | grep 'target not found'
	# ret_code="$?"
    # echo $ret_code
	res="$(pacman -Ss ^$src$)"

	# Check empty value
	if [[ "$res" == "" ]]; then
		# Empty; Package not in repo
		ret_code="0"		
	fi

	# --- Output
	echo "$ret_code"
}

function check_folders()
{
    #
    # Check if folders exist
    #   - If does not exist: Create (mkdir -p)
    #

    # fldrs=(
    #     ~/.logs/pacinstaller
    # )
    # Usage: check_folders ${fldrs[@]}
    #

    fldrs=$1

    # Check folder
    for fldr in ${fldrs[@]}; do
        if [ ! -d $fldr ]; then
            echo "Folder [$fldr] doesnt exist, creating..."
            mkdir -p $fldr &&\
                # Verify/Validate
                if [ -d $fldr ]; then
                    echo "  - Folder [$fldr] created"
                fi ||\
                echo "  - Error creating folder [$fldr]"
        fi
    done
}

function main()
{
    #
    # Input
    #

    # Get command line variables
    src="$1"

    # Local Variables
    pacinstall_installed=~/.logs/pacinstaller/pacinstaller-installed.log
    pacinstall_changelogs=~/.logs/pacinstaller/pacinstaller-changelog.log
    pacinstall_install_Failed=~/.logs/pacinstaller/pacinstaller-failed.log
    fldrs=(
        ~/.logs/pacinstaller
    )

    #
    # Processing
    #

    # Step 1: Check if folders exist
    check_folders ${fldrs[@]}
    
    # Step 2: Append headers
    START_DT=$(date +"%y/%m/%d %H:%M:%S")
    echo $START_DT | tee -a $pacinstall_changelogs
    # echo $(date +"%y/%m/%d %H:%M:%S") | tee -a $pacinstall_installed $pacinstall_changelogs $pacinstall_install_Failed

    # Step 3: Check if package is the same as output
    # echo "$(echo "$(pacman -Ss | grep jetbrains | cut -d '/' -f2)" | cut -d ' ' -f1)"
    # res="$(echo "$(pacman -Ss | grep $src | cut -d '/' -f2)" | cut -d ' ' -f1)"
    res="$(check_Package $src)"
    # echo "Result: $res"

    if [[ "$res" == "1" ]]; then
        # 'target not found' not found, valid
        echo "Package is valid, installing..."

        # Step 4: Run pacman & log outputs
        sudo pacman -S $src |& tee -a $pacinstall_changelogs
        ret_code="$?"
        
        if [ "$ret_code" == "0" ]; then
            # Successful
            echo "$START_DT : $src" | tee -a $pacinstall_installed
        else
            # Error
            if [ "$src" == " " ]; then
                # If target package is empty - no source
                echo "N/A" | tee -a $pacinstall_installed &&\
                    echo "$START_DT : No source provided." | tee -a $pacinstall_install_Failed
            else
                # If target package is not empty - Failed
                echo "Failed" | tee -a $pacinstall_installed &&\
                    # Failed source
                    echo "$START_DT : $src" | tee -a $pacinstall_install_Failed
            fi
        fi
    else
        echo "$START_DT : $src;Invalid package or Installation cancelled."| tee -a $pacinstall_install_Failed
    fi

    #
    # Output
    #
}

END()
{
    line=""
    read -p "Pause" line
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"
    END
fi

