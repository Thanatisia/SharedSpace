# Samba Network File Server

Documentations, Guides, Tips n Tricks and Setup strategy for working with Network Attached Storage (NAS)

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

+ OpenMediaVault & OpenMediaVault-Extras Install Script | https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install

## Setup

### Pre-Requisites

- You need to know your device's ip address to access the OpenMediaVault Web GUI
	```console
	# using hostname
	hostname -I

	# using ip a s
	ip a s
	```

### Dependencies

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

- Update and Upgrade Official Repositories
	```console
	sudo apt update && sudo apt upgrade
	```

- Download the OpenMediaVault Install script and run it
	```console
	# wget -O - [url] : Download the output of the file
	# | bash : Pipe output to bash to execute
	wget -O - https://raw.githubusercontent.com/OpenMediaVault-Plugin-Developers/installScript/master/install | sudo bash
	```

- Reboot after installation

### Test Access - Web Interface
```
You now have a shared folder accessible to all without authentication, 
we will get to basic security and authentication later in here [Security and Authentication](#security)

For more focused and specialised info on Samba security and authentication, refer to this [Documentation](#to-be-filled)
```

- Access OpenMediaVault Web Interface in a Browser
	```console
	http://[your-device-ip-address]

	# Default Username : admin	
	# Default Password : openmediavault
	```

### PostInstallations

#### Mount Filesystems for Sharing

- Select your target device you want to mount to be the shared folder
	1. Select 'Storage' > 'File Systems'
	2. Select your target device
		- Click on Mount
	NOTE: You must click "Apply" to confirm all changes

#### Create Shared Folders

1. Select 'Access Rights Management' > 'Shared Folders'
2. Select your target device for sharing
3. Click on 'Add' button
	- Fill up Shared Folder details
		+ Name
		+ Device : Mounted devices for sharing
		+ Path : Path to the shared folder on the mounted device
		+ Permissions : The permissions to the folder; Can be changed from 'priviledges'
		+ Comment
4. After completion, click on 'Apply' to confirm changes

#### Configure Access Methods
```
Located in 'services'
```

- NFS
	```
	For Linux/MacOS
	```
	- Click on 'Services' > 'NFS'
		- Under General Settings
			- Check on 'Enable' to startup NFS
			- Click on 'Save'
		- Click on "Shared"
			- Add created shared folder for sharing
			- Fill up required details

- SMB/CIFS
	```
	For Windows
	```
	- Click on 'Services' > 'SMB'
		- Under General Settings
			- Check on 'Enable' to startup SMB
			- Click on 'Save'
		- Click on "Shares"
			- Add created shared folder for sharing
			- Fill up required details

- After confirmation, to confirm changes to take effect
	- Click on 'Apply'


#### Test Access - Network Shared Drive

- Connect to the network drive
	- On Windows
		```bat
		\\[IP-Address]\share_folder_name
		```
	- On Linux/Mac
		```console
		smb://[IP-Address]/share_folder_name
		```

#### Security



## Documentation


#### Synopsis/Syntax


#### Parameter


#### Usage

### Functions

#### Synopsis/Syntax



#### Parameters


#### Usage



### Customization and Configuration


## Remarks

- After installation, OpenMediaVault may override your default ssh configs, and your user may receive the following Error Messages
	- "Permission Denied, Please try again later" even though password is correct
		+ Solution: Add your user to the group 'ssh'

## References

+ pimylifeup - Installing OpenMediaVault to a Raspberry Pi | https://pimylifeup.com/raspberry-pi-openmediavault/
+ OpenMediaVault Install Script | https://github.com/OpenMediaVault-Plugin-Developers/installScript
+ NetworkChuck - how to build a Raspberry Pi NAS (it’s AWESOME!!) | https://www.youtube.com/watch?v=gyMpI8csWis

## Resources



