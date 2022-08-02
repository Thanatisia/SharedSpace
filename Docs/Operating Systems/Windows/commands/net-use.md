# Windows Command Prompt commands : net use

## Information
+ Command Type : Networking and Shared Drive

### DESCRIPTION

```
net use is a Windows command line utility that connects a computer to and disconnects a computer from a shared resource (i.e. Network Shared Drive)
and/or displays information about the computer connections.

The command also controls persistent net connections
```

## Documentation

### Synopsis/Syntax

```batchdos
net use 
```

### Parameters
+ /delete : Unmount/remove the mounted filesystem

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

## Resources

## References
+ [Microsoft Documentations - Net use](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/gg651155\(v=ws.11\))

## Remarks