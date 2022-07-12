# Cybersecurity Utility - theHarvester

scapy is a network packet analysis program that enables the user to generate, modify, capture, dissect and transmit network packets.
- This capability allows construction of tools that can
    + probe networks
    + scan networks
    + attack networks

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

+ Utility Type: Network Packet Analysis
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: scapy (for python2) | python3-scapy (python3+)
+ Repository URL: [scapy](https://github.com/secdev/scapy)

## Setup

### Pre-Requisites

+ Install git : To clone the repository

### Dependencies

+ python
+ pip

### Obtaining

+ On Kali Linux : This is built-in to kali linux
- From Package Manager
    - Package Manager is apt|apt-get (Debian-based)
        ```console
        sudo apt(-get) install python3-scapy
        ```
    - Package Manager is pacman (Arch-based)
        ```console
        sudo pacman install scapy
        ```
- From python-pip
    ```console
    python -m pip install scapy
    ```

## Documentation

### Synopsis/Syntax

+ Starting scapy : scapy
- Stacking packet : low-level-protocol()/higher-level-protocol()/"payload_rawload"
    + The raw load/payload added behind will be appended to the end of the object

### Functions

- ip_packet = IP() : Generate IP Address Packet object
    - Parameters
        + dst : Destination IP Address
- tcp_packet = TCP() : Generate TCP Packet object
    - Parameters
        + dport : Destination Port
        - flags : Packet flag
            + S : SYN
            + A : ACK
- contents = rdpcap(".pcap filename") : To read a pcap file and import into the program; Returns data of type <list>
- sr() : To Send packets and Receive corresponding answers; Returns multiple answers/replies
- sr1() : Returns only one answer

### Variables

+ IP().ttl : Time-to-Live
+ IP().dst : Destination IP Address
+ IP().src : Source IP Address

### Usage

- Generating IP packets
    ```python
    # a = IP()
    # a.ttl
    # a.ttl = 10
    # a
    # del a.ttl
    # a
    # a.dst = "10.0.2.5"
    # a 
    # a.dst = "10.0.2.5/30"
    # a 
    # [adr for adr in a]
    ```

- Generate a stacked packet (TCP/IP packet)
    + and Add the payload
    ```python
    # b = IP()/TCP()
    # b # Display object
    # b = IP()/TCP()/"abcdef"
    # hexdump(b)    # Display hexadecimal of object
    ```

- SYN-ACK Test
    ```python
    # Stack packets
    # sr1( IP(dst="74.125.130.104")/TCP(dport=80, flags="S") ) # dport = Destination Port
    ```

## Resources

## Notes
- Creating packets
    - Must follow the sequence
        - IP()/TCP()
            + Cannot use TCP()/IP()

