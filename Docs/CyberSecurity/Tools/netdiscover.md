# Cybersecurity Utility - netdiscover

Netdiscover is a simple ARP scanner to scan for live/connected hosts in a network/on the current Network Interface.

- It is also able to show basic information about the clients
    + IP and MAC address of the client's network card
    + Hard Manufacturer of the client's network card

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
+ Package Name: 
+ Repository URL: 

- Features:
    + Simple Arp Scanner
    + Works in both Active & Passive modes
    + Produces a live display of identified hosts
    + Able to scan multiple subnets
    + Timing Options

## Setup

### Pre-Requisites

### Dependencies

- Download package 'netdiscover'
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install netdiscover
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S netdiscover
        ```

### Obtaining

## Documentation

### Synopsis/Syntax

```console
netdiscover {options}
```

### Parameters

+ -i [interface] : Specify your network interface
+ -p		 : Passive Mode
+ -r [range]	 : Specify a range of nodes to discover instead of autoscan; Range should be given as CIDR notations like for example : 192.168.1.0/24,/16,/8

### Usage

## Resources

## References

## Remarks

## Notes
