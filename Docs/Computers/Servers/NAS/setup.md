# Server Hardware - NAS Setup

## Information
### DESCRIPTION
```
NAS - also known as a Network Attached Storage - is a Network File Sharing Server (or Network Shared Drive in Windows context).
- This means that technically, any device that has its Attached storage devices/disks shared via Network is an NAS.

Any device, a laptop connected to external hard drives by USB; by SATA; by M.2 or A NAS Storage Device with multiple bays, can be an NAS.

- The typical NAS storage device is a bay of multiple hard drives
```

## Documentations
### Components
- A Laptop with multiple USB ports OR NAS device with multiple Bay
- Server Operating System
- Storage Device(s)
    - External Hard Disks (USB)
    - Internal Hard Disks (SATA|M.2)
- (OPTIONAL) RAID : Redundant Array of Independent Disks
    + Take multiple hard disks and combine them
    - Certain RAID levels such as RAID-5 will provide redundancy that gives you extra time to install a new hard drive if one fails
	+ Refer to [RAID Basics](github.com/Thanatisia/SharedSpace/tree/main/Docs/Computers/Data%20Storage/RAID)
- Network

## Setup
### Using a Synology NAS Device with Multiple Bays
> Synology has their own Operating System and Software Suite
1. Connect your external hard disks you want to use
2. Connect your network

### Using a D.I.Y NAS File Sharing Server
1. Install an Operating System
    - Dedicated NAS Servers
	+ FreeNAS
	+ TrueNAS
2. Connect your external hard disks you want to use
3. Connect your Network
4. (OPTIONAL) Setup File Systems
    - If you are using Linux
	- File Systems
		> The following are some of the more well-known/used NAS types
		+ NTFS : ntfs-3g
		+ EXT4 : ext4
		+ FAT32 : fat -f32
	 	+ zfs
		+ btrfs
    - Windows
	> Windows uses these primarily
	+ NTFS
	+ ExFAT
5. (OPTIONAL) Setup RAID
6. Setup your Network Sharing Platforms
    - Using Linux
        - Individual Network Shared Drive/Network Sharing Filesystems/Platform
	    - Samba
	        + samba-cifs
	        + cifs-utils
	    - nfs : Network File System
        - Open Source NAS Software
	    - OpenMediaVault
    - Using Windows
	- Share Folder
		+ Create a folder to share
		- Right Click on the folder
		    - Click on "Properties"
			- Click on "Sharing"
				+ Share this folder
				+ Setup Permissions
				+ Add Description
				+ Click Done
7. Test access on your clients
    - Linux Client
	- Mounting the Remote Network Shared Drive/NAS Filesystem
	    > With Linux, you need to mount the filesystem to access it via graphical
	    - Using Samba
		```console
		mount -t samba
		```
    - Windows Client
	- Access the Filesystem from File Manager
		```batchdos
		\\[IP-address/domain of NAS/File server]\Share-Name\path\to\folders
		```
	- Mounting the Filesystem via net use
		```batchdos
		net use [drive-letter]: \\[IP-address/domain of NAS/File server]\Share-Name\path\to\folders
		```
8. FIN

## Usage

### Hybrid Cloud
- Backing up your files both on to NAS and to your cloud
	+ Great for businesses


	