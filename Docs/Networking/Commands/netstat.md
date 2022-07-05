# Networking Command : netstat

netstat is a Networking command-line utility used by System Administrators to check on your network status, configuration and activity.

- It shows details such as
	+ Open Ports 
	+ Addresses
	+ Routing table
	+ masquerade connections

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

+ Package Name: net-tools

## Setup

### Pre-Requisites

### Dependencies

- Official Repository
	- If package manager is apt|apt-get (Debian-based)
		```console
		sudo apt(-get) install net-tools
		```
	- If package manager is pacman (Arch-based)
		```console
		sudo pacman -S net-tools
		```

## Documentation

### Synopsis/Syntax

netstat {options}

### Parameters

+ -a : Print all kernel interfaces
+ -i : Show statistics for the currently configured network interfaces
+ -l : Display/list all active listening connections
+ -n : View list of networks
+ -p : View ports
+ -r : Show routing table
+ -s : Displays protocol-specific statistics
+ -t : View active TCP socket connections
+ -u : View active UDP socket connections
+ -w : View active RAW socket connections
+ -x : View active Unix socket connections
+ -v : Check installed version

### Usage

+ Display all listening ports of TCP and UDP connections
	```console
	netstat -a | more
	```

+ Display list of only TCP port connections
	```console
	netstat -at
	```


## Remarks

## Resources

## References
+ [linuxhint - Install netstat command](https://linuxhint.com/install-netstat-command-linux/#:~:text=Netstat%20is%20a%20command%2Dline,routing%20table%2C%20and%20masquerade%20connections.)
