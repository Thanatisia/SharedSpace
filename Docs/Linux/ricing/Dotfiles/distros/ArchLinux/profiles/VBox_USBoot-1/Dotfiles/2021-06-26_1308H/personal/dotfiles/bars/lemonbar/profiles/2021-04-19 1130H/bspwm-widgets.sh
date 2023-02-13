#
# BSPWM-specific widgets module/library file for Lemonbar
#   - Identifier: Requires 'bspc'
# Author: Asura
# Created: 2021-04-19 10:16H
# Modified: 
#   2021-04-19 10:16H
# Features: 
# Background Information: 
# Changelog:
#

# Import external libraries
. lemonbar_Desc.sh

function Workspaces()
{
    # Get all desktop windows
    desktops=$(bspc query -D --names)

    # Get currently focused desktop
    focused=$(bspc query -D --names -d focused)

    # Loop through all desktops
    for desktop in $desktops; do
        # Check current laptop nodes
        desktop=$(echo "$desktop")

        # Get all nodes
        nodes=$(bspc query -N -d $desktop)

        # If there are nodes (aka Windows) open; display Red colour
        if [ ! -z "$nodes" ]; then
            desktops=$(echo $desktops | sed "s/$desktop/%{F#ff0000}$desktop%{F-}/")
        fi
    done

    # Underline currently selected/focused desktop
    desktops=$(echo $desktops | sed "s/$focused/%{B$background}%{+u}_$focused\_%{-u}%{B-}/")
    echo $desktops | sed "s/_/ /g"
}

function main()
{
    echo "starting debug..."
}

if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    main "$@"
fi

# line=""
# read -p "Pause" line


