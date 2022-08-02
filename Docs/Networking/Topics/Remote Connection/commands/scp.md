# Documentation - Command : scp

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### DESCRIPTION

```
Stands for 'Secure Copy', scp is a remote file sharing utility that allows for secured file transfers to and from a remote guest connected with SSH
```

### Background

## Setup

### Pre-Requisites

### Dependencies

### Obtaining

### Installing

## Documentation

### Synopsis/Syntax

- Secure Copy from remote guest to local host
	```console
	scp {options} remote-user@remote-ip-address_or_domain-name:/[source-filepath] [local-output-destination-path]/[target-files...]
	```

- Secure Copy from local host to remote guest
	```console
	scp {options} [remote-output-destination-path]/[target-files...] remote-user@remote-ip-address_or_domain-name:/[remote-folderpath]
	```

### Parameters
#### Arguments
+ source-filepath : Specify remote guest source path and files to copy
+ {remote|local}-output-destination-path : Specify the destination path to copy the files to
+ {remote|local}-folderpath : Specify the folder path to transfer to and from remote guest/local host
+ target-files : List of files to transfer to and from remote guest/local host
#### Options
+ -r : Recursively copy

### Usage


## Resources

## References

## Remarks

