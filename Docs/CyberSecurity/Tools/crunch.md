# Cybersecurity Utility - crunch

```
description here
```

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Word List Generator
+ Tool Area of Efficiency : Offensive (Red Team), Defensive (Blue Team)
+ Penetration Testing stage : Scanning & Enumeration
+ Package Name: crunch
+ Repository URL: 

### DESCRIPTION

```
Crunch is a Command-line word-list generating utility. It is used to generate all possible permutation and combinations with repetitions (i.e. bbb) using a character set provided (a,b,c)
```

## Setup

### Pre-Requisites
```
NIL
```

### Dependencies

### Obtaining
+ Crunch is built-in in to Kali Linux

- Using Package Manager
	- Debian-based (apt)
		```console
		sudo apt(-get) install crunch
		```
	- CentOS/Red Hat (yum)
		```console
		sudo yum install crunch
		```
	- Fedora (dnf)
		```console
		sudo dnf install crunch
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S crunch
		```

## Documentation

### Synopsis/Syntax
```console
crunch [minimum-length] [maxium-length] [character-set] [ {options} [arguments...] ]
```

### Parameters
+ -f [character-set-filepath] : To use a pre-defined character set
+ -o [output-file] : Output the crunched password list as an output
+ -t [pattern] : To specify a pattern you're searching; To include Special Characters
    - Patterns
        + '@' is a wildcard for lowercase alphabetical characters
        + ',' is a wildcard for uppercase alphabetical characters
        + '%' is a wildcard for numerical characters
        + '^' is a wildcard for special characters

### Special Characters in the list
> Prepend a backward slash behind the character
+ \&
+ \*
+ \%
        
### Usage
- Create a wordlist of size 5 containing numbers
    ```console
    crunch 5 5 012345 -o myword.txt
    ```
    
- Create a wordlist of size 3 containing the character set (a,b,c,d)
    ```console
    crunch 3 3 abcd -o 3word.lst
    ```
    
- Create a wordlist between 6 to 8 characters containing the numerical values 0-9
    ```console
    crunch 6 8 0123456789 -o numword.lst
    ```
    
+ Create a wordlist of size 8 containing a mix of special characters '@', '%', '^', and numerical values 0,8,2 and 9
    ```console
    crunch 8 8 -t @@%^0829 -o birthday.txt
    ```

    
## Resources

## References

## Remarks

## Notes
