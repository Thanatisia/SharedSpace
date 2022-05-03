# Documentation - Command : notify-send

program to send desktop notifications

## Table of Contents
* [Background](#background)
* [Setup](#setup)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background

A simple program used to send desktop notifications, 
used by Notification Daemons like dunst to send and display popup notifications for updates from the command line.

These notifications can be used to inform the user about an event and/or display some form of information
without interrupting the user.

Examples include:
	- Package updates available in the repository.

## Setup

### Pre-Requisites

### Installing

- If your Package Manager is
	- Debian-based
		```bash
		sudo apt(-get) install notify-send
		```
	- Fedora-based
		```bash
		sudo dnf install libnotify
		```
	- Arch-based
		```bash
		sudo pacman -S notify-send
		```

## Documentation

### Synopsis/Syntax

notify-send [[OPTIONS] <arguments>] [[title/summary] [body]]

### Parameters

-? | --help : Shows help and exit
-u | --urgency=[LEVEL] : Specifies the urgency level
	```
	Urgency Levels:
		- low
		- normal
		- critical
	```
-t | --expire-time=[TIME] : Duration for the notification to appear on screen
	```
	Specify in milliseconds (ms)

	- ubuntu's notify OSD and GNOME Shell both ignores this parameter
	```
-i | --icon=ICON[,ICON...] : Specifies an icon filename or stock icon to display
-c | --category=TYPE[,TYPE] : Specifies the notification category
-h | --hint=[TYPE:NAME:VALUE] : Specifies basic extra data to pass
	```
	Valid Types:
		- INT 
		- DOUBLE
		- STRING
		- BYTE
	```

### Usage

- Simple Echo
	```
	- Piping standard output
		- echo "Hello World" | xargs notify-send
	- From the command itself
		- notify-send [{options} <arguments>] "Hello World"	
	```

## Remarks

- Use '--' to indicate nothing for the title of the notification
	```console
	notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'"
	```

### Design Documents



### References

+ [Notify-Send manual](https://man.archlinux.org/man/extra/libnotify/notify-send.1.en)
+ [Automatic Screen Lock and Suspend for Window Managers - Linux Tutorial](https://www.youtube.com/watch?v=_wcrytoLufA)
