# Cybersecurity Utility - ARPscan

ARPscan is an ARP scanning utility that is designed to scan network with Layer 2 (Data Link), MAC Address or Ethernet ARP packets

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: ARP Scanner
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: arp-scan
+ Repository URL: 

## Setup

### Pre-Requisites

- Sudo priviledges

### Dependencies

- Download package 'arpscan'
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install arp-scan
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S arp-scan
        ```

### Obtaining

## Documentation

### Synopsis/Syntax

```console
arp-scan {options} [Hosts...]
```

### Parameters

+ --interface=[interface] 			: Specify the target interface
+ -l | --localnet 				: Scan the whole Local Area Network (LAN) with ARP packets
+ -Q [VLAN-ID] 					: Specify your Virtual Local Area Network (VLAN) ID
+ -S [MAC Address] | --srcaddr [MAC Address]  	: Change your destination MAC address
+ -r [PCAP filename]				: Read the provided PCAP file with tcpump
+ -T [MAC address] | --destaddr [MAC Address] 	: Change your source MAC address during the scan; (Default) During the scan process, your existing MAC address will be used
+ -W [PCAP output filename]			: Output responses returned by the scanned hosts and save them in pcap format

### Usage

- To scan a range of .2 to .10 devices on the subnet
	```console
	arp-scan 192.168.8.2 - 192.168.8.10
	```

## Resources

## References
+ [poftut - arpscan command](https://www.poftut.com/arp-scan-command-tutorial-examples/)

## Remarks

## Notes
- Use a '-' to signify a range of devices
