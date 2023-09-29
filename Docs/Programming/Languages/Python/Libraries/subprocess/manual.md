# Docs - Python Module : subprocess

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

This module is used to reliably handle system commands including running/executing command as well as retrieving command result. 

Other system command execution functions includes 'os.system()'

The Subprocess module class allows python to 
- Interact with the Operating System, perform actions such as
	+ Issue shell comands
	+ Parse user standard input into a process and 
	+ Get command standard output
	+ Error handling 

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

+ python -m pip install subprocess

## Documentation

### Synopsis/Syntax

+ import subprocess

### Module Class

+ CompletedProcess : Stores all values returned from completed processes
+ Popen : The Popen class with the Popen() constructure. Popen is the Pipe Open, allows you to execute multiple commands with pipe support

### Error Types

+ FileNotFoundError : If program does not exist on the target system
+ TimeoutExpired : After process has timed out
+ subprocess.CalledProcessError : A General Error for if the process has an error

### Variables

#### Subprocess
+ CompletedProcess.returncode : Get the return code value stored in the [CompletedProcess] class object
+ CompletedProcess.stdout : Get the standard output attribute of the command's result
+ CompletedProcess.stdin  : Get the subprocess' standard input stream buffer (memory container) object
+ subprocess.PIPE : The PIPE constant; a number that indicates to subprocess that a pipe should be created

#### Subprocess.Popen
+ subprocess.Popen()
    + .stdout: Get the standard output attribute of the process' result while it is still polling/running
    - .stdin : Set the subprocess' standard input method while it is still polling/running
        + .write(buffer-string) : Write the specified buffer string into the subprocess' standard input stream
        + .flush() : Remove and clear all remaining string that were entered into the standard input stream

### Functions

#### Subprocess.Popen
- process = subprocess.Popen(cmd_list, options) : Stands for 'Pipe Open'; Run/execute multiple commands with pipe support; The command creates a pipe and then starts a new process that invokes the shell; The module does not automatically invoke the shell
	- NOTES
		+ Generally if there's an argument that you can pass to run(), you can pass to Popen()
		- Popen is not a blocking call
			+ It will run the process in parallel
			+ Instead of waiting until the process is finished
	- Parameters
		+ cmd_list : type<List>; Set the command string to execute/run; Structure: ["command-name", "argument-1", "argument-2", ..., "argument-n"]
	- Options
		+ stdin=[file object] : Set the file object you want to input into the process; Use this instead of 'input' when using file objects
		+ stderr=[output stream] : Set the standard error stream; Use 'subprocess.PIPE' to create a pipe to link up to the stderr to simulate piping
		+ stdout=[output stream] : Set the standard output stream; Use 'subprocess.PIPE' to create a pipe to link up to the stdout to simulate piping

- exit_Code = process.poll() : Check if a process is still running
	- NOTES
		+ If it is Running : .poll() will return None
		+ Else : It will return the process's exit code

- cmd_stdout = process.stdout.read1() : Reads as many bytes as available in .stdout attribute; is only available on byte streams
- cmd_stdout_Encoded = process.stdout.close() : Close Standard Output
- process_result = process.communicate(options) : Returns a tuple containing the stdout data and stderr data
	- Options
		+ input_data=[input-stream]
		+ timeout=n : Specify a timeout period before the command stops
	- Return 
		+ Type : <tuple>
		+ Value : (stdout_data, stderr_data)

#### Subprocess
- return_code = subprocess.call(cmd_list, options) : Same as Popen and takes all the same arguments, but waits until the command completes and gives the return codes (Blocking call)
	- Parameters
		- cmd_list : 
			+ type<List>; Set the command string to execute/run; Structure: ["command-name", "argument-1", "argument-2", ..., "argument-n"]
			+ type<String>; Set the command string to execute/run; Structure: "command-name arg1 arg2 arg3...argn"
		- Options
			+ Same as subprocess.Popen()
			+ shell: type<Bool>; Specify to use the current shell if true

