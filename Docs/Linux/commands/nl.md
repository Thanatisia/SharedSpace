# Documentation - Command : nl

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
nl stands for numbering lines, this is a *NIX command line utility (CLI) that is used for numbering lines,
accepting input either from a file or from standard input (STDIN).

It copies each specified file to standard output (STDOUT), with line numbers appended before the lines
```

### Background

## Setup

### Pre-Requisites

### Dependencies

### Obtaining

### Installing

## Documentation

### Synopsis/Syntax
```console
nl {options} [file-name]
```

### Parameters
- -b [Number]        : Used for numbering body lines
    - Synopsis/Syntax
        ```console
        nl -b[Number]
        ```
- -i [Number]        : Line numbers increment at each line
    - Synopsis/Syntax
        ```console
        nl -i[Number]
        ```
- -l [Number]        : Groups of [number] empty lines are counted as one set
    - Synopsis/Syntax
        ```console
        nl -l[Number]
        ```
- -n [Format/Number] : Inserts line numbers according to the specified Format
    - Synopsis/Syntax
        ```console
        nl -n[Format/Number]
        ```
- -s "STRING"        : Adds the specified string after every logical line number
    - Synopsis/Syntax
        ```console
        nl -s "STRING"
        ```
- -v [Number]        : Change the first line number of the given input
    - Synopsis/Syntax
        ```console
        nl -v[Number]
        ```
- -w [Number]        : Use different number columns for line numbers
    - Synopsis/Syntax
        ```console
        nl -w[Number]
        ```

### Usage
- Use with a standard input picker like dmenu, fzf
    - Using fzf
        - print line numbers with the result of the standard output
            + Parse the standard output of the previous command into `nl` to display result with line numbers
            + Afterwhich, parse the new results into fzf to display in reverse (so that the lines are displaying downwards)
            + Get the first parameter in the selected line which is the line number
            ```console
            [command] | nl | fzf --reverse | awk '{print $1}'
            ```
        - Read file and print line numbers with the result of the standard output
            + Parse the contents of the file into `nl` to display result with line numbers
            + Afterwhich, parse the new results into fzf to display in reverse (so that the lines are displaying downwards)
            + Get the first parameter in the selected line which is the line number
            ```console
            cat [file-name] | nl | fzf --reverse | awk '{print $1}'
            ```

## Resources

## References
+ [GitHub - junegunn/fzf - Print line number instead of contents of chosen line](https://github.com/junegunn/fzf/issues/1014)

## Remarks

