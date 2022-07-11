# Docs - Python Module : scapy

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [References](#references)
- [Resources](#resources)
- [Remarks](#remarks)

## Information

+ Package Type : Infosecurity

### Description
scapy is a network packet analysis module/package that enables the user to generate, modify, capture, dissect and transmit network packets.
- This capability allows construction of tools that can
    + probe networks
    + scan networks
    + attack networks

## Setup

### Pre-Requisites

- python
- pip

### Obtaining

+ python -m pip install scapy

## Documentation

### Synopsis/Syntax

+ import scapy.all
+ from scapy.all import *
+ from scapy.layers.l2 import *
+ from scapy.layers.inet import *

### Module Class

- scapy.all : All Scapy 
    + ARP : Get ARP packets
    + Ether : Ethernet Interface
    + IP : Get TCP/IP Packets
    + ICMP : Get ICMP Packets
- scapy.layers.l2 : Layer 2 (Data Link)
    + ARP : ARP Packets
- scapy.layers.inet : Internet Layer Class
    + IP : Get TCP/IP Packets
    + TCP : TCP Packets
    + ICMP : Get ICMP Packets
- scapy.utils : Scapy Utilities

### Error Types

### Variables

- scapy.all.IP
    + IP().ttl : Time-to-Live
    + IP().dst : Destination IP Address
    + IP().src : Source IP Address

### Functions
- scapy.all.Ether
    + Ether() : Generate Ethernet Interface packet object
- scapy.all.IP
    - IP() : Generate IP packet object
        - Parameters
            + dst="X.X.X.X" : Destination IP Address
- scapy.all.TCP
    - TCP() : Generate TCP packet object
        - Parameters
            + dport=n : Destination Port
            - flags="{A|S}" : Packet flags
                + "A" : "ACK"
                + "S" : "SYN"
- scapy.all
    + sr() : To Send packets and Receive corresponding answers; Returns multiple answers/replies
    + sr1() : Returns only one answer
- scapy.utils
    + rdpcap(".pcap file name") : Read a pcap file and import into program

### Usage

- General Flow
	```python
	from scapy.all import *
    
    # Processes
	```

## References

## Resources

+ [ReadTheDocs - Scapy](https://scapy.readthedocs.io/en/latest/functions.html)

## Remarks

