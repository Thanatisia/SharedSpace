# Display Server

Setting up and starting a display server (i.e. XOrg) without dependencies and
using their respective representative programs (i.e. startx => xorg server)

## Table of Contents
- [Setup](#setup)
- [Steps](#steps)

## Setup

### Pre-Requisites

+ Get a display server (for graphical environment of your choice)
+ choose a tty to work with (i.e. /dev/tty#)
	- set tty
		```console
		stty=$(stty -g)
		tty=$(tty)
		tty=${tty#/dev/tty}
		```
+ Set a display
	- Syntax: DISPLAY=:[tty_number]
	```console
	export DISPLAY=:$tty
	```

### Dependencies

+ package [xorg]
    - xorg
    - xauth
+ /dev/urandom

### File Structures
```
files required
```
+ xauthority : For authorization and authentication when starting the xorg server
+ xinitrc : The xinit resource control file that will contain your customization and autostart/startup functions

## Steps

### 1. Generate xauthority

```console
xauth add 
```

### Start Xorg XServer

- Syntax: /usr/bin/xorg $DISPLAY vt[tty_number] -keeptty -auth [path-to-xauthority-file] &
	```console
	/usr/bin/xorg $DISPLAY vt1 -keeptty -auth "/path/to/xauthority" &
	```

### Cleanup

- Kill xorg server with pid
	```console
	# Check if pid exists
	if [[ "$pid" ]] && kill -0 "$pid" 2> /dev/null; then
		# Kill  xorg server
		kill "$pid"
		
		# Wait for 'xorg server' process ID to show up
		wait "$pid"

		# Check if it showed up (if the command is successful)
		xorg=$?
	fi

- Check tty
	```console
	if [[ ! stty "$stty"; then
		stty sane
	fi
	```

- Remove xauth
	```console
	# Remove xauth
	xauth remove :"$tty"
	```

- Exit from xorg
	```console
	# Exit from xorg
	if [[ "$1" == exit ]]; then
		exit "${xorg:-0}'"
	fi
	```
