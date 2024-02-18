# CyberSecurity Tools - Package - John (the Ripper) - zip2john

zip2john is a CLI utility thats part of the John (the Ripper) framework/suite that is used 
to convert (password-protected) ZIP archive files into hashed digests 
for usage with john the ripper.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)
- [Notes](#notes)

## Information
+ Utility Type: Zip to hash converter
+ Tool Area of Efficiency : Offensive (Red Team)
+ Penetration Testing stage : Enumeration, Exploitation
+ Package Name: john
+ Repository URL: https://github.com/openwall/john

### Related Tools
+ [john](john-the-ripper.md)

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
	sudo apt install john
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
zip2john {options} [target-zip-archive-file(s)]
```

### Parameters
- Positionals
    + target-zip-archive-file : Specify all zip archive files that you want to convert into hash digest(s)
- Optionals
    - -s : Scan archive from the beginning, looking for local file headers. 
        + This is less reliable than going by the central index, but might work better with corrupted or split archives.

    - Options for 'old' PKZIP encrypted files only:
        - With Arguments
            - `-a <filename>` : This is a 'known' ASCII file. 
                - This can be faster, IF all files are larger, 
                    + and you KNOW that at least one of them starts out as 'pure' ASCII data.
            - `-o <filename>` : Only use this file from the .zip file.
        - Flags
            - -c : This will create a 'checksum only' hash.  
                - If there are many encrypted files in the .zip file, then this may be an option, and 
                    + there will be enough data that false positives will not be seen.  
                + Up to 8 files are supported. 
                + These hashes do not reveal actual file data.
            - -m : Use "file magic" as known-plain if applicable. 
                + This can be faster but not 100% safe in all situations.

### Usage
- Convert a ZIP archive file into a hash digest
    ```console
    zip2john [zip-archive-file] > [output-hash-file]
    ```

## Resources

## References
+ [Kali - Tools - Packages - john](https://www.kali.org/tools/john)
+ [Kali - Tools - Packages - john - zip2john](https://www.kali.org/tools/john/#zip2john)

## Remarks

