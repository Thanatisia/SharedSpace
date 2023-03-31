# Cybersecurity Utility - The LaZagne Project

```
The LaZagne project is an Open Source utility used to retrieve passwords stored on a local computer.

Each software stores its passwords using different techniques
    - Examples
        + Plaintext
        + APIs
        + Custom Algorithms
        + Databases
        + etc

This tool has been developed for the purpose of finding these passwords for the most commonly-used software.
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

+ Utility Type: Credentials Recovery
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Reconnaissance
+ Package Author: AlessandroZ
+ Package Name: LaZagne
+ Repository URL: https://github.com/AlessandroZ/LaZagne

## Setup

### Pre-Requisites

### Dependencies
+ python
+ pip

### Obtaining
- Using git
    - Cloning repository
        ```console
        git clone https://github.com/AlessandroZ/LaZagne
        ```
    - Change directory
        ```console
        cd LaZagne
        ```

### Installing
- Using python-pip
    ```console
    (python -m) pip install -r requirements.txt
    ```

## Documentation

### Synopsis/Syntax
- Windows
    ```console
    laZagne.exe [modules] {options} <arguments>
    ```

### Parameters
- Positionals
    - Platform
        - Syntax
            ```console
            laZagne.exe 
            ```
        - Module Keywords
            - all {options} : All Platforms
                - Syntax
                    ```console
                    laZagne.exe all {options} <arguments>
                    ```
                - Options
                    - With Arguments
                        + -output [output-path] : Explicitly specify output path to save to
                        + -password {user's windows password} : To decrypt domain credentials; explicitly specify the user's window password; By default, It will try all passwords already found as windows passwords
                    - Flags
                        + -o : Write all passwords found into a JSON file (.json)
                        + -oA : Write all passwords found into all files
                        + -oN : Write all passwords found into a Normal text file (.txt)
                        + -quiet : Set quiet mode; nothing will be printed on the standard output
                        + -v : Change verbosity mode (level 1-2)
                        + -vv : Change verbosity mode (level 2-2)
            - browsers [software] : Launch only the browser module
                - Syntax
                    ```console
                    laZagne.exe browsers -[browser-name]
                    ```
                - Software scripts
                    + -firefox : Launch firefox browser
                - Options
                    - With Arguments
                    - Flags
                        + -h | --help : Display help
- Options
    - With Arguments
    - Flags
        + -h | --help : Display help

### Usage
- Write all passwords found into a file
    - Normal Textfile (.txt)
        ```console
        laZagne.exe all -oN
        ```
    - JSON files (.json)
        ```console
        laZagne.exe all -o
        ```
    - All files
        ```console
        laZagne.exe all -oA
        ```
    - Explicitly specify output path
        ```console
        laZagne.exe all {-o|-oA|-oN} -output [output-path]
        ```

- Change verbosit mode (2 different levels)
    - Level 1
        ```console
        laZagne.exe all -v
        ```
    - Level 2
        ```console
        laZagne.exe all -vv
        ```

- Quiet mode (nothing will be printed on the standard output)
    ```console
    laZagne.exe all -quiet -oA
    ```

- To Decrypt domain credentials
    - Specify the user's window password
        + By default, It will try all passwords already found as windows passwords
        + Note: For Wi-Fi passwords/Windows secrets, you need to launch it with administrator privileges (UAC Authentication/sudo)
        ```console
        laZagne.exe all -password [user's window password]
        ```

## Wiki
### Supported Platforms
+ Windows
+ Linux
+ MacOS

### Where is it used
+ Project has been added to [n1nj4sec/pupy](https://github.com/n1nj4sec/pupy/) as a post-exploitation module

## Resources
+ [Official Repository](https://github.com/AlessandroZ/LaZagne)
+ [Standalone Releases](https://github.com/AlessandroZ/LaZagne/releases/)
+ [LaZagne Wiki](https://github.com/AlessandroZ/LaZagne/wiki)

## Useful Issues
+ [Issue - JSON format stores multi-line string for SSH keys](https://github.com/AlessandroZ/LaZagne/issues/226)

## References

## Remarks

## Notes
