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
+ Package Name: 
+ Repository URL: 

## Setup

### Pre-Requisites

- Enable IP forward to make packets go through the attacker's device
    + echo 1 > /proc/sys/net/ipv4/ip_forward

### Dependencies

### Obtaining

## Documentation
### Synopsis/Syntax
+ arpspoof -i [interface] -t [Target A] [Target B]
### Parameters
+ -i [interface]    : Specify your target interface
+ -t [Target A] [Target-B]   : Specify your targets on the interface to tell that the attacker is the default gateway
### Usage
+ To tell Target-A that Target-B is the default gateway
    ```console
    arpspoof -i eth0 -t 10.0.1.3 (Target to Spoof) 10.0.1.1 (Default Gateway / Attacker)
    ```
+ To tell the default gateway that the attacker is the target
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