- completed_process = subprocess.run(cmd_list, options) : Runs a command; Returns the status code of the completed process in an instance of the [CompletedProcess] class
	- NOTES
		+ Beware of security when running dynamic commands in .run() if you plan on getting user input, as it might lead to injection attacks
		+ You cannot pipe processes directly with run()
		- It is a blocking call
			+ It will return the stdout and stderr data once the process has ended
		+ Recommend to use subprocess.Popen instead
	- Parameters
		+ cmd_list : type<List>; Set the command string to execute/run; Structure: ["command-name", "argument-1", "argument-2", ..., "argument-n"]
	- Options
		+ capture_output={True|False} : Get the command's standard output for use later if True; Returns the result in a bytes object if 'encoding' is not specified
		+ check={True|False} : Always raise an exception when a subprocess process fails if True
		+ encoding="encoding-format" : Encode the standard output result to a specific encdoing format
			- Encoding Formats
				+ encoding="utf-8" : Set to UTF-8 (Recommended)
		+ input="delimiter-string" : Returns everything it received from stdin except the delimiter strings; Use this instead of 'stdin' when using bytes objects
		+ shell={True|False} : Automatically use the shell 'sh' if True; Do not need to use the shell if True
		+ stdin=[file object] : Set the file object you want to input into the process; Use this instead of 'input' when using file objects
		+ stderr=[output stream] : Set the standard error stream; Use 'subprocess.PIPE' to create a pipe to link up to the stderr to simulate piping
		+ stdout=[output stream] : Set the standard output stream; Use 'subprocess.PIPE' to create a pipe to link up to the stdout to simulate piping
		+ text={True|False} : Take care of encodings using the default encoding (Recommended to explicitly specify encoding using the 'encoding' argument)
		+ timeout=n : Set timeout to shutdown the process and raise a TimeoutExpired error after n seconds

### Usage

- General Flow
	```python
	import subprocess

	
	```

- Execute a shell command 
	- With UNIX-based shells
		```python
		import subprocess
		subprocess.run(["bash", "-c", "your-command"]) # Run the command in the shell
		```

	- With With Powershell
		```python
		import subprocess
		subprocess.run(["pwsh", "-Command", "your-command"]) # Run the command in the command prompt
		```

	- With Windows Shells
		```python
		import subprocess
		subprocess.run(["cmd", "/c", "your-command"]) # Run the command in the command prompt
		```

- Execute a shell command and get command standard output 
	- without Encoding (Bytes output)
		```python
		cmd_out = subprocess.run(["cmd"], capture_output=True)
		print(cmd_out.stdout) # type <bytes>
		```
	- with Encoding
		```python
		cmd_out = subprocess.run(["cmd"], capture_output=True, encoding="utf-8")
		print(cmd_out.stdout) # type <str>
		```

- To decode a bytes object
	+ Use 'bytes_obj.decode("encoding-format")'
		```python
		cmd_out = subprocess.run(["cmd"], capture_output=True)
		cmd_out.stdout.decode("utf-8") # type<str>
		```

- Piping UNIX-based shell commands
	- Using subprocess.run
		```python
		import subprocess
		cmd_1_process = subprocess.run([command-1], stdout=subprocess.PIPE)
		cmd_2_process = subprocess.run([command-2-pipe], input=cmd_1_process.stdout, stdout=subprocess,PIPE) # take in the value found in 'input' and input into command-2, then output the standard output as pipe
		print(cmd_2_process.stdout.decode("utf-8"))
		```
	- Using Popen
		```python
		import subprocess
		# Start 2 processes in parallel and
		# join with a common pipe
		cmd_1_process = subprocess.Popen([command-1], stdout=subprocess.PIPE)
		cmd_2_process = subprocess.Popen([command-2-pipe], stdin=cmd_1_process.stdout, stdout=subprocess.PIPE)

		# Read the pipe at stdout to output the lines
		for line in cmd_2_process.stdout:
			# For every output received in the pipe
			# Decode the bytes object into string
			decoded_line = line.decode("utf-8")

			# and strip/remove all ending spaces
			stripped_line = decoded_line.strip()

			# print result
			print(stripped_line)
		```

- Checking if a process is alive
    - Explanation
        + Polling is the process where the computer or controlling device waits for an external device to check for its readiness or state, often with low-level hardware
        - To check if the process is alive or dead/ended
            + Use the '.poll()' functions
            - If it returns None:
                + Alive
            - If it doesnt return None:
                + Dead
    ```python
    from subprocess import Popen, PIPE

    # Initialize Variables
    cmd = "your command here"
    line = "" # Temporary storage for each new line

    # Open Subprocess
    proc = Popen(cmd.split(), stdout=process.PIPE, **opts)

    # Poll the process to check if it is alive
    # If it returns None == Alive
    # If it doesnt return None == Ended/Dead
    is_alive = proc.poll()
    while is_alive is None:
        # While the process is still working
        print("Loading...")

        # Still working
        print("Line: {}".format(line))
        
        # Check if standard output stream is empty
        if proc.stdout != None:
            line = proc.stdout.readline()

        # Poll and check if is alive
        # If poll == None: Alive, else not Alive
        is_alive = proc.poll()
        print("Status: {}".format(is_alive))

    # Get output, error and status code
    stdout = proc.stdout
    stderr = proc.stderr
    resultcode = proc.returncode
    # stdout, stderr, resultcode = process.chroot_exec(root_passwd_change)
    if resultcode == 0:
        # Success
        print("Standard Output: {}".format(stdout))
    else:
        # Error
        print("Error: {}".format(stderr))
    ```

