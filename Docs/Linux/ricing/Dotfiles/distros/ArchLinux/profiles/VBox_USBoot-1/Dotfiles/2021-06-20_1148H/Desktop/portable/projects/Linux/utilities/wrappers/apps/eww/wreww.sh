#
# Wrapper for "Eww"
# Author: Asura
# Created: 2021-04-29 13:38H
# Modified by: 
#   2021-04-29 13:38H, Asura
# Features: 
# Background Information: 
# Changelog:
#   2021-04-29 13:38H, Asura : Created source file
#

# --- Variables
PROGRAM_NAME="eww-wrapper"

# --- Base Commands
eww_GETALLWINDOWS="$(eww windows)"

# --- Derivative Commands
eww_PRINTALLWINDOWS="echo $eww_GETALLWINDOWS"
eww_OPENWINDOW="eww open"
eww_OPENALLWINDOWS="eww open $eww_GETALLWINDOWS"
eww_CLOSEALLWINDOWS="eww close-all"
eww_CLOSE="eww close"
eww_HELP="eww --help"
eww_VERS="eww --version"

# --- Functions
function main()
{
    #
    # ::Params
    #   OPT
    #       Type: String
    #       Desc: Option to choose
    #       Default: None
    #   WIDGET_NAME
    #       Type: String
    #       Desc: The name of the widget you wanna work with
    #       Default: None
    #
    # Accepted Options:
    #   --print : Prints all windows
    #   --open : Opens stated window
    #       Default: open all widgets
    #   --close : Closes stated window
    #       Default: close all widgets
    #   --cmds : Show all commands
    #

    OPT="$1"
    WIDGET_NAME="$2"

    cmds=(
        "--print" 
        "--open" 
        "--close" 
        "--cmds" 
        "--help" 
        "--vers"
    )

    cmd_Help=(
        "   Print all widgets recognized in the config file"
        "   Opens the stated widget name; Open all widgets if no parameters are given"
        "   Close the stated widget name; Closes all widgets without turning off daemon if no parameters are given"
        "   Displays all commands for the wrapper."
        "   Prints the help output"
        "   Prints the version"
    )

    case "$OPT" in
        "--open")
            if [ "$WIDGET_NAME" == "" ]; then
                $eww_OPENALLWINDOWS
            else
                $eww_OPENWINDOW "$WIDGET_NAME" 
            fi
            ;;
        "--close")
            if [ "$WIDGET_NAME" == "" ]; then
                $eww_CLOSEALLWINDOWS
            else
                $eww_CLOSE "$WIDGET_NAME"
            fi
            ;;
        "--print")
            echo "[Print]"
            $eww_PRINTALLWINDOWS
            ;;
        "--cmds")
            echo "[Commands]"
            for i in "${!cmds[@]}"; do
                echo "  ${cmds[$i]}"
                echo "      ${cmd_Help[$i]}"
            done
            ;;
        "--help")
            echo "[Help]"
            $eww_HELP
            ;;
        "--vers")
            echo "[Version]"
            $eww_VERS
            ;;
        *)
            # Default
            for i in "${!cmds[@]}"; do
                echo "  ${cmds[$i]}"
                echo "      ${cmd_Help[$i]}"
            done
            ;;
    esac
}

function START()
{
    declare -A prog_Details=(
        [name]="eww-wrapper"
        [created]="2021-04-29 1800H"
        [modified]=("2021-05-02 2308H")
    )

    #for details in "${prog_Details[@]}"; do
    #    KEY=${details%%:*}
    #    VALUE=${details##*:}
    #    echo "$KEY : $VALUE"
    #done
    echo "Name    : ${prog_Details["name"]}"
    echo "Created : ${prog_Details["created"]}"
    echo "Modified: ${prog_Details["modified"]}"
    echo ""
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

