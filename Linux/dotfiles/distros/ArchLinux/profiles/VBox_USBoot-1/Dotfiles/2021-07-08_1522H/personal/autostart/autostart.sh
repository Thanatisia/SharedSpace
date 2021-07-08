#
# Autostart script
# Author: Asura
# Created: 2021-05-08 1005H
# Modified: 
#   2021-05-08 1005H
# Features: 
# Background Information: 
#   Autostarter script to run when window manager starts
# Changelog:
#   2021-05-08 1005H : Created script
#

# --- Variables
PROGRAM_NAME="autostart"

function main()
{
    autostart_func=(
        "picom"
    )
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

