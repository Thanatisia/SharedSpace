# Cybersecurity Utility - weevely

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: PHP Backdoor Generation Utility and Stealth Web Shell
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Exploitation
+ Package Name: weevely
+ Repository URL: [GitHub - Weevely](https://github.com/epinna/weevely3/)

### DESCRIPTION
```
A PHP Backdoor generation tool and stealth web shell that simulates telnet-like connection.

This is essential for Web Vulnerability Exploitation and can be used as a Stealth backdoor and/or as a Web Shell to manage legitimate web accounts
```

## Setup

### Pre-Requisites
+ python
+ pip

### Dependencies
+ python3
+ python3-dateutil
+ python3-mako
+ python3-prettytable
+ python3-socks
+ python3-yaml

### Installing
- Using Package Manager
    - Debian-based (apt)
        ```console
        sudo apt install weevely
        ```
    - Arch-based (pacman)
        ```console
        sudo pacman -S weevely
        ```

## Documentation

## Steps
1. Generate backdoor PHP payload code (i.e. showinfo.php)
2. Upload the backdoor PHP file into a file upload to infect the target
3. Use weevely to remote into the server

### Synopsis/Syntax

```console
weevely {options} {actions [arguments...] | php-backdoor-script [password] }
```

### Parameters

#### Actions
+ generate [password] [backdoor-php-script-filename]    : Generate a new backdoor agent/script
+ session                                               : Recover an existing session
+ terminal                                              : Run terminal or command on the target
- default                                               : To open backdoor in the target webserver
    + *[Uploaded target file URL]* [backdoor-password]

#### Options

### Usage
- Basic
    - Generate a PHP script/agent/payload
        ```console
        weevely generate [password-payload] [path-of-script-output]
        ```
    - Inject generated PHP script to the target
        + via File upload/SQL Injection
    - Open Backdoor
        ```console
        weevely [URL of target] [password]
        ```

## Resources

## References
+ [Kali Packages - Weevely](https://www.kali.org/tools/weevely/)
+ [SecurityOnline - Weevely Tutorial PHP](https://securityonline.info/weevely-tutorial-php-webshell/)

## Remarks

## Notes
