# Switch XOrg

# Default Variables
declare -A sessions=(
	[1]="bspwm"
	[2]="herbstluftwm"
	[3]="qtile"
)
default_Session="${sessions["3"]}"
session=${1:-$default_Session} # Default: bspwm
case $session in
	# Window Managers
	i3 | i3wm )	
		exec i3
		;;
	bspwm )
		exec bspwm
		;;
	herbstluftwm )
		exec herbstluftwm
		;;
	qtile )
		exec qtile
		;;
	# Desktop Environment
	kde )
		exec startplasma-x11
		;;
	xfce | xfce4 )
		exec startxfce4
		;;
	# No known session, try to run it as command
	* )
		# exec $1
		exec $session
		;;
esac


