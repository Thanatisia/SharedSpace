# Documentation - Command : [command-name]

## Table of Contents
* [Program Information](#program-information)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Program Information

### Background

xargs is a UNIX shell command used to convert input from standard input (stdin) into arguments to a command via PIPE

## Documentation

### Synopsis/Syntax

[command1] | xargs {options} [command2]

### Parameters

\--help : Print help menu and a summary of the optons to xargs and exit
\--vesion : Prints the version number of xargs and exit
\-o | --open-tty : Reopen standard input as /dev/tty in the child process before executing the command
	```
	- Useful if you want xargs to run as an interactive program
	```
\-p | --interactive : Print a confirmation prompt with the action it's going to take 
\-t | --verbose : Print the command line on the standard error output before executing it
	```
	- Displays error message
	```
\-a <file> | --arg-file=<file> : 
	```
	Read items from file instead of standard input; 
	- If you use this option - stdin remains unchanged when commands are run. 
	- Else - stdin is redirected from /dev/null
	```
\-d <delim> | --delimiter=<delim> : Set delimiter for termination of input items
\-E <end-of-file-string> : Set the end of file string to eof-str
	```
	If the End of File string occurs as a line of input
	- the rest of the input is ignored
	- If neither -E nor -e is used, no end of file string is used
	```
\-n<number-of-iterations> : Tells xargs to perform one iteration at a time, not all;
	```
	- using this with '-p' allows you to individually confirm all actions
	```
\-I <delimiter> : Get the output into a placeholder

### Usage

Read from a text file and interactively operate, line by line
	```
	cat file.txt | xargs -n1 -p [command]
	```

Parsing multiple arguments
	```
	echo "`command_1` `command_2` `command_3` | xargs [command-4]
	```

Rearrange arguments using awk
	```
	echo "arg1 arg2 arg3" | awk '{ print $3, $2, $1 }' | xargs "echo -p"
	```

Parse directly to command line/bash
	```
	echo "arg1 arg2 arg3" | xargs bash -c 'echo -p $2 $1 $0'

	NOTE:
		- By using the real command in bash -c, the first argument is assigned to $0 instead of $1
	```

## Remarks

### Notes

- The command of choice (command-1) uses PIPE (|) to pass the standard output (stdout) to xargs
	- xargs will take the output and pass it to command-2 and parsing it as an argument

### Thanks to the following for references

Baeldung - xargs multiple arguments : https://www.baeldung.com/linux/xargs-multiple-arguments

