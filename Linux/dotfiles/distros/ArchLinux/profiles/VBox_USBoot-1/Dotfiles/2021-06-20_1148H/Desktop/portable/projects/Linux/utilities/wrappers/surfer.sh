#
# Wrapper for browser - surf
# Author: Asura
# Created: 2021-05-10 0930H
# Modified: 
#	2021-05-10 0930H, Asura
# Features: 
# Background Information: 
# Changelog:
#	2021-05-10 0930H, Asura : Created script
#

# --- Variables
PROGRAM_NAME="Surfer"

function remove_last_character()
{
	# --- Command Line Input
	var="$1"
	to_remove="$2"
	
	# --- Local Variable
	res=""

	res="${var%$to_remove}"
	echo "$res"
}

function main()
{
	sites=(
		"google.com"
		"github.com"
		"repl.it"
		"outlook.com"
		"facebook.com"
		"twitter.com"
		"lazada.com"
		"shopee.sg"
		"wiki.archlinux.org"
	)
	all_sites=""
	for site in "${!sites[@]}"; do
		# Concenate \n
		all_sites+="${sites[$site]}\n"
		# echo "Curent Site: $curr_site"
	done

	# Sanitize options
	# all_sites="${all_sites%\n}"
	all_sites="$(remove_last_character "$all_sites" "\\\n")"

	# DEBUG: echo $all_sites

	url="$(echo -e "$all_sites" | dmenu -c -l 10)"

	ret_token="$?"

	# Validation: NULL Value Check
	if [[ ! "$ret_token" == "1" ]]; then
		# Success
		curr_dt=$(date +'%y/%m/%d %H:%M:%S') 
		echo "$curr_dt : $url" | tee -a ~/.logs/surf.log ~/.logs/surf-last-visited.log
		surf "$url" |& tee -a ~/.logs/surf.log
	fi
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
    # END
fi

