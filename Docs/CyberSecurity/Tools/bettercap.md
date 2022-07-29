# Cybersecurity Utility - [name-of-utility]

Bettercap is a powerful, extensible and portable framework written in Go for 802.11, BLE, IPv4 and IPv6 networks reconnaissance and MITM attacks.

Bettercap also has a ncurses mode that allows for Terminal User Interface

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Customization and Configuration](#customization-and-configuration)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Network Reconnaissance, Man-in-the-Middle Attacks
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Reconnaissance, Scanning & Enumeration
+ Package Name: bettercap
+ Repository URL: https://salsa.debian.org/pkg-security-team/bettercap

## Setup

### Pre-Requisites
+ sudo priviledges

### Dependencies

+ ca-certificates
+ iproute2
+ iptables
+ iw
+ libc6
+ libnetfilter-queue1
+ libpcap0.8
+ libusb-1.0-0

### Obtaining

- Download package 'bettercap'
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install bettercap
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S bettercap
        ```

## Documentation

### Synopsis/Syntax

```console
bettercap {options}
```

### Parameters

+ -autostart [string] 		: Comma separated list of modules to auto start. (default "events.stream")
+ -caplet [file-name]		: Read commands from this file and execute them in the interactive session; Parse a file of commands into Bettercap to execute
+ -caplets-path [string]	: Specify an alternative base path for caplets.
+ -cpu-profile [file]		: Write cpu profile file.
+ -debug			: Print debug messages.
+ -env-file [string] 		: Load environment variables from this file if found, set to empty to disable environment persistence.
+ -eval [commands]		: Run one or more commands separated by ; in the interactive session, used to set variables via command line; Use this to parse commands into bettercap to execute
+ -gateway-override [gateway]	: Use the provided IP address instead of the default gateway. If not specified or invalid, the default gateway will be used.
+ -iface [interface]		: Network interface to bind to, if empty the default interface will be auto selected.
+ -mem-profile [output-file] 	: Write memory profile to file.
+ -no-colors			: Disable output color effects.
+ -no-history			: Disable interactive session history file.
+ -pcap-buf-size [int]		: PCAP buffer size, leave to 0 for the default value. (default -1)
+ -script [script-name] 	: Load a session script.
+ -silent			: Suppress all logs which are not errors.
+ -version			: Print the version and exit.

### Usage

- To run a caplet
	```console
	bettercap -iface eth0 -caplet caplet-file.cap
	```

### Commands
```
To be used in the ncurses TUI (Terminal User Interface)
```
+ Default Commands: clear; net.show

#### Passive Monitoring
+ net.show : LAN Monitoring; To display the list of detected hosts on the local network

#### Active Monitoring
+ arp.spoof {on|off}	: Launch ARP spoofing
+ net.probe {on|off} 	: Actively look for hosts, sending dummy UDP packets to every possible IP on the subnet
+ net.sniff {on|off}	: Run the sniffer
+ ticker {on|off}	: Periodically execute a given set of command, not all one time; Slowly execute the commands

### Variables
```console
# To set a variable
use set.[variable] {values} 
```
#### ARP Spoof
+ arp.spoof.fullduplex {true|false} : Enable ARP Poisoning/Spoofing (Full Duplex)
+ arp.spoof.targets [specify targets (seperate by comma-delimited] : Specify your targets to spoof

#### Sniffing
+ net.sniff.local {true|false} : Enable Local Network Sniffing

#### ticker
+ ticker.commands [commands] 	: Set the commands to execute slowly
+ ticker.period [seconds]	: Set the period to the specified seconds; Default = 1 second

### sniff
+ net.sniff.verbose {true|false} : Set verbosity of the sniff output

## Customization and Configuration

### Scripting

- Perform ARPspoof on Bettercap
	> Write the following into a caplet file (*.caplet)
	```console
	net.probe on
	set arp.spoof.fullduplex true
	set arp.spoof.targets [target IP]
	arp.spoof on
	net.sniff on
	```

### Scripts
+ hstshijack : A caplet script that allows for SSL Stripping (HTTPS downgrading to HTTP)

## Resources

## References
+ [Kali Packages - Bettercap](https://www.kali.org/tools/bettercap/)
+ [kalitut - How to install and use Bettercap](https://kalitut.com/how-to-install-and-use-bettercap/)

## Remarks

## Notes
