# Linux - Playbook

## Jobs/Processes
- Keybindings
    - 'Ctrl-C' : Terminate a background process by sending the signal SIGINT; Similar to using 'kill -9 [PID]'
    - 'Ctrl-Z' : Frees the terminal; Suspend a foreground job and place into the background; 'Ctrl-Z' will send the signal SIGTSTP

- Bring a background job/process to the foreground
    - Parse the job ID as an argument to the 'fg' command (foreground)
        + This command will brind the specified process into the foreground
        + If no ID is provided, fg will assume that you are calling the current (suspended) job
    ```console
    fg %2
    ```

- Suspended Job
    - Pre-Requisite
        - Find the job ID of the suspended job
            + Use the 'jobs' command
                ```console
                jobs
                ```
    - To run it in the foreground
        + use the 'fg' command'
        ```console
        fg [process-id (pid) / job-id (jid)]
        ```
    - To run it in the background
        + use the 'bg' command
        ```console
        bg [process-id (pid) / job-id (jid)]
        ```

## Resources

## References
+ [baeldung - linux - foreground/background processes](https://www.baeldung.com/linux/foreground-background-process#:~:text=Bringing%20a%20Background%20Job%20to,with%20the%20Linux%20command%20fg.&text=This%20command%20will%20bring%20job,the%20current%20(suspended)%20job.)

## Remarks
