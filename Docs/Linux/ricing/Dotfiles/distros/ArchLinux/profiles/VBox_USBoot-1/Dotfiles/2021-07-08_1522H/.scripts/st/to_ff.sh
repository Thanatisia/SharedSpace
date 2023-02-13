#
# Image to Suckless' ff format
# Author: Asura
# Created: 2021-05-14 2253H, Asura
# Modified: 
#	2021-05-14 2253H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-14 2253H, Asura:
#		- Created source file
#

# --- Variables
PROGRAM_NAME="Image to farbfeld"
PROGRAM_TYPE="Main"

get_ext()
{
	#
	# Get extension from file
	#
	# --- Input

	# Command Line Variables
	src="$1"
	ext=""

	# Local Variables
	filename="$(basename -- "$src")"

	# --- Processing
	ext="${filename##*.}"
	filename="${filename%.*}"

	# --- Output
	echo "$ext"
}
function main()
{
	# --- Input
	# Command Line Variables
	IMAGE_SRC="$1"
	OUTPUT="$2"
	
	# Local Variables
	IMAGE_EXT="$(get_ext "$IMAGE_SRC")"
	
	# --- Processing
	# cat wallpaper.jpg | jpg2ff | ff-border e 50 | ff-bright rgba 0 0.5 1 | ff-blur 50 15 > st_wallpaper.ff
	
	if [[ "$OUTPUT" == "" ]]; then
		OUTPUT="st_wallpaper.ff"
	fi

	# ff_other_Options="./ff-border e 50" | "./ff-bright rgba 0 0.5 1" | "./ff-blur 50 15"
	# ff_other_Options=""
	ff_other_Options="ff-border e 50" | "ff-bright rgba 0 0.5 1" | "ff-blur 50 15"
	prog_to_use=""

	# Switch Case extension
	case "$IMAGE_EXT" in
		"jpg")
			# If file is jpeg
			prog_to_use=jpg2ff
			;;
		"png")
			# If file is png
			prog_to_use=png2ff
			;;
		*)
			echo "Invalid extension"
			;;
	esac

	# --- Output
	echo "Input Source File: $IMAGE_SRC"
	echo "File Extension   : $IMAGE_EXT"
	echo "Filter Program   : $prog_to_use"
	echo "Farbfeld Filters : $ff_other_Options"
	echo "Output File      : $OUTPUT"

	#if [[ ! "$ff_other_Options" == "" ]]; then
	#	cat $IMAGE_SRC | $prog_to_use | $ff_other_Options > "$OUTPUT"
	#else
	#	cat $IMAGE_SRC | $prog_to_use > "$OUTPUT"
	#fi
	cat $IMAGE_SRC | $prog_to_use | ff-border e 50 | ff-bright rgba 0 0.5 1 | ff-blur 50 15 > "$OUTPUT"
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

