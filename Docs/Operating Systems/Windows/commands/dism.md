# Documentation - Command : DISM

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
The Windows Deployment, Image, Servicing and Management command line utility.

Essentially, this handles the deployment, servicing and management of Windows Images, allowing you to modify the base image before
proceeding to "deploy" or install that custom image in connected devices.

The DISM tool also allows you to check your system image and fix any errors found.
```

## Setup

### Pre-Requisites
+ Elevated Priviledges (Administrator Mode)

## Documentation

### Synopsis/Syntax
```batchdos
DISM {options}:<arguments> {/?}
```

### Parameters
```
Note:
- Please refer to 'DISM /?' for the full documentation/manual
    - This is currently a WIP and is therefore, incomplete.
```
- Commands
    - Image Health
        + /CheckHealth : Perform a quick checkup of the image health
        + /ScanHealth : Perform a deep checkup/scan of the image health
        + /RestoreHealth : Perform recovery and fixing of any image health issues detected.
    - Windows Image
        + /Cleanup-Image : Deletes resources associated with mounted Images that are corrupted

- Image Specifications
    + /Image:[path-to-offline-image] : Specifies the path to the root directory of a non-running (offline) Windows Image
    + /Online : Target the running (aka Online) operating system 

- Optionals
    + /? : Display detailed information about commands

### Usage

- Perform Quick checkup with the image health
    ```batchdos
    DISM /Online /Cleanup-Image /CheckHealth
    ```

- Perform a deeper checkup with the image health
    ```batchdos
    DISM /Online /Cleanup-Image /ScanHealth
    ```

- Perform fixing and recovery of issues found
    ```batchdos
    DISM /Online /Cleanup-Image /RestoreHealth
    ```

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

