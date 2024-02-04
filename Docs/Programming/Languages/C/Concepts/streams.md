# C programming - Streams

### Introduction
- In programming, streams are effectively pipes/pipelines that data will flow through when being sent from one application to another, one memory to another memory
    + Similar to a application socket
    - This is related to basic computing fundamentals
        - What makes a computer? 
            - I/O Processing
                + Input
                + Output
                + Processing
            - Essentially, These 3 are what makes a computer, and is required
    - There are 3 primary types of streams always used by an Operating System, this corresponds to the I/O Processing that was mentioned previously
        - Standard Input (stdin): 
            + This is your user input stream, aka "Input"
            - When the system request for the user to input data, 
                - after the user inputs the data, 
                    + it will be parsed through this stream directing into the system
        - Standard Output (stdout)
            + This is your display output stream, aka "Output"
            - When you are printing out to the display for users to read
                + You are printing to Standard Output
        - Standard Error (stderr)
            + This stream is related to the Processing computer operation
            - Essentially, if there are any issues/errors detected during the processing of a function
                - The system can be designed to print the error out through an "Error" stream
                    + This is the Standard Error (stderr) stream thats meant to be used for printing out error messages

## Streams 

### Standard Input

### Standard Output
- To print to standard output
    - Use printf
        - Synopsis/Syntax
            ```
            printf(
                [string-format],
                [format-arguments, ...]
            );
            ```
        - Parameters
            - data-format : This is your string that you want to print
                - Notes
                    - You can substitute and set variables in place of a raw value by substituting your raw value with a format specifier ('%[type]')
                        - Format Specifier
                            + Character : '%c'
                            + Digits (Integers) : '%d'
                            + String : '%s'
                            + Floats : '%f'
        - Usage
            - Print string
                ```c
                printf("%s", "Hello World");
                ```
            - Print digits (integers etc)
                ```c
                printf("%d", 5000);
                ```

### Standard Error

