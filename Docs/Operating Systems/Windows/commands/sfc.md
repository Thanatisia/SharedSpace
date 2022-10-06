# Documentation - Command : sfc

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
SFC - the System File Checker - is a Windows command line utility that will check your system files and replace/fix/repair them if they are bad.

System files includes
    - DLL : Dynamic Link Library
```

### Background

## Setup

### Pre-Requisites
- Administrator Mode

### Dependencies

### Obtaining

### Installing

## Documentation

### Synopsis/Syntax
```batchdos
sfc {options} <arguments> [commands]
```

### Parameters

- Commands
    + /scanfile=[filepath/name] : Scan integrity of the referenced file and repair/replace/fix them if problems are detected.
    + /scannow : Scan integrity of all system files and repair/replace/fix them if problems are detected.
    + /verifyfile=[filepath/name] : Scan integrity of the specified file. No repair operation is performed.
    + /verifyonly : Scan integrity of all system files. No repair operations are performed.

- Specifications
    - Offline Repair
        + /offbootdir=[offline-boot-directory-path] : Specify location of the offline boot directory for offline repair
        + /offwindir=[offline-windows-directory-path] : Specify location of the offline windows directory
        + /offlogfile=[log-file-path] : Flag to Enable logging to the specified log file path

### Usage

- Scan and repair files with problems
    ```batchdos
    sfc /scannow
    ```

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

