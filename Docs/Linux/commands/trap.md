# Documentation - Command : trap

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### DESCRIPTION

```
trap is a Linux Command-line application for catching signals and executing codes when they occur.

- Signals are asynchronous notifications that are sent to your script when certain events occur. 
- Most of these notifications are for events that you hope never happen, such as
	+ invalid memory access or 
	+ a bad system call. 

- Bash also provides a psuedo-signal called "EXIT", which is executed when your script exits; this can be used to make sure that your script executes some cleanup on exit.
```

### Signals
+ Please refer to the "~/Docs/Programming/Guides/Concepts/Signals" document in the repository for list of Signals

## Setup

### Pre-Requisites
+ NIL

### Dependencies
+ NIL

### Installing
+ trap is built-in to every Linux Distribution

## Documentation

### Synopsis/Syntax

```console
trap {options} ["command/action"] [signals...]
```

### Options
+ -p : Displays signal commands
+ -l : Prints a list of all the signals and their numbers

### NOTES
- Reset a trap
	+ parse '-' as the command/action
- Disable a signal
	+ parse "" as the command/action
	+ to ensure that the user cannot interrupt the script execution
	- important when executing sensitive commands whose interruption may permanently damage the system
		- Examples
			+ Script that updates/upgrades system
			+ Script that installs a package
			+ Dotfile installer
			+ Distribution installer

### Usage

- cleanup on EXIT
	```console
	cleanup()
	{
		: "
		Cleanup function here
		"
	}

	# Execute trap signal
	trap cleanup EXIT
	```

- No Ctrl C
	+ Disable SIGINT
	```console
	trap no_ctrlc SIGINT
	```

- Reset/Unset a trap
	+ parse a dash (-)
	```console
	trap - [Signal]
	```

- Disable a signal
	+ parse an empty ("") value
	```console
	trap "" [signal]
	```

## Resources

## References
+ [Linuxjournal - bash trap command](https://www.linuxjournal.com/content/bash-trap-command)
+ [Phoenixnap - bash trap command](https://phoenixnap.com/kb/bash-trap-command)

## Remarks

