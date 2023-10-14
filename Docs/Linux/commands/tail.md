# Command: tail

```
A file reader command line (CLI) utility that will display the bottom of a specified file
```

## Information
### Basics
+ tail is a simple CLI file read utility that will open a file, read the contents and dump the contents to standard output and go to the bottom of the file
+ The opposite of tail is 'head', which does the opposite and monitors the top of the file instead

## Setup
### Dependencies

### Pre-Requisites

## Documentations

### Synopsis/Syntax
```console
tail {options} <arguments> [file-name]
```

### Parameters
- -F : Monitors a file until you type "Ctrl+C" to exit the process; This parameter makes tail notice when the file has been changed/modfiied
    + This forces tail to periodically check that the file has not been shortened. If either of those events has happened, it reopens the file, dumps the existing content on stdout and continues to tail the new content just like usual.
    - This is handy in situations such as
        + When the log file gets automatically rotated and you want to automatically start following the file
        + Monitoring a log file from the terminal 

### Usage
- Monitor Log file until you type "Ctrl+C" to exit the process
    - Use Cases
        + Log file monitoring during Cybersecurity operations (i.e. SOC Analysis, Data Analysis)
        + Background log file monitoring for sysadmins
        + Used in the Log file monitoring page in the pihole admin page
    ```console
    tail -F [log-file]
    ```

- Monitor a log file, and get it unwrapped and navigable
    - This is similar to
        + journalctl -f
        + kubectl logs -f
    ```console
    tail -f [log-file] | less -S
    ```

- Monitor a file until the grepped text appears
    ```console
    tail -f -n +1 | grep -q [target-text]
    ```

## Wiki

## Resources

## References

## Remarks