- Terminal I/O (Input/Output) Operations within a subprocess
    - Explanations
        - stdin
            - Use Popen().stdin.write("buffer-string") to effectively input/write the target string into the subprocess' stdin buffer stream
                + Entering text into the stdin buffer stream via '.write()' is equivalent to you entering the tty via SSH, running the command and typing, and then pressing 'Enter'
                + You can repeat `proc.stdin.write(line)` as many times as you need to enter into the system
            - However, after using .stdin.write()
                + you need to clear/"flush" the remaining string/text cache that you have entered so that it does not overflow to the next command
        - Useful for subprocess/terminal operations that requires stdin and confirmations
            - such as
                + passwd
    - Using Popen
        ```python
        from subprocess import Popen, PIPE

        # Initialize Variables
        cmd = "your command here"
        line = "" # Temporary storage for each new line

        # Open Subprocess
        proc = Popen(cmd.split(), stdout=process.PIPE, **opts)

        # Poll the process to check if it is alive
        # If it returns None == Alive
        # If it doesnt return None == Ended/Dead
        is_alive = proc.poll()
        while is_alive is None:
            # While the process is still working
            print("Loading...")

            # Still working
            print("Line: {}".format(line))
            
            # Check if standard output stream is empty
            if proc.stdout != None:
                line = proc.stdout.readline()

            # Check if standard input stream is empty
            if proc.stdin != None:
                # Check if line is entered
                if line != "":
                    # Write this buffer string into the process' stdin
                    # Repeat this as many times as you need to enter into the system
                    proc.stdin.write('{}\n'.format(line))

                    # Flush the standard input stream
                    proc.stdin.flush()

            # Poll and check if is alive
            # If poll == None: Alive, else not Alive
            is_alive = proc.poll()
            print("Status: {}".format(is_alive))

        # Get output, error and status code
        stdout = proc.stdout
        stderr = proc.stderr
        resultcode = proc.returncode
        # stdout, stderr, resultcode = process.chroot_exec(root_passwd_change)
        if resultcode == 0:
            # Success
            print("Standard Output: {}".format(stdout))
        else:
            # Error
            print("Error: {}".format(stderr))
        ```

- To execute commands into a subprocess running chroot
    - Using Popen
        ```python
        from subprocess import Popen, PIPE

        # Initialize Variables
        chroot_exec = "chroot"   # Your chroot executable of choice
        dir_Mount = "/mnt"       # Mount point to chroot
        shell = "/bin/bash"      # Your shell
        cmd_str = "some-command" # Your command of choice to execute

        # Design and formulate your command list
        cmd = [chroot_exec, dir_Mount, shell, "-c", cmd_str]

        # Open Subprocess
        proc = subprocess.Popen(cmd, stdout=PIPE, stdin=PIPE, **opts)

        # Execute process in sync - check if the previous command is completed before proceeding
        stdout, stderr = proc.communicate(**opts)

        # Decode and clean-up output
        stdout = stdout.decode("utf-8")
        stderr = stderr.decode("utf-8")

        # Get result code from process pipe
        resultcode = proc.returncode

        print("Standard Output    : {}".format(stdout))
        print("Standard Error     : {}".format(stdout))
        print("Result/Status Code : {}".format(stdout))
        ```

- Operate within a lifetime of the subprocess
    - Explanation
        - Use the 'with' keyword
            + The class will exit and close once the operation has ended
    - Using Popen
        ```python
        from subprocess import Popen, PIPE

        # Initialize Variables

        # Open Subprocess
        with Popen(cmd_str.split(), **opts) as proc:
            # Operations here
            # ...
            stdout, stderr = proc.communicate()
            print(stdout.decode("utf-8"))
            print(stderr.decode("utf-8"))

        # On completion, the process 'proc' will exit and end
        print("End")
        ```

## References

## Resources

+ [BogoToBogo - Subprocess](https://www.bogotobogo.com/python/python_subprocess_module.php)
+ [RealPython - Subprocess](https://realpython.com/python-subprocess/)

## Remarks

