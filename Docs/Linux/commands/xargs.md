# Documentation - Command : xargs

## Table of Contents
* [Program Information](#program-information)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Program Information

### Background

xargs is a UNIX shell command used to convert input from standard input (stdin) into arguments to a command via PIPE

## Documentation

### Synopsis/Syntax
- Pipe the Standard Output of the command on the Left-hand Side (LHS) to the Standard Input of xargs
    ```bash
    [command] | xargs {xargs-options} [command-to-execute] {command-options} <arguments>
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        - `-a <file> | --arg-file=<file>` : Read items from file instead of standard input
            - If you use this option - stdin remains unchanged when commands are run. 
            - Else - stdin is redirected from /dev/null
        + `-d <delim> | --delimiter=<delim>` : Set delimiter for termination of input items
        - `-E <end-of-file-string>` : Set the end of file string to eof-str
            + If the End of File string occurs as a line of input, the rest of the input is ignored
            + If neither -E nor -e is used, no end of file string is used
        + `-n<number-of-iterations>` : Tells xargs to perform one iteration at a time, not all; using this with '-p' allows you to individually confirm all actions
        + `-I <delimiter>` : Get the output into a placeholder
    - Flags
        + --help : Print help menu and a summary of the optons to xargs and exit
        + --version : Prints the version number of xargs and exit
        + `-o | --open-tty` : Reopen standard input as /dev/tty in the child process before executing the command; Useful if you want xargs to run as an interactive program
        + `-p | --interactive` : Print a confirmation prompt with the action it's going to take 
        + `-t | --verbose` : Print the command line on the standard error output before executing it and Displays error message
        + `-0 | --null` : Indicate the standard input items are Null-separated and not whitespace; Disables quote and backslash processing and logical End-of-File (EOF) processing

### Usage
- Read from a text file and interactively operate, line by line
	```bash
	cat file.txt | xargs -n1 -p [command]
	```

- Parsing multiple arguments
	```bash
	echo "`command_1` `command_2` `command_3` | xargs [command-4]
	```

- Rearrange arguments using awk
	```bash
	echo "arg1 arg2 arg3" | awk '{ print $3, $2, $1 }' | xargs "echo -p"
	```

- Parse directly to command line/bash
	- NOTE:
		+ By using the real command in bash -c, the first argument is assigned to $0 instead of $1
	```bash
	echo "arg1 arg2 arg3" | xargs bash -c 'echo -p $2 $1 $0'
	```

- Obtain a Null-separated Standard Output from a command and pipe as Standard Input to the xargs command
    - Explanation
        - Basically, xargs with '-0' will sanitize the null-separated standard input list 
            - i.e.
                ```
                line-1
                line-2
                line-3
                line-4
                line-5
                ```
            + and format into a line separated by whitespaces instead
    ```bash
    [command] | xargs -0 {xargs-options} [command] {commands-options} <arguments>
    ```

- Using find to locate files of a certain filter and tar archive it
    - Compress and archive using xz
        ```bash
        find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -print0 | xargs -0 tar --null -cJvf [tar-file]
        ```

    - Compress and archive using gz
        ```bash
        find [root-path-to-search] -type {f|d} -name "specific-name" -size {{+|-}N{K|G|B}} {other-options ...} -print0 | xargs -0 tar --null -czvf [tar-file]
        ```

## Remarks

### Notes

- The command of choice (command-1) uses PIPE (|) to pass the standard output (stdout) to xargs
	- xargs will take the output and pass it to command-2 and parsing it as an argument

### Thanks to the following for references

Baeldung - xargs multiple arguments : https://www.baeldung.com/linux/xargs-multiple-arguments

