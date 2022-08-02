# sshfs - Basics

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

+ Package Name: sshfs

- 2 Methods to establish connection
	1. Using password authentication
	2. Using the SSH Key Pair

### DESCRIPTION
```
sshfs is the Secured Shell (SSH) Filesystem. sshfs is a remote network file system that mounts the remote filesystem through SSH.

The sshfs command line tool allows safe mounting of a remote folder from a remote server to local disk.
```

## Setup
### Pre-Requisites

### Dependencies

### Installing
- Using Package Manager
	- Distro-based (apt)
		```console
		sudo apt install sshfs
		```
	- Arch-based (pacman)
		```console
		sudo pacman -S sshfs
		```

- On Windows
	- Download and install
		+ The latest stable version of [WinFS](https://github.com/billziss-gh/winfsp).
		+ The newest stable version of [SSHFS-Win](https://github.com/billziss-gh/sshfs-win) that is compatible with your system.


## Documentation

### Synopsis/Syntax

- Mounting the remote filesystem using SSHFS
	```console
	sudo sshfs {-o [options...]} remote-username@remote-host-ip_or_domain:/[target-remote-directory-path] [local-mount-point]
	```

### Parameters
#### Arguments
+ target-remote-directory-path : The remote guest path that you would like to mount
+ local-mount-point : The local host path that you want to mount on
+ -h : Display a comprehensive list of available options
#### Options
> Please seperate all options with comma-delimiter (',')
+ allow_other : Allows access to users other than root
+ default_permissions : Use the default permissions
+ IdentityFile=[ssh-key-path (.ssh/id_rsa)] : (OPTIONAL) If the remote server uses SSH Key Authorization

### Usage

## Resources

## References

## Remarks