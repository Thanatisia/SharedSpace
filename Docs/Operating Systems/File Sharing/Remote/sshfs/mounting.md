# sshfs - Mounting the Filesystem

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

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
- SSHFS has been setup
	+ Please refer to [basics.md](basics.md) if sshfs is not yet setup and/or reference to the sshfs manual

## Documentation

### Mounting the filesystem
- Linux
	- Options
		+ allow_other : Allows access to users other than root
		+ default_permissions: Use the default permissions
	```console
	sudo sshfs -o allow_other,default_permissions username@ip-or-domain:/remote/target/mount/directory /local/host/mount/point
	```

- Windows
	- Using File Explorer
		+ Open File Explorer
		+ Right Click *This PC* on the menu pane
		+ Select *Map Network Drive*
		+ Select the letter of the drive to mount/map the remote folder to
		- In the *Folder* Textbox
			- Type the following path
				+ *\\sshfs[.option]\remote-username@remote-ip_domain{[!port][\path]}*
					- Options
						+ sshfs : Maps the remote user's home directory
						+ sshfs.r : Connects to the remote user's root directory
						+ sshfs.k : Maps to the remote user's home directory and uses the SSH key stored in /local/user/.ssh/id_rsa
						+ sshfs.kr : Adds the remote user's root directory and uses the locally store SSH key
		+ Click *Finish* to map the remote filesystem	
	- Using Command Line
		+ using *net use*
			```batchdos
			net use [drive letter]: \\sshfs[.option]\remote-username@remote-ip_domain{[!port][\path]}
			```
		+ Example
			```batchdos
			net use X: \\sshfs.k\username@ip-or-domain
			```

### Check Mounted Filesystem
- Linux
	```console
	cd /mount/directory
	```

- Windows
	- Using File Explorer
		+ The newly mounted filesystem should be visible from *This PC* under *Network Locations*
	- Using Command Prompt
		+ using *net use*
		```batchdos
		net use
		```

### Unmount Mounted Filesystem
- Linux
	```console
	sudo umount {options} /mount/directory
	```
- Windows
	- Using File Explorer
		+ Right-click on the mounted device
		+ Select the option *Disconnect*
	- Using Command Line
		+ using *net use*
		```batchdos
		net use [drive letter]: /delete
		```

### Usage

## Resources

## References
+ [Phoenixnap - sshfs](https://phoenixnap.com/kb/sshfs)

## Remarks