#
# Dmenu - Tutorial & Guides index page script
# Author: Asura
# Created: 2021-05-09 0830H, Asura
# Modified: 
#   2021-05-09 0830H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-05-09 0830H, Asura : Created project
#

# --- Variables
PROGRAM_NAME="Tutorial & Guides: Index"

dmenu_Designer()
{
    #
    # Design Dmenu
    #

    # Edit Options
    options=(
        "./Terminal/receiving_pipe.sh\n"
    )
    echo "${options[@]}"
}

dmenu_Exe()
{
    # 
    # Dmenu runner function
    #
    
    # Input
    # --- Variables
    src=("$1")
    src_String=""
    dmenu_Options="-c -l 10"

    # Processing
    # --- Body
    for opt in "${src[@]}"; do
        src_String+="$opt"
    done

    # Output
    # --- Footer
    res="$(echo -e $src_String | dmenu $dmenu_Options)"
    echo $res
}

function main()
{
    options=("$(dmenu_Designer)")
    # DEBUG: echo "Options: ${options[@]}"
    ret="$(dmenu_Exe "${options[@]}")"
    echo "Selected: $ret"

    # Execute selected program
    if [[ ! "$ret" == "" ]]; then
        "$ret" &&
            echo "Program [$ret] executed." ||
                echo "Error executing program [$ret]"
    fi

    # ALT: Switch Case selection
    
}

function START()
{
    echo "Program Name: $PROGRAM_NAME"
}

function END()
{
    line=""
    read -p "Exiting $PROGRAM_NAME..." line
}


if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    START
    main "$@"
    END
fi

