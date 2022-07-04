# Cybersecurity Utility - nslookup

The DNS server lookup utility. NSLookup - stands for Name Server Lookup - is a useful command for getting information from a DNS server.
It is a Network Administration tool typically used for querying the Domain Name System (DNS) to obtain Domain name/IP address mapping and/or 
any other specific DNS record

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

+ Utility Type: DNS Query
+ Tool Area of Efficiency : Offensive (Red Team), Network Administration
+ Penetration Testing stage : Reconnaissance (Information Gathering)
+ Similar to: dig
+ Package Name: dnsutils

## Setup

### Pre-Requisites

### Dependencies

- Download package 'dnsutils'
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install dnsutils
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S dnsutils
        ```

## Documentation

### Synopsis/Syntax

nslookup {options} [server-ip-url]

### Parameters

+ -type=[lookup_type] : To lookup for a record type
    - Types
        + any : Lookup for any records
        + a : Address (IP Address) Record
        + mx : Email Exchange Server
        + ns : Name Server
        + soa : Start of Authority
        + txt : txt Records; Useful for multiple types of records like DKIM, SPF etc.

### Usage

+ Generic Lookup : nslookup google.com
+ Reverse DNS Lookup : 209.132.183.181 = Redhat.com

## Resources
