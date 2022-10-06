# Documentation - Command : clip

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
clip is a Clipboard Manager for Windows Command Line.

clip is a pipe application, which means that it will redirect the standard output of a command/application to the standard input of clip
    - afterwhich, clip will store the result into the Clipboard to be pasted elsewhere.
```

## Documentation

### Synopsis/Syntax
```batchdos
[command] | clip {options}
```

### Parameters

- Positionals
    + command : The command that you want to execute and store the result into the system clipboard

- Optionals
    + /? : Display this help message

- Operators
    + < [filename] : Reads the file specified and redirects the file contents to the system clipboard

### Usage

- Write current directory into the system clipboard
    ```batchdos
    dir | clip
    ```

- Read a file into the clipboard
    ```batchdos
    clip < file.txt
    ```

## Wiki

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

