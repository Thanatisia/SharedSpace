# -- Functions

function set_X()
{
        #
        # Set XOrg Structure
        #
	# xrdb ~/.Xresources |& tee -a ~/.logs/xresources.log &
        xrdb ~/.Xresources |& tee -a $HOME/.logs/xresources.log
}

function set_wallpaper_Terminal()
{
        #
        # Set wallpaper and Terminals
        #
        
        # Variables
        WALLPAPER_PATH=$HOME/personal/autostart
        WALLPAPER_NAME=wallpaper.jpg
        WALLPAPER_UTILITY=feh
        WALLPAPER_DEFAULT_MODE=--bg-fill

        # Set wallpaper
	# ~/.fehbg &
	$WALLPAPER_UTILITY $WALLPAPER_DEFAULT_MODE $WALLPAPER_PATH/$WALLPAPER_NAME |& tee -a ~/.logs/autostart-set_wallpaper.log
        
        # Set Terminal Colour
        # python3 -m pywal -R |& tee -a ~/.logs/autostart-set_term_Colour.log
	PYWAL_CACHE_DIR="$HOME/.cache/wal"
        #if [ -d $PYWAL_CACHE_DIR ]; then
        #        # If cache file exists
        #        # Delete pywal cache file
        #        rm -r $PYWAL_CACHE_DIR 
        #fi
        # Delete all cached colorschemes
        python3 -m pywal -c
        # Set current wallpaper colorscheme
        python3 -m pywal -i $WALLPAPER_PATH/$WALLPAPER_NAME
        # urxvt |& tee -a ~/.logs/urxvt.log &
}

function set_Bar()
{
    #
    # Set the Bar (Polybar, LemonBar etc)
    #
    # Original: $HOME/.config/bspwm/bars
    BAR_PATH=$HOME/personal/dotfiles/bars
    BAR_RUNNER=bar
    LOG_FILE=$HOME/.logs/xinitrc_Settings.log

    # Prepare log files
    echo "#--- $(date +"%d/%m/%y %H:%M:%S")" | tee -a $LOG_FILE

    # Start
    $BAR_PATH/$BAR_RUNNER |& tee -a $LOG_FILE &
	# panel | tee -a ~/.logs/panel.log &
	# panel_bar | tee -a ~/.logs/panel_bar.log &
}

function set_Screenlocker()
{
	#
	# Screenlocker & Autolockers
	#
	timeout_min=1
	screenlocker="slock"
	other_options=-detectsleep
	xautolock -time $timeout_min $other_options -locker "$screenlocker" # Screen Locker and Autolockers 
}

function set_autostarters()
{
	# 
	# To Start
	#
	
	# Variables
	root_cursor_Icon=left_ptr
	
	#--- Settings & Keybinding programs
	
	# Set xclickroot
	xclickroot -l urxvt &
	xclickroot -r xmenu.sh &

	# Set root design (mouse icon etc.)
	xsetroot -cursor_name $root_cursor_Icon &

	# Applications
	conky -c ~/.config/conky/conky-TODOList.conf &   # ToDo List etc.
	conky -c ~/.config/conky/conky-middle_right.conf & 	# System Monitoring
	conky -c ~/.config/conky/conky-keybindings.conf &	# To display keybindings
	$HOME/.scripts/screenlocker.sh	&					# Screenlocking
	dunst -conf ~/.config/dunst/dunstrc &				# Notification-Daemon lightweight replacement
}

function get_starting_Information()
{
	#
	# Get Environment and System Variables
	# Such as Date, Time
	# of when the GUI first starts up (startx)
	#
	
	# --- Date Time
	export STARTUP_DATE="$(date +'%d-%m-%y')"
	export STARTUP_DAY="$(date +'%h')"
	export STARTUP_TIME="$(date +'%H:%M:%S')"
	export LAST_CHECKED_DATE="$STARTUP_DATE"
	export LAST_CHECKED_DAY="$STARTUP_DAY"
	export LAST_CHECKED_TIME="$STARTUP_TIME"
	export LAST_CHECKED_DATE_numberOnly="$(date +'%d')"
	export LAST_CHECKED_MONTH_numberOnly="$(date +'%m')"
	export LAST_CHECKED_YEAR_numberOnly="$(date +'%y')"

	# --- Environment Variables
	export TERMINAL="urxvt"

	# --- Path Variables
	export trash=~/.local/share/Trash
}

function autostart()
{
	#--- Check updates
	sudo pacman -Sy |& tee -a ~/.logs/autostart-updates.log

    #--- Setting & Initialization
	get_starting_Information
    set_wallpaper_Terminal
    set_X
    set_Bar
	set_autostarters

	#--- Autostart programs
}

# Startup 
autostart 

# Switch XOrg
session=${1:-bspwm} # Default: bspwm
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
	# Desktop Environment
	kde )
		exec startplasma-x11
		;;
	xfce | xfce4 )
		exec startxfce4
		;;
	# No known session, try to run it as command
	* )
		exec $1
		;;
esac


