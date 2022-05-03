# Docs - Linux Commands Masterlist

Documentations and Writeups for Linux Commands, a Markdown version of (Linux Command Docs - cheatsheets)[cheatsheets.txt]

## Table of Contents
- [Commands](#commands)
- [Tips n Tricks](#tips-and-tricks)

## Commands

### Sysadmin
- cat : Read out contents of a file; Copies the contents of file-A to file-B if two files are provided
- cd : Change Directory
- cp : Copy files
- crontab : Cronjob utility
	#### Synopsis/Syntax
	crontab {options}
	#### Parameters
	+ -e : Edit crontab
	+ -l : List scheduled jobs for current user
- df : Disk File; shows the amount of space used and left in the disk
	#### Synopsis/Syntax
	df {options}
	#### Parameters
	+ -h : Human Readable Format
- dir : Displays files and folders in current working directory
- find : Used to search for files, strings and directories
- free : Shows current system memory - free, total and swap (RAM)
	#### Synopsis/Syntax
	free {options}
	#### Parameters	
	+ -h : Human Readable Format
- ftp : File Transfer Protocol; To remotely connect to a remote ftp host
- kill : Terminate processes; used alongside ps command (to get process id)
- last : Watch the user's activity in the system
- less : Allows quickly viewing of file
- ls : Displays list of files in human readable format
- lsof : List of all open files
- lsblk : To display all block files and their sizes
- mkdir : Create directories
	#### Synopsis/Syntax
	mkdir {options} [directory-name]
	#### Parameters
	+ -p : To create all parent directories of the target location if does not exist
- more : Allows quickly viewing of file and shows details in percentage
- mv : Move Files from source to destination
- ps : Displays processes running in the system
	#### Synopsis/Syntax
	ps {options} [keyword]
	#### Parameters
	+ -ax : Shows All and Executable
- pwd : Print current working directory
- rm : Remove/delete a file
- sftp : Secure File Transfer Protocol; To remotely connect to a remote ftp host securely
- ssh : Secure Shell remote connection
- sort : To sort lines of a string/text/file
	#### Syntax/Synopsis
	sort {options] [file-name]
	#### Parameters
	+ default: Ascending order
	+ -r : Descending Order
- su : To access superuser
- sudo : To execute commands as superuser
- top : Displays processor activity of the system
- uname : Displays the current machine's information (i.e. Kernel version etc)
- uptime : Shows how long your system is running and number of users currently logged in
	#### Synopsis/Syntax
	uptime {options}
	#### Parameters
	+ -V : Check version
- users : Displays current logged-in users
- whoami : Display's current user's username

### File Manipulation
- awk : File pattern searcher
- dd : Disk Destroyer; Disk utility meant for cloning, backup, recovery and transferring of disk data
- grep : GNU Regular Express Pattern Search Filter - to search for keywords based on regex pattern
- sed : 
	#### Synopsis/Syntax
	sed -i '<regular_expression>' filename
	#### Parameters
	-i : Input Regular Expression
	#### Usage
	- To find and replace
		- sed -i 's/old-text/new-text/g' filename
- tar : Compression Utility like zip

### Command Line Utilities
- getopts : Parses command line options and arguments
- notify-send : Program to send desktop notifications
- shift : To move current/specified index back and forth
- xargs : UNIX shell command to convert input from standard input into arguments via pipe

### Scripting Utilities
- basename : Get the file/directory name at the end of a given path
	#### Synopsis/Syntax
	basename {option] [path] [optionals: [extension-to-remove]]
- dirname : Get the path leading up to a given file/directory path
	#### Syntax
	dirname {option} [path]
- shuf : Get a result at random from a list
	#### Syntax
	stdout | shuf {parameter}

## Tips and Tricks