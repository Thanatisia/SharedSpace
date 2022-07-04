# Cybersecurity Utility - theHarvester

- theHarvester is a tool like sublist3r which is developed by Python. This tool is used by Penetration testers to gather information consisting but not limited to
    + emails
    + sub-domains
    + hosts
    + emails
    + employee names
    + open ports
    + banners
from different public sources.

- This tool can be used in Passive Reconnaissance and by anyone who needs to know what an attacker can see about a target

- Email addresses on their own provides an opportunity to launch phishing attacks, attempts to get trojans installed and other direct attacks
- Another opportunity is that the local part (everything to the left of the '@') is often the username and
    + Having a list of usernames gives an attacker a list of accounts to use when trying to login to other critical systems
- The Harvester can be configured to use Google, Bing, PGP, LinkedIn, as well as a number of other sources

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Information

+ Utility Type: Data Harvesting
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : (Passive) Reconnaissance (Information Gathering)
+ Package Name: theharvester by laramies
+ Repository URL: [laramies/theHarvester](https://github.com/laramies/theHarvester)

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
        sudo apt(-get) install theharvest
        ```
    - Package Manager is pacman (Arch-based)
        ```console
        sudo pacman install theharvest
        ```
- Install from Source
    - Clone the Repository
        ```console
        git clone https://github.com/laramies/theHarvester.git
        ```
    - Change directory into theHarvester
        ```console
        cd theHarvester
        ```
    - Install python package requirements
        ```console
        sudo pip3 install -r requirements.txt
        ```
    - Run theHarvester
        ```console
        sudo python3 ./theHarvester.py
        ```

## Documentation

### Synopsis/Syntax

theharvester [{options} [arguments]...]

### Parameters

+ -b [engine] : Specifying search engine
    - Search Engines
        + google
        + linkedin
        + pgp
+ -d [domain] : Specifying domain
+ -l [entries] : Specifying the number of entries

### Usage

+ theharvester -d domain -b google -l 100
+ theharvester -d domain -b linkedin -l 10
+ theharvester -d domain -b pgp -l 100

## Resources
