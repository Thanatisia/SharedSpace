# Cybersecurity Utility - ARPspoof

ARPspoof is an ARP spoofing/poisoning utility

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: ARP Spoofing/Poisoning
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: dsniff
+ Repository URL: 

## Setup

### Pre-Requisites

- Enable IP forward to make packets go through the attacker's device
    + echo 1 > /proc/sys/net/ipv4/ip_forward

### Dependencies

### Installing

- If installing via Package Manager
	- Debian-based (apt)
		```console
		sudo apt update

		sudo apt install dsniff
		```

## Documentation
### Synopsis/Syntax
+ arpspoof {options} [arguments...]
### Parameters
+ -i [interface]    : Specify your target interface
+ -t [Target to trick] [Attacker host device to Spoof]   : Specify your targets on the interface to trick that the attacker is the spoof device
### Usage
+ To trick Target-A to think that the Attacker is Target B
    ```console
    arpspoof -i eth0 -t 10.0.1.3 (Target to trick) 10.0.1.1 (Default Gateway / Attacker's target to spoof)
    ```
+ To trick the default gateway that the attacker is the target host
    ```console
    arpspoof -i eth0 -t 10.0.1.1 10.0.1.3
    ```

## Resources

## References

## Remarks

## Notes
- Check if attack is successful
    + Run arp -a (on the target’s machine) to check whether the MAC address of the default gateway has been changed
    + In the scenario above, Host A will see 51:35:23:43:12:33 as the MAC address of Default Gateway, whose real MAC address is 11:22:33:5:22:115

