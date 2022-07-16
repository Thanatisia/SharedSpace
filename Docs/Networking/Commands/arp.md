# Networking Command : arp

This arp command manipulates the System’s ARP cache, and also allows a complete dump of the ARP cache. 

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

arp is the Address Resolution Protocol. The primary function of this protocol is to resolve and map the IP address of a system to its mac address, and hence it works between level 2(Data link layer) and level 3(Network layer).

### Files related to ARP
+ /proc/net/arp
+ /etc/networks
+ /etc/hosts
+ /etc/ethers

## Setup

### Pre-Requisites

NIL

### Dependencies

+ Built-in

## Documentation

### Synopsis/Syntax

arp {options} [hostname]

### Parameters

+ -a [hostname] | -all [hostname] : Show entries to specified host; Default: If nothing is passed, all entries will be displayed
+ -C : Complete Entry
+ -d [hostname] | -delete [hostname] : removes any entry for the specified host
+ -D [hostname] | -use-device [hostname] : Use the given interface's hardware address
+ -e : Show the entries in default (Linux) Style
+ -f [filename] : Works same as -s but instead of giving the entries manually, it takes entry from the file given as its parameter
+ -H [type] | -hw-type [type] | -t [type] : Tells arp which class of entries it should check for. Default value : ether
	- Hardware Types
		+ ash : Ash
		+ ether : Ethernet
		+ ax25 : AMPR AX.25
		+ netrom : AMPR NET/ROM
		+ rose : AMPR ROSE
		+ arcnet : ARCnet
		+ dlci : Frame Relay DLCI
		+ fddi : Fiber Distributed Data Interface
		+ hippi : HIPPI
		+ irda : IrLAP
		+ x25 : generic X.25
		+ eui64 : Generic EUI-64
+ -i [interface] | -device [interface] : Select an interface
+ -M : Permanent Entry
+ -P : Published Entry
+ -s [host_ename] [hw_address] : Manually create an ARP address mapping entry for the host hostname with its MAC address as [hw_address]
+ -n | --numeric : Shows numerical addresses instead of symbolic host, port or usernames
+ -v | --verbose : Set verbose flag to True. Displays verbose standard output with more detailed messages

### Usage

## Remarks

## Resources

## References
