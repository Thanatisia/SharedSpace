#
# Utility to install an AUR manager of your choice
#   - yay
#   - yaourt
# Author: Asura
# Created: 2021-04-22 21:05H
# Modified: 
#   2021-04-22 2105H : Asura
# Features: 
# Background Information: 
#   Installs an AUR manager according to user's choice 
#       - yay
#       - yaourt etc.
# Changelog:
#   2021-04-22 2105H : Created file
#

function main()
{
    #
    # ::Params
    #   aur_mgr
    #       Type: String
    #       Desc: Contains the type of AUR Manager you want to use
    #       Accepted Inputs: 'yay', 'yaourt'
    #

    #
    # Input
    #
    # --- Get Command Line Variables
    aur_mgr="$1"
    # Local Variables
    aur_Name=""
    aur_URL="https://aur.archlinux.org/yay.git"
    git_path=~/Desktop/git
    
    #
    # Processing
    #

    # --- Validation: Folder exists
    if [ ! -d $git_path ]; then
        # Folder does not exist
        mkdir -p $git_path &&\
            # Success
            echo "$git_path has been created." ||\
            # Error
            echo "$git_path failed to create."
    fi

    # --- Installation
    case "$aur_mgr" in 
        "yay")
            aur_Name="yay"
            cd $git_path
            git clone $aur_URL
            cd yay
            makepkg -si
            ;;
        *) 
            echo "Invalid package manager"
            echo "Please parse in the following parameters for the package manager:"
            echo "      'yay' : yay package manager"
            echo "      'yaourt' : yaourt package manager"
            ;;
    esac

    #
    # Output
    #
    
    if [ ! "$aur_Name" == "" ]; then
        # No Empty value
        git_path=$git_path/$aur_Name

        # --- Sanitization & Cleaning Up
        # Check if user wants to keep the folder
        read -p "Would you like to keep the aur manager repo? [Y|N] (Default = Yes | Y): " conf
        case "$conf" in 
            "N")
                # No, delete
                sudo rm -r $git_path &&\
                    # Success
                    echo "Folder [$git_path] has been deleted." ||\
                    # Error
                    echo "Error deleting [$git_path]"
                ;;
            *) 
                # Anything else = Yes
                echo "The repo will be kept."
                ;;
        esac
    fi
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    echo "[START]"

    main "$@"

    line=""
    read -p "[END]" line
fi

