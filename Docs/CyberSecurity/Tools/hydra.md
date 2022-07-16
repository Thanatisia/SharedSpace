# Cybersecurity Utility - [name-of-utility]

Hydra is one of the most popular Online Brute-force password cracking tools, as well as the fastest network logon cracker which supports numerous attack protocols

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Password Cracker
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Enumeration
+ Package Name: thc-hydra
+ Repository URL: https://github.com/vanhauser-thc/thc-hydra

## Features
- Makes use of numerous protocols including 
    + ftp
    + http
    + ssh
    + smtp
    + POP3
    + mysql
    + etc
- Supports multiple connections
    + parallel attacks
- List of candidate passwords should be provided
    + Can be obtained externally

## Setup

### Pre-Requisites
+ base-devel
+ gcc
+ make
+ git

### Dependencies
+ libssl-dev 
+ libssh-dev 
+ libidn11-dev 
+ libpcre3-dev 
+ libgtk2.0-dev 
+ libmysqlclient-dev 
+ libpq-dev 
+ libsvn-dev 
+ firebird-dev 
+ libncp-dev


### Obtaining

+ Hydra is pre-built on Kali Linux

- Using git
	- Clone the repository
		```console
		git clone https://github.com/vanhauser-thc/thc-hydra.git
		```
	- Change directory into the repository
		```console
		cd thc-hydra
		```
	- Configure
		```console
		./configure
		```
	- Compile the binary
		```console
		make
		```
	- Install hydra
		```console
		make install
		```

## Documentation

### Synopsis/Syntax

- For CLI
	```console
	hydra {options} [target-ip-address] [protocol]
	```

- For CLI-wizard
	+ Guided step-by-step version
	```console
	hydra-wizard
	```

- For GUI
	```console
	xhydra
	```

### Parameters

+ -l [login name]           : Login with the specified login name
+ -P [password list file]   : Specify the password list to load into hydra; Loads several passwords saved in the specified file
+ -t [number of tasks]      : Specify the number of tasks (aka Parallel connections) per target; Default 16
+ -v                        : Set verbose flag to 'True'; Display detailed standard output
+ -V                        : Shows every password being tried

### Usage

- Brute Forcing
    + Number of parallel connections : 16 connections, 
    + login as 'victim'
    + using the password list found in /usr/share/john/password.list 
    + victim's IP address : metasploitable
    + via protocol : FTP
    ```console
    hydra -t 16 -l victim -P /usr/share/john/password.list -vV <metasploitableIP> ftp
    ```

## Resources

## References
+ [linuxhint - Crack web based login page with hydra in Kali Linux](https://linuxhint.com/crack-web-based-login-page-with-hydra-in-kali-linux/)

## Remarks

## Notes
