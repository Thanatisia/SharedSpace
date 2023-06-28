# Documentation - Command : install

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
The GNU install command is a Command Line Interface (CLI) Utility that aids in streamlining the installation of files/directories to the respective destinations with 
support such as Permission Modifiers, creating of directories if does not exist, etc.
```

### Background

### Compatibility
+ The install command is compatible with the 'make' build tools (Makefile) through the GNU Coding standards

## Setup

### Pre-Requisites
+ NIL

### Dependencies
+ NIL

### Obtaining
+ 'install' is generally included in the GNU core utilities (coreutils) and base packages

### Installing

## Documentation

### Synopsis/Syntax
```console
install {options} [src-path/files] [destination-directory]
```

### Parameters
- Positionals
    - path : The target directory/file you want to install
- Optionals
    - With Arguments
        + `-m <modifier>` : Install the specified files to the specified directory using a target permission modifier 
            - Example Modifiers
                + 0644 : Sticky, 
                + 0755 : Sticky, Read-Write-Execute
        + `-o <new-owner-name>` : Install the specified files to the specified directory with a new owner of the specified new owner name
    - Flags
        + -d | -D : Install/create the specified directory if it doesnt exist.
        + -v : Enables verbose output

### Usage
- Basic Installation of a file from current directory to a destination directory
    ```console
    install file.txt destination_directory
    ```

- Install a file from current directory to a new destination directory (that doesnt exist) with a custom file
    - Explanation
        + The '-D' flag will create the parent directory if it doesnt exist
        + Because the new destination directory doesnt exist, the '-D' flag will create it
    ```console
    install -D -v file.txt new_parent_directory/new_file_name
    ```

- Install all specified files to the specified directory using a target permission modifier
    ```console
    install -m <modifier> [program1 program2 ...] [destination-directory]
    ```

- Install all specified files to the specified directory using a target new owner
    ```console
    install -o <new-owner-name> [program1 program2 ...] [destination-directory]
    ```

## Wiki
### Special variables
+ DESTDIR : Get the destination directory leading up to a set of files and parallely execute through all of them; TLDR: The destination directory
+ PREFIX  : Determines where the package will go when it is installed, and where it will look for its associated files when it is ran; TLDR: A common folder name leading up to the folder to create

## Resources
+ [GNU Coding Standards - Environment Variable 'DESTDIR'](https://www.gnu.org/prep/standards/html_node/DESTDIR.html)
+ [LinuxForDevices - install command in linux](https://www.linuxfordevices.com/tutorials/linux/install-command-in-linux)

## References

## Remarks

