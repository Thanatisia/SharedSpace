# Linux Security Hardening - Firewall - Using ufw

ufw is the Uncomplicated Firewall. This firewall is designed to be simple to use and will help to protect your linux devices such as
+ Servers
+ Raspberry Pi

## Table of Contents

## Information

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
sudo ufw [[parameters] {arguments}]
```

### Parameters

#### Firewall Rules

+ allow [PORT_NUMBER] : Allow access through a port
+ limit [PORT_NUMBER] : Impose rate limits to limit on the number of connections through a specific port

#### Controls

+ show added : Show all UFW added rules
+ enable : Enable UFW
+ status : Check the status of UFW
