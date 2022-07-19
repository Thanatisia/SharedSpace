# Samba Network File Server

Documentations, Guides, Tips n Tricks and Setup strategy for working with Network File Sharing Servers via SambaFS

## Table of Contents
- [Information](#information)
- [Files](#files)
- [Setup](#setup)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [References](#references)
- [Resources](#resources)

## Information

## Files

+ /etc/samba/smb.conf : Samba Config File

## Setup

### Pre-Requisites

### Dependencies

+ samba
+ samba-common
+ ssh

### Preparation

1. Enable SSH
	```console
	# via command service
	sudo service ssh start

	# via systemctl
	sudo systemctl enable sshd
	sudo systemctl start sshd

	# Usage:
		ssh [username]@[hostname-or-IP_Address]
	```

2. Create new folder to share your files
	- In Host system
		```console
		# using /media/share
		sudo mkdir -p /media/share
		```

	- In a Mount Point
		```console
		# Mount the device
		mount [device_label] [mount_point]

		# Create folder
		sudo mkdir -p [mount_point]/share
		```

3. Give all permissions to the folder
	```console
	sudo chmod 777 [mount_point]/share
	```

### Installation

1. Install Samba
	- Debian-based
		```
		# Update and Upgrade to latest repository
		sudo apt(-get) update && sudo apt(-get) upgrade
		
		# Install samba
		sudo apt(-get) install samba
		```

2. Backup /etc/samba/smb.conf config file
	```console
	sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
	```

3. Edit the /etc/samba/smb.conf file
	#### Append the following lines
	```console
	: "
	[Name-Of-Your-Sharedrive]
	comment = [Summary or explanation of what this drive/folder does]
	public = {yes|no}
	writeable = {yes|no}
	browseable = {yes|no}
	path = [mount_path]/share
	create mask = 0777
	directory mask = 0777
	"
	
	# Save and Leave
	```

4. Restart Samba to apply changes
	```console
	sudo service smbd restart
	```

### Test Access
```
You now have a shared folder accessible to all without authentication, 
we will get to basic security and authentication later in here [Security and Authentication](#security)

For more focused and specialised info on Samba security and authentication, refer to this [Documentation](#to-be-filled)
```
- Connect to the network drive
	- On Windows
		```bat
		\\X.X.X.X\share_folder
		```
	- On Linux/Mac
		```console
		smb://X.X.X.X/share_folder
		```

### Security

1. Edit the public option
	```
	To request for a password when connecting
	```
	#### Append the following lines
	```console
	: "
	[Name-Of-Your-Sharedrive]
	comment = [Summary or explanation of what this drive/folder does]
	public = no
	writeable = {yes|no}
	browseable = {yes|no}
	path = [mount_path]/share
	create mask = 0777
	directory mask = 0777
	"
	
	# Save and Leave
	```

2. Tell Samba that the user is allowed to connect to shares
	```console
	sudo smbpasswd -a user
	```

3. Restart Samba
	```console
	# Using service
	sudo service smbd restart
	
	# Using systemctl
	sudo systemctl enable smbd
	```

## Documentation

### Samba Configuration

#### Config Structure

```
[Name-Of-Your-Sharedrive]
comment = [Summary or explanation of what this drive/folder does]
public = {yes|no}
writeable = {yes|no}
browseable = {yes|no}
path = [mount_path]/share
create mask = 0777
directory mask = 0777
...
```

#### Synopsis/Syntax
```
Syntax for Samba
```

- To Connect to Network Shared Drive
	- Windows
		```batchdos
		\\[IP-Address]
		```

	- Linux/Mac
		```console
		smb://[IP-Address]
		```

- To Start Samba

```console
# Using service
sudo service smbd start

# Using systemctl
sudo systemctl start smbd

# Using SMB daemon in the background without systemd
# please refer to syntax of smbd in the synopsis/syntax to see what the parameters does
smbd -D
```

- To Stop Samba

```console
# Using service
sudo service smbd stop

# Using systemctl
sudo systemctl stop smbd
```

- To Enable Samba

```console
# Using service
sudo service smbd enable

# Using systemctl
sudo systemctl enable smbd
```

- To Disable Samba

```console
# Using service
sudo service smbd disable

# Using systemctl
sudo systemctl disable smbd
```

- To Restart Samba

```console
# Using service
sudo service smbd restart

# Using systemctl
sudo systemctl enable smbd
```

#### Parameter

- /etc/samba/smb.conf Configurations

```
Frequently Used Options
```
+ comment : Summary or explanation of what this drive/folder does
+ public : If the folder is accessible/viewable by everyone regardless of password; set 'no' to request a password when connecting
+ writeable : If the folder is READ-ONLY or writeable
+ browseable : If the folder is accessible or findable or the net share
+ path : Path to the share folder
+ create mask : Default permission when a file or folder is created from a Windows/DOS client
+ directory mask : Default permission when a folder is created from a Windows/DOS client

```
Others
```
+ valid users = [usernames...] : Set all users you allow to view; Edit this with users you allow to access
+ read only : Set to be READ ONLY (Non-Writable/Non-Editable)
+ guest ok : Access will be permitted to guest (anonymous no username) users
+ hosts allow = [subnet] : Allow all hosts on the specified subnet

```
NAS
```
+ volume = [nas-server-name]

#### Usage

### Functions

#### Synopsis/Syntax

+ smbd {options} : the Samba (SMB) Daemon Utility; use this to start smb without systemd
+ sudo smbpasswd {options} [argument] : Change SMB Passwords

#### Parameters

- smbd
	+ -D | --daemon 				: Become/start as a daemon (Default) in the background
	+ -F | --foreground 				: To run the daemon in the foreground
	+ -i | --interactive				: Run interactive mode (Opposite of daemon) and log to stdout
	+ -p=[port-number] | --port=[port-number]	: Listen on the specified ports
	+ -s=[config-file] | --configfile=[config-file]	: Use an alternte configuration file specified

- smbpasswd
	+ -a [username] : Allow a specified user to connect to shares

#### Usage

- smbpasswd
	+ To allow a user to connect to shares
		```console
		sudo smbpasswd -a username
		```

### Customization and Configuration

- To allow only a specific user to have access to the share_folder share
	```console
	# Change Owner of the share folder to the username
	# -R is for recursive
	chown [username] [share_folder] -R

	# Change Permission of the share folder to 700
	# -R is for recursive
	chmod 700 [share_folder] -R
	```

## Remarks

## References

## Resources

- [RaspberryPi Tips - How to turn a Raspberry Pi into a file server?](https://raspberrytips.com/raspberry-pi-file-server/)

