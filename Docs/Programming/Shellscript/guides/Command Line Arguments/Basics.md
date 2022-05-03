# Linux Shellscript - Command Line Arguments : Basics

Basics in Linux (Bash) Shellscript Command Line Argument Options Handling

## Table of Contents
- [Command Line Interface](#command-line-interface)
	- [Introduction](#introduction)
	- [Synopsis-or-Syntax](#synopsis-or-syntax)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Command Line Interface

### Introduction

- Generally speaking, Command Line Arguments in Linux Shellscript is parsed in as a list
	```console
	$> testscript arg1 arg2 arg3 arg4 arg5 --arg6 -arg7 arg8 arg9
	
	### testscript
	argv=("$@")
	for i in "${argv[@]}"; do
		# Retrieve argument/element stored in the current index
		curr_arg="${argv[$i]}" 

		# Display
		echo "Current Argument : $curr_arg"
	done
	```
	- Essentially, each index/spacing in the command line is one element in the arraylist parsed in

- You can then manipulate the list however you like to use the command line arguments

### Synopsis or Syntax

- Terminal Command Line
	```console
	script_name [your-arguments]
	```

- Script
	- To Access
		```console
		argv=("$@")
		```
	- To count number of arguments parsed in
		```console
		argv=("$@")
		argc="${#argv[@]}"
		```

## Remarks

## Resources

## References