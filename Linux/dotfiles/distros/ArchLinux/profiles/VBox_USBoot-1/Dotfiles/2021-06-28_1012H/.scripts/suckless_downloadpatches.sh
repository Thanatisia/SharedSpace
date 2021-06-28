#
# Dmenu patch downloader
# Author: Asura
# Created: 2021-05-09 0023H, Asura
# Modified: 
#	2021-05-09 0023H, Asura
#	2021-05-14 2055H, Asura
# Features: 
# Background Information: 
#	A Patch/File Downloader 
#		- Started with Suckless program patch files in mind
# Changelog:
#	2021-05-09 0023H, Asura : 
#		1. Created Script
#	2021-05-14 2055H, Asura :
#		2. Added patches for st
#

# --- Variables
PROGRAM_NAME="NIL"

# --- Functions
# General Functions

# Suckless Functions
function downloads()
{
	local -n patch=$1
	local -n links=$2

    #patch=(
    #    "blur-pixelated-screen"
    #    "message"
    #    "unlock-screen"
	#	"Xresources"
    #)
    #links=(
    #    "https://tools.suckless.org/slock/patches/blur-pixelated-screen/slock-blur_pixelated_screen-1.4.diff"
    #    "https://tools.suckless.org/slock/patches/message/slock-message-20191002-b46028b.diff"
    #    "https://tools.suckless.org/slock/patches/unlock_screen/slock-unlock_screen-1.4.diff"
   	#	"https://tools.suckless.org/slock/patches/xresources/slock-xresources-20191126-53e56c7.diff" 
	#)

    # Get user input
    echo "Leave empty to download all"
    for l in "${!links[@]}"; do
        echo "[$l] ${patch[$l]} : ${links[$l]}"
    done

    read -p "Download which patch?: " patch_number
    if [[ "$patch_number" == "" ]]; then
        # Empty - download all
        for l in "${!links[@]}"; do
            # Download 
            curr_Patch="${patch[$l]}"
            curr_Link="${links[$l]}"
            echo "Downloading $curr_Patch..."
            wget $curr_Link && 
                echo "$curr_Patch downloaded." ||
                    echo "Error downloading $curr_Patch"
        done
    else
        selected_Patch="${patch[$patch_number]}"
        selected_Link="${links[$patch_number]}"
        echo "Downloading $selected_Patch..."
        wget $selected_Link && 
            echo "$selected_Patch downloaded." ||
                echo "Error downloading $selected_Patch"       
    fi
}


dmenu_Patches()
{
    patch=(
        "gruvbox"
        "center"
        "center_with_c"
    )
    links=(
        "https://tools.suckless.org/dmenu/patches/gruvbox/dmenu-gruvbox-20210329-9ae8ea5.diff"
        "https://tools.suckless.org/dmenu/patches/center/dmenu-center-4.8.diff"
        "https://tools.suckless.org/dmenu/patches/center/dmenu-center-20200111-8cd37e1.diff"
    )
	downloads "$patch" "$links"
}

slock_Patches()
{
    patch=(
        "blur-pixelated-screen"
        "message"
        "unlock-screen"
		"Xresources"
    )
    links=(
        "https://tools.suckless.org/slock/patches/blur-pixelated-screen/slock-blur_pixelated_screen-1.4.diff"
        "https://tools.suckless.org/slock/patches/message/slock-message-20191002-b46028b.diff"
        "https://tools.suckless.org/slock/patches/unlock_screen/slock-unlock_screen-1.4.diff"
   		"https://tools.suckless.org/slock/patches/xresources/slock-xresources-20191126-53e56c7.diff" 
	)
	downloads "$patch" "$links"
}

st_Patches()
{
    patch=(
		"gruvbox-material"
		"background-image"
    )
    links=(
		"https://st.suckless.org/patches/gruvbox-material/st-gruvbox-material-0.8.2.diff"
		"https://st.suckless.org/patches/background_image/st-background-image-0.8.4.diff"
	)
	downloads "$patch" "$links"
}


# Main Functions
function main()
{
	# Get Suckless package type
	read -p "Suckless Package Name {Dmenu | Slock | St}: " suckless_Name

	case "$suckless_Name" in
		"Dmenu")
			dmenu_Patches
			;;
		"Slock")
			slock_Patches
			;;
		"St")
			st_Patches
			;;
		*)
			echo "Invalid Program"
			;;
	esac
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

