# Linux - Streams

## Information
### Introduction
- streams are effectively pipes/pipelines that data will flow through when being sent from one application to another, one memory to another memory
    + Similar to am application socket
    - basic computing fundamentals
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


## Operators
+ > : Redirect-Out operator; Overwrite the contents (LHS) into file (RHS)
+ >> : Redirect-Out without Overwrite/Truncate operator; Append the contents (LHS) into file (RHS)
+ << : Redirect-In operator; Read the contents (RHS) into file (LHS)
- | : Pipe operator; A pipe is a direct passthrough of standard output (stdout) of the source from the Left-hand Side (LHS) to the Standard Input (stdin) of the destination object on the Right-hand Side (RHS)
    + Summary: A pipe will take the standard output of a command and redirect it directly into the standard input of a target command, file or destination object
- EOF : End-of-File; Start (and end) a stream container with your multiline strings within
    + Close the stream with another EOF at the first character

## Usage
### Development
- To write a multiline comment string
    ```console
    << EOF
    # Strings
    # here
    EOF
    ```

### How to write to a file using streams 
#### Using echo to redirect the standard output into a file
- To overwrite contents of a file with a multiline string
    ```console
    echo -e << EOF
    # File Contents
    # Here
    EOF > [file-name
    ```

- To append multiline strings into a file
    ```console
    echo -e << EOF
    # File Contents
    # Here
    EOF >> [file-name
    ```

- To print out multiline string to the standard output
    ```console
    echo -e << EOF
    # Strings
    # here
    EOF
    ```

#### using cat to write multiline
- To overwrite contents of a file with a multiline string
    ```console
    cat > [file-name] << EOF
    # File Contents
    # Here
    EOF
    ```

- To concatenate (cat) and append multiline strings into a file
    ```console
    cat >> [file-name] << EOF
    # File Contents
    # Here
    EOF
    ```

## Wiki

## Resources

## References

## Remarks

