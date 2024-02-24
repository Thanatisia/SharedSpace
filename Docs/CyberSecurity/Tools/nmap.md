# Cybersecurity Utility - nmap

The most popular, and arguably important port scanner. 
This added many new features including service/version detection, OS detection, network traceroute, multiple ping scanning and scripting functionality

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

+ Utility Type: Port Scanner
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Scanning and Enumeration

### Variants

+ GUI version: zenmap
    
### States
+ open
+ closed
+ filtered
+ unfiltered
+ open|filtered
+ closed|filtered (Uncommon)

## Setup

### Pre-Requisites

### Dependencies

- Download package 'nmap'
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install nmap
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S nmap
        ```

## Documentation

### Synopsis/Syntax

nmap [option] <target_IP_address>

### Parameters
- Default: 
    + Nmap will scan the 1000 most common ports in a random order
    + TCP SYN scan is used
    + Interactive Output

- General Options
    + -p [port-range] : Specify specific ports; Scan only the defined ports
    + -F : Scan only the 100 most common ports (fast)
    + -r : Do not randomize port numbers
    + --top-ports N : Scan the N most common ports
    + -v : Verbose; show detailed information about the scanning
- Scan Options
    + -sT : TCP connect; Full open scan (perform three-way handshake)
    + -sS : TCP SYN scan; Half open scan
    + -sN : TCP NULL scan
    + -sF : TCP FIN scan
    + -sX : TCP Xmas Scan
    + -sA : TCP ACK Scan
    + -sU : UDP Scan
    + -sV : To gather information about version number of the programs the target server is running
- Reconnaissance
    + -O  : To gather information about the target server's Operating System
- Timing Options
    + -T<mode> : Set a timer mode
    - Modes
        + 0 : Paranoid : A packet is sent every 5 minutes (no packets sent in parallel for IDS evasion)
        + 1 : Sneaky : A packet is sent every 15 seconds (no packets sent in parallel for IDS evasion)
        + 2 : Polite : A packet is sent every 0.4 seconds (no packets sent in parallel)
        + 3 : Normal : Default; Multiple packets to multiple targets sent
        + 4 : Aggressive : Nmap will not wait for more than 1.25 seconds for a response
        + 5 : Insane : Nmap will not wait for more than 0.3 seconds for a response
- Output Options
    + -oN [filename] : Set Normal Output
    + -oX [filename] : Set XML output (This format can be converted to HTML format)

### Usage
- TCP Scan (Full Open Scan)
    ```console
    nmap –sT –v <target IP address>
    ```
- SYN Scan (Half Open Scan)
    ```console 
    nmap –sS –v <target IP address>
    ```

- Network Mapping the operating system specifications of the system mapped to the IP address
    ```console
    nmap -sV 192.168.1.1-254 -oX 192.168.1.1-254.xml
    ```

## Resources
- [Manual](https://nmap.org)

## References

## Remarks

