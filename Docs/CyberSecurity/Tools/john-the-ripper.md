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

### Related Tools
+ [zip2john](zip2john.md)

### Attack Steps
#### Cracking Linux /etc/passwd and /etc/shadow
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
john {options} [word-list]
```

### Parameters
- Positionals
    - word-list : Specify the word list file you wish to use as the dictionary
        - Word List (Dictionary) examples
            + Password List: victims password from unshadow
            + rockyou.txt
- Optionals
    + --format=[formats]		: Explicitly Specify the hashing algorithm used to encrypt/hash the shadow file
        - Formats
            + $0$ : crypt
            + $1$ : MD5
            + $5$ : SHA256
            + $6$ : SHA512
    + --show passwd			: To retrieve the cracked password; Cracked passwords are saved in the file called $JOHN/john.pot
    + --wordlist=[password list] 	: Specify the password list to use to break the unshadowed list

### Usage

- Cracking Linux system password
    - Using dictionary attack
        - Get the unshadowed password file from the system
            ```console 
            sudo unshadow /etc/passwd /etc/shadow
            ```
        - Unshadow the /etc/shadow password hash file to obtain the victims password list
            ```console
            sudo unshadow /etc/passwd /etc/shadow > ./victims_pwd
            ```
        - Password crack the system password list using crypt
            ```console
            john --format=crypt --wordlist=/usr/share/john/password.list ./victims_pwd
            ```

- Zip file password-cracking
    - Convert a zip file to hash
        - Using 'zip2john'
            ```console
            zip2john [zip-archive-file] > [output-hash-file]
            ```
    - Crack the Password-protected ZIP file's password
        - Using Dictionary Attack
            - Using the rockyou.txt Password list (Dictionary)
                + If you are using Kali Linux, rockyou.txt is included with the system in '/usr/share/wordlists/rockyou.txt'
                ```console
                john --wordlist=/usr/share/wordlists/rockyou.txt [target-hash-file]
                ```

## Resources
+ [CyberSecurity Lists](https://github.com/danielmiessler/SecLists)
+ [Medium - Daviesombasa - Crack the Vault: How to Access Password Protected .zip Files](https://daviesombasa.medium.com/crack-the-vault-how-to-access-password-protected-zip-files-ade73d073bf0)
+ [Openwall - John the Ripper Official Website](https://www.openwall.com/john/)

## References

## Remarks

## Notes
+ /etc/passwd stores a list of registered users in the system and
+ /etc/shadow stores the hashes of the passwords

