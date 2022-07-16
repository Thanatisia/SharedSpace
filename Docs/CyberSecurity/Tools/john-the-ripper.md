# Cybersecurity Utility - John the Ripper

John the Ripper is an Offline Password Attacking Tool and one of the most famous password cracking tool. 

John the Ripper is also capable of performing Brute-force attacks.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Offline Password Cracker
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Enumeration, Exploitation
+ Package Name: john
+ Repository URL: https://github.com/openwall/john

### Attack Steps
1. Unshadowing
	- Combine */etc/passwd* and */etc/shadow* files using unshadow
		- Synopsis/Syntax
			```console
			unshadow [password file] [shadow file] > [output-password-file]
			```
		- Usage
			```console
			sudo unshadow /etc/passwd /etc/shadow > ./victims_pwd
			```
2. Perform a dictionary attack against the unshadowed file using a word list to find a password
	```console
	john {--format=[hash-format]} --wordlist=/usr/share/john/password.list ./victims_pwd
	```

## Setup

### Pre-Requisites
+ sudo priviledges
+ Get the unshadowed password file from running 'sudo unshadow /etc/passwd /etc/shadow'

### Dependencies
+ john-data
+ libc6
+ libcrypt1
+ libgmp10
+ libgomp1
+ libpcap0.8
+ libssl1.1
+ zlib1g

### Obtaining

- John the Ripper is part of Kali's password cracking metapackages
	```console
	sudo apt install 
	```

- Download package
    - Package Manager is apt|apt-get|aptitude (Debian-based)
        ```console
        sudo apt(-get) install john
        ```
    - Package Manager is Pacman (Arch-based)
        ```console
        sudo pacman -S netdiscover
        ```

## Documentation

### Synopsis/Syntax

```console
john {options} [victims password from unshadow]
```

### Parameters

+ --format=[formats]		: Explicitly Specify the hashing algorithm used to encrypt/hash the shadow file
	- Formats
		+ $0$ : crypt
		+ $1$ : MD5
		+ $5$ : SHA256
		+ $6$ : SHA512
+ --show passwd			: To retrieve the cracked password; Cracked passwords are saved in the file called $JOHN/john.pot
+ --wordlist=[password list] 	: Specify the password list to use to break the unshadowed list

### Usage

- Basic
	```console
	sudo unshadow /etc/passwd /etc/shadow > ./victims_pwd

	john --format=crypt --wordlist=/usr/share/john/password.list ./victims_pwd
	```

## Resources
+ [Openwall - John the Ripper Official Website](https://www.openwall.com/john/)

## References

## Remarks

## Notes
+ /etc/passwd stores a list of registered users in the system and
+ /etc/shadow stores the hashes of the passwords
