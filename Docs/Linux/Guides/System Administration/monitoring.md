# System Administration - Monitoring

## Log File Monitoring

### Summary
- Log File Monitoring in sysadmin and cybersecurity blue teaming is an important task as you need to constantly look out for changes in made in a system, and the log file output contents.
- Some examples of log file monitoring uses are
    + Pihole admin page: Display of standard output from the tail of the DNS log file

### Snippets and Examples
- Monitor Log file until you type "Ctrl+C" to exit the process
    - Use Cases
        + Log file monitoring during Cybersecurity operations (i.e. SOC Analysis, Data Analysis)
        + Background log file monitoring for sysadmins
        + Used in the Log file monitoring page in the pihole admin page
    - Using tail
        ```console
        tail -F [log-file]
        ```

- Monitor a log file, and get it unwrapped and navigable
    - This is similar to
        + journalctl -f
        + kubectl logs -f
    - Using tail
        ```console
        tail -f [log-file] | less -S
        ```

- Monitor a file until the grepped text appears
    - Using tail
        ```console
        tail -f -n +1 | grep -q [target-text]
        ```

## Resources

## References

## Remarks

