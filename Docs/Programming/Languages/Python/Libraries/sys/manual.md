# Python Library - sys

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
- sys is a built-in python library that manages the application's system software and runtime configurations 
    - such as
        + Standard Input, Standard Output and Standard Error streams/pipes
        + CLI arguments

## Documentation

### Packages

### Modules
- sys : Handles application/platform system settings and configurations
- sys.stdin : Handles the system's standard input stream

### Classes

### Functions
- sys.stdin
    - `.isatty()` : Checks if the standard input is a TTY; 
        - Return
            + Type: Boolean
            - Values
                + Returns True if the standard input is a terminal (no pipes are used) and
                + Returns False if the standard input is a stream (stdin, pipes)

### Data Types and Objects

### Attributes/Variables
- sys
    - `.argv` : Contains the CLI arguments that the user specified
        + Type: List
        - Values
            + `sys.argv[0]` : The executable's script name
            + `sys.argv[1:]` : Obtain all CLI arguments except the executable script name
    - `.stdin` : Contains the standard input stream data piped/streamed by the user; It is a container-like data structure similar to a list
        + Type: TextIO

### Usage
- Get standard input stream
    - Initialize variables
        ```python
        results = []
        ```
    - Use the standard input stream if it is full/populated
        ```python
        if not sys.stdin.isatty():
            input_stream = sys.stdin
        ```
    - Obtaining the Standard Input (stdin) stream data
        ```python
        for line in input_stream:
            # Sanitize current line
            line = line.strip()

            # Append into a results list
            results.append(line)
        ```

- Obtain the CLI arguments parsed
    ```python
    exec = sys.argv[0]
    argv = sys.argv[1:]
    ```

- To obtain argc (Argument Count) aka number of arguments provided
    ```python
    argv = len(argv)
    ```

### Operational Workflow
- Import package and modules
    ```python
    import sys
    ```

- Setting up a CLI interface with Stream, Pipe and CLI argument parsing support
    ```python
    # Initialize Variables
    results = []

    # Use the standard input stream if it is full/populated
    if not sys.stdin.isatty():
        # Obtain the Standard Input Stream
        input_stream = sys.stdin

        for line in input_stream:
            # Sanitize current line
            line = line.strip()

            # Append into a results list
            results.append(line)
    else:
        # Obtain arguments from the CLI argument parser
        exec = sys.argv[0]
        argv = sys.argv[1:]
        argc = len(argv)
        results = argv.copy()

    # Check if there are data
    if len(results) > 0:
        for result in results:
            print(result)
    else:
        print("No URLs provided.")
    ```

## Wiki

## References

## Resources
+ [Python Docs - sys](https://docs.python.org/3/library/sys.html)
+ [StackOverflow - Questions - 699390 - What's the best way to tell if a Python program has anything to read from stdin?](https://stackoverflow.com/questions/699390/whats-the-best-way-to-tell-if-a-python-program-has-anything-to-read-from-stdin)
+ [StackOverflow - Questions - 111095859 - Pipe output from shell command to a python script](https://stackoverflow.com/questions/11109859/pipe-output-from-shell-command-to-a-python-script)

## Remarks

