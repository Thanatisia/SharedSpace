#
# ~/.bash_profile
#

# Start Terminal and manually login
# [[ -f ~/.bashrc ]] && . ~/.bashrc

# [Variables]
# Arrays
systemctl=(
	"NetworkManager"
	"vboxservice.service"
)

# [Body]
# Login on terminal and automatically 
#	activate system controls
# AND
# 	startx
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	# Login sudo for systemctl
	echo "1. Activating System Controls, Please authenticate sudo..."
	for s in "${systemctl[@]}"; do
		sudo systemctl start "$s"
	done

	echo ""

	# Take in user input for [Session]
	echo "2. Session Information (Window Manager / Desktop Environment): "
	read -p "> Session: " session

	# If there are no displays AND 
	# on tty1 (Remove [[ $(tty) = /dev/tty1) ]] to use all
	exec startx ~/.xinitrc $session
fi

