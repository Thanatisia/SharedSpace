# Linux - System Administration and Cybersecurity Investigations: Checking system logs

## System crash
### Checking system logs
- Key Log Files
    - In Debian-based distributions, key log files include:
        + '/var/log/auth.log': contains records of authentication attempts (by SSH) including successful nd failed logins, sudo usage and other security-related events
        + '/var/log/syslog'  : General system log file containing messages from various system services and kernel events.
        + '/var/log/kern.log': Contains kernel-related messages and activities, which can be helpful in identifying hardware issues or kernel exploits.
    - In Red Hat Enterprise Linux (RHEL) and other RHEL-based distributions, the key log files are:
        + '/var/log/secure'  : Similar to /var/log/auth.log in Debian-based systems, it records authentication attempts, sudo usage, and other security-related events.
        + '/var/log/messages': Equivalent to /var/log/syslog in Debian-based systems, this file contains general system messages and events from various services.
        + '/var/log/dmesg'   : Stores kernel-related messages and activities, similar to /var/log/kern.log in Debian-based systems

- Following the contents of '/var/log/messages' containing the system messages
    ```bash
    tail -f /var/log/messages | grep -e 'IP'
    ```

- Using journalctl to view the system logs
    - Checking the system logs using the journalctl command is a great way to find clues about what caused the crash.
        + It helps you see events and messages related to the system and its components. 
        - By filtering the logs, 
            + you can focus on specific information like errors. 
            + Following the logs in real time can be helpful if you're expecting a crash.
    ```bash
    journalctl -xe
    ```

- Checking kernel messages using 'dmesg'
    - Explanation
        - Parameters
            + '-I err,crit,alert,emerg' : See only the messages with high severity levels
            + '-T' will show the kernel messages with human-readable timestamps
            + '-w' will watch the kernel messages in real time. This can be helpful if you want to catch a kernel panic before the system reboots
    ```bash
    dmesg -T
    ```

## Investigating Unauthorized Access
### Checking system logs
- Following the contents of '/var/log/auth.log'
    - Filter the failed login attempts in the log file
        ```bash
        grep 'Failed password' /var/log/auth.log
        ```
    - Filter the unauthorized root access in the log files to check for suspicious root access. 
        - Here, we’re using grep to filter /var/log/auth.log for instances of successful root logins. 
            + If you see unfamiliar IP addresses or login times, it could indicate unauthorized access.
        ```bash
        grep 'Accepted password' /var/log/auth.log | grep 'root'
        ```

## Wiki
### Useful Tools
+ Snort : FOSS IDS/IPS service. Can help identify patterns that may suggest unauthorized access including repeated failed login attempts
+ Fail2Ban: Automatically blocks suspicious IP addresses based on pre-defined rules

## Resources

## References
+ [Libertycenterone - blog - Linux security logs - Detecting unauthorized access with Linux security logs](https://www.libertycenterone.com/blog/linux-security-logs/)
+ [Linkedin - Advice - How can you diagnose system crashes](https://www.linkedin.com/advice/3/how-can-you-diagnose-system-crashes-linux-tools-begrc)

## Remarks

