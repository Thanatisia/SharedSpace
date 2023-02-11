# Examples of using python for scripting with subprocess

- Check if child process has been terminated
    - References

    - Code
        ```python
        # Initialize Variables
        cmd = ["cmd", "args", ...]

        # Start
        process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)

        # check if process is alive
        # None : Alive; Not Terminated
        # else : Not Alive; Terminated
        is_alive = process.poll()
        if(is_alive is not None):
            # Alive
        ```	

- Reading process output line by line
    - References
        + https://stackoverflow.com/questions/7468668/python-subprocess-readlines

    - Code
        ```python
        # Initialize Variables
        cmd = ["cmd", "args", ...]
        line_number = 0

        # Start process
        process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE)

        for ln in process.stdout:
            # Process Output (variable 'ln') here 
            line_number += 1
            output = ln.strip().decode("utf-8")
            print("{} : {}".format(line_number, output))
        ```

- Kill a subprocess
    - References
        + https://stackoverflow.com/questions/4084322/killing-a-process-created-with-pythons-subprocess-popen

    - Code
        ```python
        # Initialize Variables
        cmd = ["cmd", "args", ...]

        # Start process
        process = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE

        # Kill process
        process.kill()
        ```

