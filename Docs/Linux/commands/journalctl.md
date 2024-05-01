# Linux command: journalctl

## Information
### Description
- In linux, journalctl is a built-in CLI utility used to check system logs
    + journalctl communicates with journald, Linux's journaling system and also where linux will write its status for every process, thread and executions
- Useful for (and used by)
    + System Engineers
    + System Administrators
    + Linux Server Administrators
    + Cybersecurity : Monitoring and Incident Response
- Checking the system logs using the journalctl command is a great way to find clues about what caused the crash. It helps you see events and messages related to the system and its components. 
    + By filtering the logs, you can focus on specific information like errors. 
    + Following the logs in real time can be helpful if you're expecting a crash.

## Documentations
### Synopsis/Syntax
- Default
    ```bash
    journalctl {options} <arguments> {unit}
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        - `-n [limit]` : Limit the number of log entries to display to the specified number. Use this if you only want to display a specific number of log entries
            - limit : Specify the number of log entries to display
                + Type: Integer
        - `-o [output-format]` : Customize the output format to the specified format
            - Output Formats
                + verbose : Display verbose output
        - `-p [priority]` : See only the logs with the specified priority
            - Priorities
                + alert : Alert priority
                + crit : Critical priority
                + debug : Debugging priority
                + err : Error priority
                + emerg : Emergency priority
                + info : Information priority
                + notice : Notice/Advisory priority
                + warning : warning priority
    - Flags
        + -b : See the logs since the last boot
        + -f : Follow the logs in real time. This can be useful if you expect a crash to happen soon
        + --help : Display help message
        + --list-boots : To view information about previous system boots

### Usage
- Determining what caused a system crash
    ```bash
    journalctl -xe
    ```

- See only the logs since the last boot
    ```bash
    journalctl -b
    ```

- See only the logs with error priority
    ```bash
    journalctl -p err
    ```

- Follow the logs in real time. 
    + This can be useful if you expect a crash to happen soon
    ```bash
    journalctl -f
    ```

- Limit the number of log entries to display
    ```bash
    journalctl -n N
    ```

- To view information about previous system boots
    ```bash
    journalctl --list-boots
    ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - Journalctl command in linux with examples](https://www.geeksforgeeks.org/journalctl-command-in-linux-with-examples/)
+ [Libertycenterone - blog - Linux security logs - Detecting unauthorized access with Linux security logs](https://www.libertycenterone.com/blog/linux-security-logs/)
+ [Linkedin - Advice - How can you diagnose system crashes](https://www.linkedin.com/advice/3/how-can-you-diagnose-system-crashes-linux-tools-begrc)

## Remarks

