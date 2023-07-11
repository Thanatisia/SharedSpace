# Python: Using Pipes

## Table of Contents
+ [Basics](#basics)
+ [Setup](#setup)
+ [Wiki](#wiki)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Basics
+ Pipe as a general concept is basically the idea of redirecting an output after running/execution into a buffer/memory object in another location
    - In Operating Systems 
        + Pipe allows you to send the stdout of command-1 into the stdin of command-2 for use
            ```console
            command-1 | command-2 {options} <arguments>
            ```

- Subprocess function and definitions
    - subprocess.Popen([cmd-list], **options) : This will open up a subprocess object and effectively create a new process
        - Retrieving standard output (stdout)
            - Using 'subprocess.Popen().communicate()'
                - This will synchronize and automatically check that other process paths before this are completed to avoid collision
                    + Effectively, this is similar to running `.poll()` + `.wait()`
                - However, using this will not allow you to output the stdout in real time/line-by-line
                    + The output will not show something until the program (or command) is executed in a separate process using the Subprocess command.
            - Using 'poll()' checks if the process has been terminated
                + `subprocess.poll() == None`: The process has not yet been terminated
                + `subprocess.poll() != None`: The process has been terminated
                - Check 'if nextline == "" and process.poll() is not None:' to see if the process has been terminated
                    - `break` if it has 
                    - else: There are still lines in the process
                        + Format and manage the data
                        + Print out the data if you require real-time output

## Setup
### Dependencies
- subprocess

## Wiki
### Snippets and Examples
- Basic implementation
    - Notes
        - In python, you use the 'subprocess' module/library to perform system commands on the (as the name suggests) subprocess level
            + However, when executing the command as a subprocess, there are multiple ways of piping the standard output (stdout) out to a variable
    - Methods
        - Using 'subprocess.Popen().communicate()'
            - This will synchronize and automatically check that other process paths before this are completed to avoid collision
                + Effectively, this is similar to running `.poll()` + `.wait()`
            - However, using this will not allow you to output the stdout in real time/line-by-line
                + The output will not show something until the program (or command) is executed in a separate process using the Subprocess command.
            ```python
            def exec_return(cmd:str):
                """
                Execute command specified and 
                Return the stdout result using PIPE

                :: Params
                :: Positionals
                ::  - cmd : The command string to execute
                ::      Type: <string>
                ::
                ::  - verbose : If want to enable verbose output
                ::      Type: <boolean>
                ::      Valid Values: True|False
                """
                # Initialize Variables
                out:list = []

                if(cmd != ""):
                    # Prepare command list
                    cmd_list = cmd.split(" ") # Split the command string into a space-delimited list
                    cmd_exec = cmd_list[0] # First index is the executable
                    cmd_args = cmd_list[1:] # Consecutive elements are the arguments
                    cmd_run = [cmd_exec, *cmd_args] # Create a run list with [0] = Executable and all consecutive arguments are expanded into a list of all options/arguments

                    # Begin
                    with subprocess.Popen(cmd_run, stdout=subprocess.PIPE) as process:
                        print("Input Command: {}".format(cmd_run))
                        # Poll
                        poll_value = process.poll() # Poll

                        # Get standard output
                        if(process.stdout != None):
                            # Communicate and Decode stdout string
                            stdout_val = process.communicate()[0].decode("utf-8").split("\n")[1:] # [0] = stdout, [1] = Error/exit status code

                            # append into stdout list
                            out = stdout_val

                            # Close subprocess after use
                            process.stdout.close()

                # Return output
                return out
            ```

        - Using 'subprocess.Popen().poll()'
            - If you need to synchronize and wait for previous subprocesses to end
                + Use 'subprocess.Popen().wait()'
                + This will give you better control
            ```python
            def exec_return_real_time(cmd:str, real_time=False):
                """
                Execute command specified and 
                Return the stdout result using PIPE 
                in real time

                :: Params
                :: Positionals
                ::  - cmd : The command string to execute
                ::      Type: <string>
                ::
                ::  - real_time : If want to enable Real Time Output; 
                ::      - Notes
                ::          + Remove all display of output in the references if you enable this
                ::      Type: <boolean>
                ::      Valid Values: True|False
                """
                # Initialize Variables
                out:list = []
                nextline:str = ""

                # Process PIPE/subprocess system calls
                if(cmd != ""):
                    # Prepare command list
                    cmd_list = cmd.split(" ") # Split the command string into a space-delimited list
                    cmd_exec = cmd_list[0] # First index is the executable
                    cmd_args = cmd_list[1:] # Consecutive elements are the arguments
                    cmd_run = [cmd_exec, *cmd_args] # Create a run list with [0] = Executable and all consecutive arguments are expanded into a list of all options/arguments

                    # Begin
                    with subprocess.Popen(cmd_run, stdout=subprocess.PIPE) as process:
                        # Do a loop to check if there are still lines from the process
                        while True:
                            # Get next line in the process stdout
                            nextline = process.stdout.readline().decode("utf-8")

                            # poll to check if is still alive
                            poll = process.poll()

                            """
                            - Check if process has been terminated
                                process.poll() == None: The process has not yet been terminated
                                process.poll() != None: The process has been terminated
                            """
                            if nextline == "" and poll is not None:
                                # Process has terminated
                                # print("Process has been terminated.")
                                break
                            elif nextline:
                                # There are still nextline

                                ## Format data
                                data = nextline.replace("\r\n", "\n").rstrip()

                                ## Manage data
                                out.append(data)

                                ## Check if realtime output is enabled
                                if(real_time):
                                    print(data)

                        ## Communicate and Decode stdout string
                        # out = process.communicate()[0].decode("utf-8").split("\n")[1:] # [0] = stdout, [1] = Error/exit status code
                        # exit_code = process.returncode

                # Return output
                return out
            ```

## Resources

## References
+ [EndPointDev - 2015-01 - Python Getting realtime output](https://www.endpointdev.com/blog/2015/01/getting-realtime-output-using-python/)

## Remarks
