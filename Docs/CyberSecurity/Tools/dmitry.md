# Cybersecurity Utility - dmitry

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Comprehensive Information Gathering
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Reconnaissance
+ Package Name: dmitry
+ Repository URL: [dmitry Kali Docs](https://www.kali.org/tools/dmitry/)

### DESCRIPTION
```
DMitry is the Deepmagic Information Gathering Tool. It is a Command Line Utility written in C and is able to find possible subdomains, email addresses, uptime information, perform TCP port scna, whois lookups and more.

Essentially, DMitry is a UNIX tool for Comprehensive Information Gathering
```

## Setup

### Pre-Requisites

### Dependencies
+ libc6

### Obtaining
- Using Package Manager
	- Debian-based (apt)
		```console
		sudo apt install dmitry
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S dmitry
		```

## Documentation

### Synopsis/Syntax
```console
dmitry {options} [domain]
```

### Parameters
+ -b : Read in the banner received from the scanned port; Requires the '-p' flag to be passed
+ -e : Search for Email Addresses
+ -f : Perform a TCP Port Scan on a host/specified domain showing output reporting filtered ports; Requires the '-p' flag to be passed
+ -i : Run an IP WHOIS Lookup on the specified domain
+ -n : Retrieve Netcraft info of the specified domain
+ -o [output-file] : Save the output to the specified output file
+ -p : Perform a TCP Port Scan on a host/specified domain
+ -s : Search for subdomains
+ -t [0-9] : Set the TTL (Time-to-Live in seconds) when scanning a TCP port (Default: 2); Requires the '-p' flag to be passed
+ -w : Run a WHOIS Lookup on the specified domain
+ -h : Display extra help information on usage

### Usage
- Run 'WINSEPO' domain search
	```console
	dmitry -winsepo example.txt example.com
	```

## Resources

## References
+ [Linux manual - dmitry](https://linux.die.net/man/1/dmitry)
+ [Kali Linux Tools - dmitry](https://www.kali.org/tools/dmitry/)

## Remarks

## Notes
