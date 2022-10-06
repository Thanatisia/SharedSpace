# Documentation - Command : findstr

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
findstr, in windows, is similar in concept to grep, whereby it operates with Pipes.

The idea is that a user will first execute a command, 
    and the result of the command will then proceed to be piped 
    into the stdin (standard input) of findstr.

findstr, like grep, is a string pattern matcher. findstr will utilize patterns in a given string to process and return with the found data.

By default, findstr is Case-sensitive
```

## Documentation

### Synopsis/Syntax
```batchdos
[command {parameters}...] | findstr {options <arguments>} [keyword]
```

### Parameters

- Positional
    - keyword : The pattern you want to search
        + Type: String

- Optionals
    + /? : Help menu; display detailed information
    - /A:[attribute] : Specify color attributes using 2 hex digits (refer to color /?)
        + Format: [0-9a-fA-F]\[0-9a-fA-F] 
        + Examples: "AB"
    + /B : Matches patterns found at the beginning of a line
    + /C : Similar to /L; Specifies the search string as the literal search string
    + /D:[directory;] : Specify all directories to be searched in; Seperate each directory name with a semicolon delimiter ';'
    + /E : Matches patterns found at the end of a line
    + /F:[filename] : Specify a filename and reads the file list
    + /G:[filename] : Specify a filename and gets search strings from the file list
    + /L : Matches search strings literally
    + /R : Matches search strings with Regex (Regular Expression patterns)

### Usage

- Basic string search
    - Find IPv4 from ipconfig
        ```batchdos
        ipconfig /all | findstr "IPv4"
        ```

## Wiki


## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

