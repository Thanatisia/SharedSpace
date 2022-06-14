# Vim - Command and Functions

Vim is able to create functions and commands, where 
	- functions are, as the name suggests, functions that can group multiple commands together to be executed back-to-back. 
		- Functions are able to take in parameters.
	- commands are one-time single line commands that you can use to execute another command or execute some action. 
		- Commands do not take in parameters

## Table of Contents
- [Information](#information)
- [Function](#function)
- [Command](#command)

## Function

### Structure

```console
function! func_name()
    " Statements here
endfunction
```

### Synopsis/Syntax

+ To Call:
	```console
	:call func_name(params)
	```

### Parameters


### Usage

:call func_name(parameters)


## Command

### Synopsis/Syntax

command! [name-of-command] execute "commands_here"

### Parameters

- Actions
	+ execute "command" : To execute a provided command

### Usage

:Name_of_Command [parameters]

### Examples

+ command! Filename execute ":echo expand('%:p')"
+ command! Config execute ":edit $MYVIMRC"
+ command! Reload execute "source $MYVIMRC"
+ command! Function execute ":call func_Name()"
