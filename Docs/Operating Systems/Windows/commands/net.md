# Windows Command Prompt commands : net

## Information
+ Command Type : Networking and Shared Drive

### DESCRIPTION

```
net is a Windows command line utility that connects a computer to and disconnects a computer from a shared resource (i.e. Network Shared Drive)
and/or displays information about the computer connections.

The command also controls persistent net connections.
```

## Documentation

### Synopsis/Syntax

```batchdos
net [command] {options} <arguments>
```

### Parameters

- Commands
    + use [drive-letter]: [remote-filesystem-location] {password} {options}  : Manage Network resources (i.e. Network Shared Drives)
        - Notes
            + Default: 
                - If drive letter and remote filesystem is specified: 
                    + Mount the specified remote filesystem location to the specified drive letter
                - If not specified
                    + Check mounted filesystems
            + Use '*' as the drive letter to select all drives
        - Positionals
            + drive-letter : The drive letter/device you want to mount the remote filesystem with
            + remote-filesystem-location : The target Remote Network Shared Drive (File Server/Volume)
            + password : The password to a specified user; Required if '/USER' is provided.
        - Options
            + /D | /DELETE : Unmount/remove the mounted filesystem
            + /p:{yes|no} : Specify to set persistency when mounting filesystem
            + /USER:[remote-username | {domain\}username | username@domain-name] : Specify the user of the Remote Filesystem to login as

- Optionals
    + /? : Display detailed Documentation of command

### Usage
- To check the mounted filesystem
	```batchdos
	net use
	```

- To connect to a network file server / shared filesystem
	```batchdos
	net use [drive-letter]: \\Computer-Name\[network-shared-drive-to-map]
	```

- To unmount from a network file server / shared filesystem
	```batchdos
	net use [drive-letter]: /delete
	```

- To mount a file server with credentials
    ```batchdos
    net use [drive-letter]: [remote-file-server-volume] "password" /USER:my_username
    ```

## Resources

## References
+ [Microsoft Documentations - Net use](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/gg651155\(v=ws.11\))

## Remarks
