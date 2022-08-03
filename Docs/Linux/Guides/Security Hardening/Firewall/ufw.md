# Linux Security Hardening - Firewall - Using ufw

## Table of Contents

## Information

### DESCRIPTION

```
ufw is the Uncomplicated Firewall. This firewall is designed to be simple to use and will help to protect your linux devices such as
+ Servers
+ Raspberry Pi

ufw is built on top of iptables. iptables is a very flexible tool but requires a deeper understanding of TCP/IP, thus ufw was created to make firewall management easier and more accessible to everyone.
```

## Setup

### Pre-Requisites

- Update and Upgrade your system
	+ Debian-based
		```console
		sudo apt update && sudo apt upgrade
		```

	+ Arch-based
		```console
		sudo pacman -Syu
		```

### Dependencies

### Installing

+ Aptitude (apt(-get))
	```console
	sudo apt(-get) install ufw
	```

+ Pacman
	```console
	sudo pacman -Syu ufw
	```

### Startup

## Documentation

### Synopsis/Syntax

```console
sudo ufw {options} [arguments]
```

### Parameters

#### Firewall Rules

+ allow [PORT_NUMBER] : Open/Allow a port to pass through
+ deny [PORT_NUMBER]  : Deny/block a port from passing through
+ limit [PORT_NUMBER] : Impose rate limits to limit on the number of connections through a specific port

#### Controls

+ show added : Show all UFW added rules
+ enable : Enable/startup the firewall
+ disable : Disable/Stop the firewall
+ status : Check the status of the firewall

