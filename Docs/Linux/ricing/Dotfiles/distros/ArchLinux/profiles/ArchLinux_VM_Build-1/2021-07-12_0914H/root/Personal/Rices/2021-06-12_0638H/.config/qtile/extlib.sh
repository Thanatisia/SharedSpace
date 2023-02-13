#
# Shell Library for Qtile
#

autostart()
{
    #
    # Autostart Programs
    #

    # --- Input
    
    # Local Variables

    # Arrays
    commands=(
	# Commands to execute
	"picom"						# Compositor
	"nitrogen --restore "				# Wallpaper Setter
	"conky -c $HOME/.config/conky/conky.conf"	# System Monitoring Tool
	"dunst"						# Notification Manager
	# Please add on from here
    )

    systemctl=(
	# System Controls
	"vboxservice.service"			# VBox Services
    )

    # --- Procesing

    # Execute commands in list [commands]
    for c in "${commands[@]}"; do
	echo "$(date +'%d-%m-%y %H/%M/%S') : Executed [$c]" | tee -a start-commands.log
	$c &
    done

    # Execute and start system controls in list [systemctl]
    #for s in "${systemctl[@]}"; do
#	echo "$(date +'%d-%m-%y %H/%M/%S') : Started [$s]" | tee -a start-sys-svc.log
#	sudo systemctl start $s
 #   done
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    autostart "$@"
fi
