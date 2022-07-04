# Linux Shellscript Command : printf

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

- printf is a command similar to echo whereby it prints out messages to the standard output (stdout) with formatting, and 
    + is used in the C programming language to print out messages.
- printf has various syntax formatting parameters that makes it somewhat more scriptable than echo

## Setup

### Dependencies

NIL

### Pre-Requisites

NIL

## Documentation

### Synopsis/Syntax

printf [parameters] "stdin-string"

### Parameters

#### Formatting

- Types
    + "%c" : Display characters
    + "%s" : Display string
    + "%f" : Display floating point numbers
    + "%d" : Display decimal numbers

### Usage

- To format the standard input and seperate using a specific delimiter
    + Format the standard input string with a delimiter
        ```sh
        printf "%s$delimiter" "$1"
        ```

- To print array elements with a specific format and delimiter/seperators
    + Format the array string with a delimiter
        ```sh
        printf "%s$delimiter" "${arr[@]}"
        ```
        
- To join and print array elements on seperate lines
    + Parse in all elements of the array into a single string and 
    + format the output to seperate by newline delimiter
    ```sh
    printf "%s\n" "${arr[@]}"
    ```

## Resources

+ [StackOverflow - print array elements on seperate lines in bash](https://stackoverflow.com/questions/15691942/print-array-elements-on-seperate-lines-in-bash)

## References

## Remarks
