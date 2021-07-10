#
# Lemonbar statusbar Description File
# Author: ME
# Created: 2021-04-18 09:05H
# Modified:
#   2021-04-18 09:05H
#   2021-04-19 11:55H
#   2021-04-20 10:40H
#	2021-05-18 15:09H
# Features: 
# Background Information: 
# Changelog:
#   2021-04-18 0905H : Previously named 'lemonbar.sh'
#   2021-04-19 1155H : Added afew lemonbar configs
#   2021-04-20 1040H : Created 'colors' Associative Array/Dictionary/Hashmap
#	2021-05-18 1509H : added 'declare -A' to associative array "colors" to fix colour error
#

# Import Libraries

# Functions

# Variables
declare -A colors=(
    [white]="#FFFFFF"
    [grey]="#2D2D2D"
    [red]="#FF2222"
    [black]="#000000"
    [transparent]="#ABCD"
)

# ---Info
# Grey: BAR_BACKGROUND="#2D2D2D"
# Black: lemonbar_color_FG="#FFFFFFFF"
# Red: lemonbar_color_BG="#FF222222"
# -------

# General Variables
BAR_RUNNER_PATH=$(dirname "${BASH_SOURCE[0]}")
BAR_RUNNER_NAME=lemonbar_Run.sh
BAR_BACKGROUND="${colors["transparent"]}"

# Program Variables
#--- Lemonbar
lemonbar_Fonts="Hack"
lemonbar_color_FG="${colors["black"]}"
lemonbar_color_BG="${colors["transparent"]}"


# if __name__ == "__main__":
if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    # Debug
    echo "Values: ${colors["transparent"]}"
fi

