# Linux command: dmesg

## Information
### Description
- In linux, dmesg is a built-in CLI utility used to check kernel-related messages retrieved from the kernel ring buffer
    + The ring buffer stores information about hardware, device driver initialization, and messages from kernel modules that take place during system startup

- Useful for (and used by)
    + System Engineers
    + System Administrators
    + Linux Server Administrators
    + Cybersecurity : Monitoring and Incident Response

+ The dmesg command is invaluable when troubleshooting hardware-related errors, warnings, and for diagnosing device failure.

## Documentations
### Synopsis/Syntax
- Default
    ```bash
    dmesg {options} <arguments>
    ```

### Parameters
- Positionals
- Optionals
    - With Arguments
        - `-f | --facility [facilities,...]` : Restricts output to the specified comma-separated facility (i.e. daemon) list
            - List
                + Format: facility-1,facility-2,...
            - Facilities
                + daemon : System services
        + `-L | --color[=auto|never|always]` : Adds color to the output. Omitting the [auto|never|always] arguments defaults to auto.
        - `-l | --level [severity-levels,...]` : Restricts the output to the specified comma-separated level list.
            - Severity Levels
                + alert : Alert; Action must be taken immediately
                + crit : Critical conditions
                + debug : Debug-level messages
                + err : Error conditions
                + emerg : Emergency; The system is unusable
                + info : Information
                + notice : Notice/Advisory; Normal, but significant condition
                + warning : warning conditions
        - `--time-format [format]` : Prints timestamps using the specified [format]. 
            - The accepted formats are 
                + ctime
                + reltime
                + delta
                + iso (a dmesg implementation of the ISO-8601 format).
    - Flags
        + `-C | --clear` : Clears the ring buffer.
        + `-c | --read-clear` : Prints the ring buffer contents and then clears.
        + `-H | --human` : Enables a human-readable output.
        + `--noescape` : Disables the feature of automatically escaping unprintable and potentially unsafe characters.
        + `-S | --syslog` : Instructs dmesg to use the syslog kernel interface to read kernel messages. The default is to use /dev/kmsg instead of syslog.
        + `-s | --buffer-size [size]` : Uses the specified buffer size to query the kernel ring buffer. The default value is 16392.
        + `-T | --ctime` : will print/show the kernel messages with human-readable timestamps
        + `-t | --notime` : Instructs dmesg not to print kernel's timestamps.
        + `-w | --follow` : will watch the kernel messages in real time. This can be helpful if you want to catch a kernel panic before the system reboots. The feature is available only on systems with a readable /dev/kmsg file.
        + `-x | --decode` : Decodes the facility and level numbers to human-readable prefixes.
        + `-h | --help` : Displays the help file with all the available options.

### Usage
- Checking kernel messages using 'dmesg' during system crash and investigations
    - Show the kernel messages with human-readable timestamps
        ```bash
        dmesg -T
        ```
    - Show only the kernel messages with high severity levels
        ```bash
        dmesg -l err,crit,alert,emerg
        ```
    - watch the kernel messages in real time. 
        + This can be helpful if you want to catch a kernel panic before the system reboots
        ```bash
        dmesg {-w | --follow}
        ```

- Display colored messages
    ```bash
    sudo dmesg -L
    ```

- Search for a specific term
    + Pipe the dmesg output into 'grep'
    ```bash
    dmesg | grep -i keyword
    ```

- Display human-friendly timestamps
    ```bash
    dmesg {-H | --human}
    ```

- Filtering messages by facility
    - Daemon
        ```bash
        sudo dmesg -f daemon
        ```

## Wiki

## Resources

## References
+ [GeeksForGeeks - How to view kernel messages in linux using dmesg](https://www.geeksforgeeks.org/how-to-use-the-dmesg-command-on-linux/)
+ [Linkedin - Advice - How can you diagnose system crashes](https://www.linkedin.com/advice/3/how-can-you-diagnose-system-crashes-linux-tools-begrc)
+ [pheonixnap - dmesg linux](https://phoenixnap.com/kb/dmesg-linux)

## Remarks


