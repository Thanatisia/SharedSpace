# Linux - Playbook

## Data Management
### File Transfer
- Archive files from your local host system and SSH the archive output into a remote machine via SSH
    ```console
    tar -cvzf - [directories-or-files] | ssh [username]@[domain-or-ip] 'cat > [destination-filepath].tar.gz'
    ```

- SSH into a remote machine and tar compress the specified folder/files, and output the backup file in your local machine
    ```console
    ssh [username]@[domain-or-ip] tar -cvzf - [directories-or-files] > destination/file.tar.gz
    ```

- SSH into a remote machine and tar extract a tar file into the remote machine
    ```console
    cat source/file.tar.gz | ssh [username]@[domain-or-ip] 'tar -xvzf - -C destination/file.tar.gz'
    ```

## Environment Variables
### Keywords
+ USER : To get the user's name
+ SUDO_USER : To get the superuser's name

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
