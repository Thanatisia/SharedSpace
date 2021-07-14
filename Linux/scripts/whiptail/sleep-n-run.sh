#### Whptail ####
# Sleep and Run #
#################

progressbar()
{
	# === Personal Progress Bar === #
	# min=0
	# max=100
	# increment=20
	# ============================= #
	min=${1:0}
	max=${2:100}
	increment=${3:1}
	whiptail_title=${4:-"Default Title"}
	whiptail_Height=${5:-8}
	whiptail_Width=${6:-39}
	whiptail_progressbar_Text=${7:-"Loading..."}
	whiptail_progressbar_startindex=${8:-0}

	{
		# Check if is +1; change to i++
		if [[ $increment -eq 1 ]]; then
			for(( i=$min; i <= $max; i++)); do
				sleep 1s
				echo $i
			done
		else
			for(( i=$min; i <= $max; i+=$increment)); do
				sleep 1s
				echo $i
			done
		fi
	} | whiptail --title "$whiptail_title" --gauge "$whiptail_progressbar_Text" $whiptail_Height $whiptail_Width $whiptail_progressbar_startindex
} 

progressbar_run()
{
	# === Personal Progress Bar === #
	# min=0
	# max=100
	# increment=20
	# ============================= #
	min=${1:0}
	max=${2:100}
	increment=${3:1}
	whiptail_title=${4:-"Default Title"}
	whiptail_Height=${5:-8}
	whiptail_Width=${6:-39}
	whiptail_progressbar_Text=${7:-"Loading..."}
	whiptail_progressbar_startindex=${8:-0}

	{
		# Check if is +1; change to i++
		if [[ $increment -eq 1 ]]; then
			for(( i=$min; i <= $max; i++)); do
				sleep 1s
				echo $i
			done
		else
			for(( i=$min; i <= $max; i+=$increment)); do
				sleep 1s
				echo $i
			done
		fi
	} | whiptail --title "$whiptail_title" --gauge "$whiptail_progressbar_Text" $whiptail_Height $whiptail_Width $whiptail_progressbar_startindex
} 

# progressbar
progressbar_run