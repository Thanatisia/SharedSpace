# Cybersecurity Utility - BeEF

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information

+ Utility Type: Web Penetration
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Exploitation
+ Package Name: beef-xss
+ Repository URL: [GitLab - beef-xss](https://gitlab.com/kalilinux/packages/beef-xss)

### DESCRIPTION
```
BeEF is a "Browser Exploitation Framework" and is based on XSS

BeEF is used to attack the target's web browser by hooking it through injecting Javascript code.
The hook code can be placed in a HTML page

If a victim visits the specific website that contains this 'hook' code
    - His/her browser will be hooked and further exploited
```

## Setup

### Pre-Requisites


### Dependencies
+ adduser
+ lsof
+ ruby-ansi
+ ruby-async-dns
+ ruby-em-websocket
+ ruby-erubis
+ ruby-espeak
+ ruby-eventmachine
+ ruby-execjs
+ ruby-json
+ ruby-maxmind-db
+ ruby-mime-types
+ ruby-msfrpc-client
+ ruby-otr-activerecord
+ ruby-parseconfig
+ ruby-qr4r
+ ruby-rack
+ ruby-rack-protection
+ ruby-rubydns
+ ruby-rushover
+ ruby-sinatra
+ ruby-slack-notifier
+ ruby-sqlite3
+ ruby-term-ansicolor
+ ruby-terser
+ ruby-twitter
+ ruby-xmlrpc
+ ruby-zip
+ ruby2.7
+ ruby2.7-dev
+ rubygems-integration
+ thin
+ xdg-utils

### Obtaining

### Installing
- Using Package Manager
    - Debian-based (apt)
        ```console
        sudo apt update
        sudo apt install beef-xss
        ```
    - Arch-based (pacman)
        ```console
        sudo pacman -Syu
        sudo pacman -S beef-xss
        ```
        
## Documentation

### Synopsis/Syntax

- beef-xss
- beef-xss-stop

### Parameters

### Usage

## Wiki
### File Locations
- Config Folder : /etc/beef-xss
- Config Files
    + config.yaml : /etc/beef-xss

### Commands
+ alert : Create Alert Dialog
+ redirect : Redirect Browser
+ pretty theft : Pretty Theft

## Resources
+ [Kali Tools - beef-xss](https://www.kali.org/tools/beef-xss/)

## References

## Remarks

## Notes
