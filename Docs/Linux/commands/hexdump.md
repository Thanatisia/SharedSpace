# Documentation - Command : hexdump

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description

- Also known as 'hd', the hexdump command is used to filter and display the specified files and/or standard input in a human readable specified format.
    + Specifically, a display of the hexadecimal values of a given file
+ able to display file contents in hexadecimal, decimal, octal or ascii

- Example
    + If you want to view an executable code of a program

### Background

## Setup

### Pre-Requisites
+ NIL
### Dependencies
+ NIL
### Obtaining
+ Built-in to linux core utilities
### Installing

## Documentation

### Synopsis/Syntax

{hexdump | hd} {options...} [files...]

### Parameters

+ -b [files] | --one-byte-octal [files]     : One-byte octal display; Display the input offset in hexadecimal, followed by 16 space-delimited, 3 column, zero-filled bytes of input data, in octal, per line
+ -c [files] | --one-byte-char [files]      : One-byte character display; Display the input offset in hexadecimal, followed by 16 space-delimited, 3 column, space-filled, characters of input data per line
+ -C [files] | --canonical [files]          : Canonical hex + ASCII display; Display the input offset in hexadecimal, followed by 16 space-delimited, 2 column, hexadecimal bytes, followed by the same 16-bytes in %_p format enclosed in "|" characters
+ -d [files] | --two-bytes-decimal [files]  : Two-byte decimal display; Display the input offset in hexadecimal, followed by 8 space-delimited, 5 column, zero-filled, 2-byte units of input data, in unsigned decimal per line
+ -o [files] | --two-bytes-octal [files]    : Two-byte octal display; Display the input offset in hexadecimal, followed by 8 space-delimited, 6 column, zero-filled, 2 byte quantities of input data, in octal, per line
+ -x [files] | --two-bytes-hex [files]      : Two-byte hexadecimal display; Display the input offset in hexadecimal, followed by 8 space-delimited, 4 column, zero-filled, 2 byte quantities of input data, in hexadecimal, per line
+ -n [length] | --length [length]           : Specify number of bytes of output; Length is an integer
+ -s [offset] | --skip [offset]             : Skip 'offset' bytes from the beginning of the input
+ -v | --no-squeezing                       : Causes hexdump to display all input data; Default : Any number of groups of output lines are replaced with a line comprised of a single asterisk

### Usage

- View commands
    ```console
    hexdump $command
    ```

## Resources

## References

+ [GeeksforGeeks - hexdump](https://www.geeksforgeeks.org/hexdump-command-in-linux-with-examples/)
+ [Man page - hexdump](https://man7.org/linux/man-pages/man1/hexdump.1.html)

## Remarks

