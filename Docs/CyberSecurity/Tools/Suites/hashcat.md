# Cybersecurity Utility - hashcat

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Password Hash Cracker/Recovery
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: hashcat 
+ Repository URL: [GitHub - hashcat](https://github.com/hashcat/hashcat)
- Files/Scripts
    + hashcat
    + hashcat-utils
    + maskprocessor
    + statsprocessor
    + princeprocessor
    + kwprocessor

### DESCRIPTION
```
Hashcat is a Multithreaded Password Hash Cracking/Recovery tool suite, designed to break the high complexity password in a short amount of time.

The tool is also capable of both wordlist and brute-force attacks.

Hashcat has 2 variants
    - CPU-based
    - GPU-based
```

### FEATURES
+ The 90+ Algorithm can be implemented with performance and optimization in mind.
+ The number of threads can be configured.
+ Multi-algorithm based ( MD5, MD4, MySQL, SHA1, NTLM, DCC, etc.).
+ All attacks can be extended by specialized rules.
+ Multi-hash and multi-OS based (Windows and Linux).
+ Supports both hex-charset and hex-salt files.

## Setup

### Pre-Requisites

### Dependencies
+ hashcat-data
+ libc6
+ libgcc-s1
+ libminizip1
+ libstdc++6
+ libxxhash0
+ pocl-opencl-icd | opencl-icd
+ zlib1g

### Obtaining
+ Hashcat is built-in to Kali Linux

- Using package manager
    - Debian-based (apt)
        ```console
        sudo apt install hashcat
        ```
    - Arch-based (pacman)
        ```console
        sudo pacman -S hashcat
        ```
    
+ [Download the latest binary](https://github.com/hashcat/hashcat/releases/latest)

## Documentation

### Synopsis/Syntax

#### hashcat
```console
hashcat [{options} [arguments...]] [output-file-name] [dictionary-hash-file] [word-list-filepath]
```

### Parameters

#### Options
+ -a [attack-mode-number] : Start Attack Mode
    - Attack Mode Number
        + 0 : Straight
        + 1 : Combination
        + 3 : Brute-force
        + 6 : Hybrid Wordlist + Mask
        + 7 : Hybrid Mask + Wordlist
        + 9 : Association
+ -m [hash-mode-number] : Set the Hash Type (please refer to manuals for the full list)
    - Hash Mode Number
        > These are some of the more used modes
        + 0     : MD5
        + 500   : md5crypt, MD5 (Unix), Cisco IOS `$1$` (MD5)
        + 1400  : SHA2-256
        + 1700  : SHA2-512
        + 17600 : SHA3-512

#### hashcat

### Usage

- Dictionary Attack to crack Password
    - Create Hash Entries 
        + dictionary_hashes.txt
    - Obtain wordlists used to break 
        + /usr/share/wordlists/rockyou.txt
    + Crack the Hashes created and store the results in 'done.txt'
        + Hash Mode : 500 (md5crypt - MD5)
        + Attack Mode : 0 (Straight)
        + Output File Name : done.txt
        + Password Hash List : dictionary_hashes.txt
        + Reference Word Lists : /usr/share/wordlists/rockyou.txt
        ```console
        hashcat -m 500 -a 0 done.txt dictionary_hashes.txt /usr/share/wordlists/rockyou.txt
        ```

## Resources

## References
+ [hashcat main page](https://hashcat.net/hashcat/)
+ [Kali Packages - Hashcat](https://www.kali.org/tools/hashcat/#:~:text=Hashcat%20supports%20five%20unique%20modes,help%20enable%20distributed%20password%20cracking.)
+ [GeeksforGeeks - Hashcat](https://www.geeksforgeeks.org/hashcat-tool-in-kali-linux/)

## Remarks

## Notes
