# ========================================= #
#                Autocurl                   #
# An autocurler for repositories with       #
# nested-root links/urls and you want to    #
# allow for easy curl/downloading           #
# ========================================= #

### Functions ###
seperate_by_Delim()
{
	#
	# Seperate a string into an array by the delimiter
	#

	# --- Input
	
	# Command Line Argument
	str="$1"			# String to be seperated
	delim="${2:-';'}"	# Delimiter to split

	# Local Variables

	# Array
	content=()			# Array container to store results
	char=''				# Single character for splitting element of a string

	# Associative Array

	# --- Processing
	# Split string into individual characters
	IFS=$delim read -r -a content <<< "$str"
	
	# --- Output
	echo "${content[@]}"
}

### Variables ###
declare -A links=(
    ### Place your Filename and URLs here ###
    # [Syntax]
    #   [<filename>]="<url/links>"
    [installer-ux.min.sh]="https://raw.githubusercontent.com/Thanatisia/SharedSpace/main/Linux/dotfiles/distros/ArchLinux/profiles/VBox_USBoot-1/install-scripts/installer-ux.min.sh"
    [customDE-REMAKE.sh]="https://raw.githubusercontent.com/Thanatisia/SharedSpace/main/Linux/dotfiles/window_manager_Profiles/Profiles/Asura-1/install-scripts/customDE-REMAKE.sh"
)

### Body ###
init()
{
    echo "=== Initialization ==="
}

setup()
{
    echo "=== Setting Up ==="
}

end()
{
    echo "=== Packing Up ==="
    exit_msg="Press anything to exit."
    read -p "$exit_msg" exit_Conf
    exit
}

main()
{
    echo -e "Links: "
    for l in "${!links[@]}"; do
        # Key : $l
        # Values : ${links[$l]}
        echo -e "[$l] : [${links[$l]}]"
    done

    msg="Please select the repositories\n \
- Please type the filename(s), not the url \
- Please seperate each subvalue with ',' delimited \
i.e. : file1,file2..."
    echo -e "$msg"
    
    # Get files in string
    read -p "> " sel_files

    # Seperate string into array with delimiter ','
    arr_files=($(seperate_by_Delim "$sel_files" ','))

    # Download URLs
    for filename in "${arr_files[@]}"; do
        url="${links[$filename]}"
        echo "Downloading [$filename] --> [$url]..."
        curl -L -O "$url"
    done
}

### equivalent to 'if __name__" == "__main__":'
if [[ "${BASH_SOURCE[@]}" == "${0}" ]]; then
    init
    setup
    main
    end
fi