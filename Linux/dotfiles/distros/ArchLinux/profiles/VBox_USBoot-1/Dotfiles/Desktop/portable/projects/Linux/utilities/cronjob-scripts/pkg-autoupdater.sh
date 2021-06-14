#
# Package Manager Autoupdater
# Author: ME 
# Created: 2021-04-13 1107H
# Modified: 2021-04-13 1107H
# Features: 
# Background Information: 
#

function get_date_Formatted()
{
        #
        # ::Params
        #       $1 :    Variable: format
        #               Desc: This contains the format of the date you wish to receive
        #               Examples: 
        #                       "%d"
        #                       "%d-%M-%Y"
        #
        format="$1"
        curr=$(date +$format)
        echo "$curr"
}

function get_current_Date()
{
        # curr_dt=$(date +"%d")
        curr_dt=$(get_date_Formatted "%d")
        echo "$curr_dt"
}

function updater()
{
        package_Mgr="pacman"
        echo "Beginning package update and upgrade..."
        case "$package_Mgr" in
                "pacman")
                        echo "y" | sudo pacman -Syu ||
                                echo "yes" | sudo pacman -Syu
                        # break
                        ;;
                *) 
                        echo "Invalid package manager: [$package_Mgr]"
                        ;;
        esac
        echo "package update and upgrade ended..."
}                       

# function autoupdater()
function autotimer()
{
        counter=0
        timer_Max=True
        while [ $timer_Max ]; do
                prev_Date="$(get_current_Date)"
                sleep 10
                current_Date="$(get_current_Date)"
                echo "$counter:"
                echo "  Previous Date: $prev_Date"
                echo "  Current Date: $current_Date"
                echo ""
                if [ $current_Date == $((prev_Date + 1)) ]; then
                        autoupdater
                fi
                counter=$((counter+1))
        done
}

# Run autoupdater in background
autotimer

line=""
read -p "Pause" line

