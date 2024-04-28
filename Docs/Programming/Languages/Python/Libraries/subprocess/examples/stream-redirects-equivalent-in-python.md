# Subprocess command execution - Stream redirects equivalent in Python

## Standard input stream

### Bash shell scripting
```bash
command < stdin-object
```

### Python
#### Using subprocess.Popen
- Import libraries
    ```python
    from subprocess import Popen, PIPE, STDIN
    ```

- Read the file/standard input object you want to pipe into the command
    - Piping a file into the command
        ```python
        with open([file-name], "r") as f_read:
            # Read the file into a list variable that will be passed into the subprocess Popen pipe as a standard input
            input_data = f_read.read()
        ```

- Create function to execute subprocess command
    - Explanation
        - The 'input_data' list variable (that is containing the contents of the file to pipe into the command) will be passed into the function
            + Then it will be encoded into bytes before being passed into 'proc.communicate(input=stream_input)' as an input stream to the command (command < stdin-object)
    ```python
    def execute_stdin_subprocess(cmd_list, stream_input):
        """
        Execute the command (in the form of a command list) with standard input piped in 
        
        + Format: 'command < [standard-input (input-file|text|string)]'
        """
        # Initialize Variables
        stdout = ""
        stderr = ""
        retcode = -1

        try:
            # Open a subprocess process pipe and execute command in benchmark
            with Popen(cmd_list, stdin=PIPE, stdout=PIPE, stderr=PIPE) as proc:
                # Execute command and return standard output
                proc_res = proc.communicate(input=stream_input.encode("utf-8"))
                stdout = proc_res[0]
                stderr = proc_res[1]
                retcode = proc.returncode

                # Check for errors
                if retcode != 0:
                    if stderr != None:
                        stderr = stderr.decode("utf-8")
                else:
                    if stdout != None:
                        stdout = stdout.decode("utf-8")
        except Exception as ex:
            print("Exception: {}".format(ex))

        # Output/Return
        return stdout, stderr, retcode
    ```

- Pass/Pipe the input data into the process as a standard input (stdin)
    ```python
    # Begin benchmark and run program
    stdout, stderr, retcode = execute_stdin_subprocess(cmd_list, stream_input=input_data)

    # Return/Output
    print("Return Code: {}".format(retcode))
    if retcode == 0:
        print("Standard Output: {}".format(stdout.strip()))
    else:
        print("Standard Error: [{}]".format(stderr.strip()))
    ```

## Resources

## References

## Remarks
