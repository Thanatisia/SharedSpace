# Linux Shellscript (Bash) Cheatsheet

## Table of Contents:
- [Operators](#operators)
- [Symbols](#symbols)
- [Commands](#commands)
- [Usages](#usages)
- [Tips n Tricks](#tips-n-tricks)
- [Topics](#topics)
- [Snippets](#snippets)
- [Best Practices](#best-practices)
- [Glossary](#glossary)

## Basics

### Variables
- Global Variables
    - To declare a global variable within a function
        + Available in Bash v
- Special Environment Variables
    - $$ : Gives you the Process ID of the shellscript when it is running in the background
        + Useful when you create a cript that can run multiple times parallely
    - `$*` : similar to `$@` in functionality as it stores all arguments parsed
        + Difference between `*` and '@' is that '@' will store the command line arguments in lists while `*` in string
    - $# : Gets the count of variables passed to the script
    - IFS : Internal Field Separator
        + Automatically uses SPACE, TAB or NEWLINE characters as separators for inputs to a script
        - If you change this variable in the script to any other separators
            + Your script will break down the inputs using that specified character as a new separator
        
## Operators:
### Mathematical Operations
+ Addition 	        : res=$((a + b))
+ Subtraction 	    : res=$((a - b))
+ Multiplication 	: res=$((a * b))
+ Division 	        : res=$((a / b))
+ Modulus 	        : res=$((a % b))

### Arrays and Lists
- Initializing and Declaration
    - Set Array 		    : An Array; Container object for storing values
        ```console
        arr=()
        ```
    - Set Associative Array : Like HashMap/Dictionaries; Key-Value Pairs 
        + parse/pass the '-A' Flag to *declare
        ```console
        declare -A aarr=([key]=value)
        ```
    - Set Name References	: Useful for returning arrays in functions
        + parse/pass the '-n' Flag to *declare*
        ```console
        declare -n ret_arr="$name_of_array"
        ```
- Accessing
    - Array/List
        + Get a specific element			            : "${arr[n]}"
        + Get all List Elements				            : "${arr[@]}"
        + Get all indexes of the elements 		        : "${!arr[@]}"
        + Get count/size/number of elements in the list : "${#arr[@]}"
    - Associative Array/Dictionary/HashMap
        + Get count/size/number of elements in the list : "${#aarr[@]}"
        + Get key of all elements in associative array 	: "${!aarr[@]}"
        + Get value of all elements in associative array: "${aarr[@]}"
        + Get value of an associative array 		    : "${aarr[key]}"

## Symbols:
+ $? : Get the status code for the most recently ran command, Returns '0' = Success; >= '1' = Error
+ $! : Get the process ID (pid) for the most recently ran command
+ $@ : Get all command line arguments
+ $# : Get the number of command line arguments

## Commands:

## Usages:

## Tips n Tricks:

### Handling Multiline Strings
- Using heredoc (Refers to [#Topics.Heredoc] for more info)
    - With Variables
        ```console
        var_name=$(cat <<EOF
        # your-texts-here
        EOF
        )
        ```
    - Passing Multiline strings into files
        ```console
        cat <<EOF > file-name
        # your-texts-here
        EOF
        ```
    - Passing Multiline strings into pipes
        ```console
        cat <<EOF | command
        # your-texts-here
        EOF
        ```

- Commenting
    - Multi-line strings
        - Using heredoc
            ```console
            <<EOF
                # Your-Lines
            EOF
            ```
        # Using Colon
            ```console
            : " 
            # Your-lines here
            "
            ```

- Making Directory
    - You can create multiple directories in-line using {dir1,dir2,dir3...,}
        + Syntax : mkdir -p /path/to/parent/directory/{child_dir_1,child_dir_2, ...,}
        ```console
        mkdir -p ~/personal/{dotfiles,scripts,}
        ```

## Topics 
### Heredoc
- Format
    ```
    <<[-]word
        here-document (aka multiline strings)
    delimiter
    ```

### Resolution Management
- X Server
    - xrandr
        -q                          : Query Monitors
        --output [target-monitor] 	: Select an output monitor
        --mode [resolution]		    : Set resolution of [target-monitor]
        --rate [framerate]		    : Set [target-monitor]'s refresh rate
        --primary 			        : Set [target-monitor] as the primary monitor
        --left-of [target-monitor] 	: Set position of selected monitor to the left of a specified monitor
        --right-of [target-monitor] : Set position of selected monitor to the right of a specified monitor

### User Management
- if Distro is
    - Arch | Gentoo:
        + useradd
            -m                      : Specify to create a home directory for the user
            -g [primary-group]      : add user to primary-group
            -G [secondary,groups]   : add user to secondary groups
            -d [home-directory]     : Explicitly specify where to create the home directory for the user
    - Debian:
        + adduser
            -m                      : Specify to create a home directory for the user
            -g [primary-group]      : add user to primary-group
            -G [secondary,groups]   : add user to secondary groups
            -d [home-directory]     : Explicitly specify where to create the home directory for the user

## Snippets:
+ seperate by delimiter:
    ```sh
        seperate_by_Delim()
        {
            #
            # Seperate a string into an array by the delimiter
            #

            # --- Input
            
            # Command Line Argument
            delim="${1:-';'}"	# Delimiter to split
            str="$2"			# String to be seperated

            # Local Variables

            # Array
            content=()			# Array container to store results
            char=''				# Single character for splitting element of a string

            # Associative Array

            # --- Processing
            # Split string into individual characters
            # IFS=$delim read -r -a content <<< "$str"
            content=($(echo $str | tr $delim "\n"))
            
            # --- Output
            echo "${content[@]}"
        }
    ```

+ if-main:
    ```sh
        if "${BASH_SOURCE[0]}" == "${0}"; then
            main "$@"
        fi
    ```

## Best Practices
    
## Glossary:
