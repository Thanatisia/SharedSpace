#
# Git shared Library
# Author: Asura
# Created: 2021-04-21 14:56H
# Modified: 
#   2021-04-21 1456H
# Features: 
# Background Information: 
#   A git library that contains multiple git functions
# Changelog:
#   2021-04-21 1456H : Created source file
#

function git_clone()
{
    #
    # git clone and log output to file
    # ::Params
    #   
    # ::Usage:
    #   git clone --recurse-submodules http://github.com/wxWidgets/wxWidgets.git |& tee -a ~/.logs/git-clone-process.log &&\
    #       echo "http://github.com/wxWidgets/wxWidgets.git" | tee -a ~/.logs/git-clone-package.log ||\
    #       echo "http://github.com/wxWidgets/wxWidgets.git" | tee -a ~/.logs/git-clone-failed.log"
    #
    git_URL="$1"
    git_Options="$2"
    
    # Preparation
    echo $(date +"%a, %d/%m/%y %H:%M:%S") | tee -a ~/.logs/git-clone-package.log ~/.logs/git-clone-process.log ~/.logs/git-clone-failed.log

    # Validation: Empty Variable
    if [ ! "$git_URL" == "" ]; then
        git clone $git_Options $git_URL |& tee -a ~/.logs/git-clone-process.log &&\
            echo "$git_URL" | tee -a ~/.logs/git-clone-package.log ||\
            echo "$git_URL" | tee -a ~/.logs/git-clone-failed.log
    else
        echo "No url provided."
    fi
}

function main()
{
    # Debugging
    echo "Error: $LINENO"
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"

    line=""
    read -p "Pause" line
fi
