# Cybersecurity Tools - Password Cracking - fcrackzip

+ fcrackzip is a fast CLI Password Cracker partly written in assembler, designed to break passwords in encrypted zip files

- It is able to crack password protected zip files with brute force or dictionary based attacks, 
    - optionally testing with unzip its results. It can also crack cpmask’ed images.

+ This package is useful for pentesters, ethical hackers and forensics experts.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information
### Package
+ Utility Type: Offline Password Cracker
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Enumeration, Exploitation
+ Package Name: fcrackzip
+ Repository URL: https://salsa.debian.org/pkg-security-team/fcrackzip

### Attack Steps

## Setup
### Dependencies
+ libc6

### Pre-Requisites
- Prepare a Password-protected ZIP file
    - To create a Password-protected ZIP file
        - Using zip
            ```console
            zip --password [your-password-here] [output-zip-file] [input-files]
            ```
        - Using 7z (GUI)
            ```console
            7z a [output-zip-archive-file] [input-files] --password -p[your-password-here]
            ```

- Download a word list/dictionary like the popular [rockyou.txt dictionary (word list)](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt) file
    ```console
    wget https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt
    ```

### Installation
- fcrackzip is part of Kali's password cracking metapackages
	```console
	sudo apt install fcrackzip
	```

- Download package
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install fcrackzip
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S fcrackzip
        ```

## Documentation

### Synopsis/Syntax
```console
fcrackzip {options} [target-zip-file]
```

### Parameters
- Positionals
    - target-zip-file : Specify the target password-protected ZIP file you want to break
        Type: String
- Optionals
    - With Arguments
        + `-p [password-list]` : Specifies the password word-list/dictionary file you want to break with (i.e. rockyou.txt)
    - Flags
        + -D : Specifies the use of a dictionary or wordlist.
        + -u : Uses unzip.
        + -v : Enable Verbose output

### Usage
- Displaying help
    ```console
    fcrackzip --help
    ```

- Cracking the password
    - Perform a dictionary attack using a word list to extract the zip file password
        ```console
        sudo fcrackzip -D -p [word-list] -u [target-zip-file]
        ```

## Wiki
### Notes

## Resources

## References
+ [fcrackzip HomePage](http://oldhome.schmorp.de/marc/fcrackzip.html)
+ [Infosec Writeups - Fcrackzip Tool — Crack a Password Protected Zip File in Kali Linux](https://infosecwriteups.com/fcrackzip-tool-crack-a-password-protected-zip-file-in-kali-linux-421aab30a98c)
+ [Kali Tools - fcrackzip](https://www.kali.org/tools/fcrackzip/)
+ [Keshav Explore - 2023/11 - Fcrackzip Tool - Crack a Password Protected Zip File in Kali Linux](https://www.keshavxplore.in/2023/11/fcrackzip-tool-crack-a-password-protected-zip-file-in-kali-linux.html)
+ [MattCASmith - Cybersecurity - 2020/09/12 - Cracking a password-protected ZIP file with fcrackzip](https://mattcasmith.net/2020/09/12/cracking-password-protected-zip-file-fcrackzip)
+ [rockyou.txt dictionary (word list)](https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt)

## Remarks


