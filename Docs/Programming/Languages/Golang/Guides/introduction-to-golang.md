# Golang - Introduction and Documentations

## Information

### Description
+ This is a complete (as much as possible) write-up documentation of the Go programming language for beginners to learn from scratch

## Table of Contents
- [Basics](#basics)
    + [Setup](#setup)
    + [Golang Project Workspaces and Development](#golang-projects)
    + [Operators](#operators)
    + [Keywords](#keywords)
    + [Variables](#variables)
    + [Basic Syntax](#Syntax)
    + [Conditional Statements](#conditional-statements)
- [Data Types](#data-types)
    + [Floats](#floats)
    + [Integers](#integers)
    + [String](#string)
    + [null](#null)
- [Standard Streams](#standard-streams)
    + [Standard Output (stdout)](#standard-output)
- [Data Structures](#data-structures)
    + [Arrays](#arrays)
    + [Vectors](#vectors)
    + [Structure](#structure)
- [Iterative](#iterations)
    - [For Loop](#for-loop)
        + [Indexed-based](#indexed-based)
        + [Key-Value Mappings](#key-value-mappings)
    - [While Loop](#while-loop)
+ [Enumeration](#enumeration)
+ [Attributes](#attributes)
+ [Crates](#crates)
- [Functions](#functions)
- [Command Line Arguments](#command-line-arguments)
- [External Files](#external-files)
    + [Importing External Libraries and packages](#importing)
    + [File I/O Processing](#file-io-processing)
- [System Process Calls](#system-process-calls)
    + [System Command Execution](#system-command-execution)
    + [Subprocess pipes](#subprocess-pipes)
- [Asynchronous Programming](#asynchronous-programming)
- [Concurrency](#concurrency)
    + [Threads](#threads)

## Basics

### Setup
- Dependencies
    + golang

### Golang Projects
- Creating a golang project workspace structure from scratch
    - Create a 'go.mod' file
        - Explanation
            + This file defines the project's module repository and all  external dependencies required by the project
        ```
        module [your-project-repository]

        <package-name> <package-version>
        ```
    - Create your 'main.go' entry point source file
        ```go
        package main

        import (
            // Your imports (libraries, packages, modules) here 
            // [1] package name only = "package"
            // [2] package name with module = "package/module"
        )

        func main() {
            
        }
        ```
- Development
    - Build project source
        ```bash
        go build -o [output-executable-name]
        ```

## Built-in System Functions
- Obtaining the number/count of elements in an array
    - Explanation
        + Using the 'len()' function, this returns the number of elements within a container object
    ```go
    len(obj)
    ```

## Operators
+ ':='

## Keywords
+ struct : Create a structure

## Variables
- Declare a constant
    ```go
    const var_name = value
    ```

- Declaring a variable
    ```go
    var var_name = value
    ```

## Syntax
- Switch-case
    ```go
    switch object {
    case "value1", "value2", ..., "valueN":
        // Statements here
    case default:
        // Default case here
    }
    ```

- Conditional Statements
    - If, else if, else
        ```go
        if <expression> {
            // Statement 1
        } else if <alternate-expression> {
            // Alternate Statement
        } else {
            // Default statement
        }
        ```

## Data Types
+ string : An array of characters; strings are texts
+ int : Integer (0-9)
+ bool : Boolean (Base 2), True/False

## Data Structures
### Arrays (Ordered Lists)
- Initializing an array
    ```go
    var var_name []data-type
    ```
- List snippet (Cutting the array by specifying a range of indexes)
    - Create a new array of the target array starting from the specified index
        ```go
        var new_arr = arr[starting-index:]
        ```

## Iterations
### For-loop
- Arrays/Indexed-based for loop
    ```go
    for i, arg := range [your-list-object] {
        // Statements
    }
    ```

- Key-Value Mappings (i.e. Dictionary, mappings, hashmap, associative array)
    ```go
    for k, v := range [your-key-value-mapping] {
        // Statements
    }
    ```

## Functions
- Defining a new function
    - Explanation
        - Use the 'func' keyword to define and declare a new function block following the syntax: 
             + `func func_name(parameter_signature/header) { }`
    ```go
    func func_name(<data_type> param, ...) {

    }
    ```

- Invoking/Calling a function
    ```go
    return_objs = func_name(arguments, ...)
    ```

## Command Line Arguments
- Getting all arguments from the system CLI argument parser
    - Explanation
        + Using the 'os' module, 'os.Args' contains all arguments parsed to the application in a list/array container for retrieval during runtime
        + Like `os.args` in rust or `sys.argv`, element [0] will contain the executable and element [1] onwards will contain the first argument onwards 
    ```go
    os.Args
    ```

- Simple CLI Argument Parsing
    ```go
    func main() {
        if len(os.Args) < 2 {
                log.Fatal("a command is required")
        }
        command := os.Args[1]
        switch command {
            case "your-keyword", "commands":
                // Initialize Variables

                // Check if there are more than 2 arguments
                if len(os.Args) > 2 {
                        // More than 2 arguments
                        // Iterate starting from the 3rd argument and check the arguments for argument prefixes (short form = '-<short-form>', long form = '--<long-form>')
                        for _, arg := range os.Args[2:] {
                            if strings.HasPrefix(arg, "-<short-form>=") {
                                    container_obj = append(container_obj, strings.TrimPrefix(arg, "-<short-form>="))
                            } else if strings.HasPrefix(arg, "--<long-form>=") {
                                    container_obj = append(container_obj, strings.TrimPrefix(arg, "--<long-form>="))
                            } else {
                                    args = append(args, arg)
                            }
                        }
                }
            default:
                log.Fatal("bad command")
            }
        }
    }
    ```

- Iterating CLI Arguments list
    - Explanation
        - `if strings.HasPrefix(arg, "-<short-form>=")` : Check for a short form argument from the current argument
        - `if strings.HasPrefix(arg, "--<long-form>=")` : Check for a long form argument from the current argument
    ```go
    for _, arg := range os.Args[2:] {
        if strings.HasPrefix(arg, "-<short-form>=") {
            container_object = append(container_object, strings.TrimPrefix(arg, "-<short-form>="))
        } else if strings.HasPrefix(arg, "--<long-form>=") {
            container_object = append(container_object, strings.TrimPrefix(arg, "--<long-form>="))
        } else {
            args = append(args, arg)
        }
    }
    ```

## Logging
- Log and print a fatal error to the stderr
    ```go
    log.Fatal("a command is required")
    ```

## Filesystem
- Creating new directories
    ```go
    os.MkdirAll(dir_path, permission_modifier)
    ```
- Read all file contents of a directory
    ```go
    files, err := os.ReadDir(dir_path)
    ```

## Package Management
- Built-in System Libraries
    + fmt
    + log
    + math/rand
    + os
    + os/exec
    + path/filepath
    + strings
    + syscall
    + time

- Defining a new package
    ```go
    package [package-name]
    ```

- Import all libraries/dependencies required
    ```go
    import (
        // Packages
    )
    ```

## System Command Execution
- Using the 'os' module
    - Obtain the executable
        ```go
        path, err := os.Executable()
        ```
    - Create a 'Cmd' struct to execute the given command and arguments
        ```go
        cmd := exec.Command(commandName, commandArgs...)
        ```

