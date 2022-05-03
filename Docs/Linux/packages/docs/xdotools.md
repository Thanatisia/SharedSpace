#================================#
# Linux Documentation - Packages #
#	xdotools		 #
#================================#

Linux Documentation on package [xdotools]

## Table of Contents:
+ [Information](#information)
+ [Setup](#setup)
+ [Documentations](#documentation)
+ [Remarks](#remarks)
+ [Resources](#resources)

## Information

### Summary

xdotools is a command-line X11 Automation Tool.

### Background

xdotools is a command-line X11 Automation Tool that handles everything that the XOrg Display Server is putting out, components like
+ mouse
+ desktops
+ windows
+ nodes

xdotool lets you programatically (or manually) simulate keyboard input and mouse activity, 
move and resize windows, etc. 
It does this using X11's XTEST extension and other Xlib functions.

## Setup

### Pre-Requisites

### Dependencies

+ xorg

### Obtaining

- Available in Official Repository
	- Debian-based
		```console
		sudo apt(-get) install xdotools
		```

	- Arch-based
		```console
		sudo pacman -S xdotools
		```

## Documentations

### Synopsis/Syntax

xdotool [cmd] [args...]

### Parameters

#### Keyboard Commands

#### Mouse Commands

#### Window Commands
- search [options...] [pattern] : Search for a certain keyword
	- Options:
		+ --onlyvisible : Show only visible windows in the results
		+ --name "[window name]" : Matches against the window class name

- windowunmap [options] [window] : Hides a window
	- Options:
		+ --sync : After requesting the window unmap, wait until the window is no longer visible
- windowmap [options] [window] : Shows a window
	- Options:
		+ --sync : After requesting the window map, wait until the window is actually visible

### Usage:

- Hide Window (Terminal applications)
	```console
	# Check for a window name of the provided title, and
	# Check that it is visible
	# If it is visible, Hide/Take away window
	xdotool search --onlyvisible --name "$window_name" windowunmap || $command
	```

- Show Window (Terminal Applications)
	```console
	# Check for a window name of the provided title, and 
	# if found, show it
`	xdotool search --name "$window_name" windowmap || $command
	```

- Hide Window (GUI Applications)
	```console
	# Check for a window name of the provided classname, and
	# Check that it is visible
	# If it is visible, Hide/Take away window
	xdotool search --onlyvisible --classname "$window_name" windowunmap || $command
	```

- Show Window (GUI Applications)
	```console
	# Check for a window name of the provided classname, and 
	# if found, show it
	xdotool search --classname "$window_name" windowmap || $command
	```

### Customization and Configuration

- Script for scratchpad
	+ Special thanks to Jake@Linux for this idea, link for the video can be found in [Resources](#resources)
	```console
	### Script (name : scratch) ###

	# Take in command line argument for program to run
	case "$1" in 
		option)
			entry="command-here"
			;;
	esac

	# Check for a window provided by user
	# If it is visible, hide it
	# If it is hidden, show it
	# If it doesnt exist, run the program
	xdotool search --onlyvisible --name "$1" windowunmap \
		|| xdotool search --name "$1" windowmap \
		|| $entry &

	### Usage in Keybindings ###

	# Pseudocode, for example
	# Binding:
	#	Super + F12 : Launch alacritty with a command
	keybind Super-F12 exec scratch alacritty
	```

## Remarks
	

## Resources
+ [Jake@Linux - Script to allow window manager agnostic scratchpads](https://www.youtube.com/watch?v=su5cqjVYFcs) : Using xdotools to create a generic, non-graphical environment-reliant scratchpad utility
+ [Ubuntu Manual Pages](http://manpages.ubuntu.com/manpages/trusty/man1/xdotool.1.html)
