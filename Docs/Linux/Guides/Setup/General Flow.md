# Linux distribution CLI Installation Setup General Flow

* This is a documentation/rundown on the general flow used to installing any distribution from an existing distribution/system via the Command Line.
* Generally from my time installing ArchLinux and Gentoo via their command line interface installers, the methodology to setting up your host system to installing from an existing system is roughly the same at the start.
* The difference only generally starts once you start bootstrapping the distribution packages, and chroot into the mountpoint.

## Examples of CLI Installation from an existing system
+ ArchLinux via arch-install-scripts : Install from any linux distribution by bootstrapping pacman packages to a working system
+ Debian via debootstrap : Debootstrap is the official way/method that the Debian team uses to build their Debian system ISO

## Table of Contents
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Wiki](#wiki)
+ [Templates](#templates)
+ [Tips n Tricks](#tips-n-tricks)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Setup
### Pre-Requisites
- Network Connection
	+ Required for curl, wget and or any setup requirements not on local
- Update your system packages
	- Package Managers
		+ Using apt package manager
			```console
			sudo apt update && sudo apt upgrade
			```
		+ Using pacman package manager
			```console
			sudo pacman -Syu
			```
		+ Using portage
			```console
			sudo emerge --update --changed-use --deep --ask --verbose @world
			```
- Planning
	- Ensure that you plan out your system designs before working on it to focus on installation
		- Designs such as
			+ Partition Configuration and Filesystem schem(a/e)
		- Please refer to the [Templates](#templates) section for all system, partition and filesystem configuration schema's
- Host System Preparation
	- Essential/Recommended Packages
		- The following are some useful packages you may want to always have in your host system used to build the distribution
			- arch-install-scripts : This is a set of utilities used by the archiso to install archlinux via the command line; 
				- includes several useful general use-case utilities such as 
					+ arch-chroot : A general-purpose useful wrapper for 'chroot' that automatically performs the virtual mounts required when using manual chroot
					+ genfstab : for Generating a filesystems table file (fstab) into the '/etc/fstab' directory file, generally performed after unpacking the root partition tarball and mounting of partitions to get an accurate filesystems table layout
					+ pacstrap : The pacman package bootstrap; used if you are installing an archlinux system from an existing/another linux distribution/system

## Documentation
### Steps
0. [Host System Preparation](#host-system-preparation)
1. [Set Keyboard Layout](#set-keyboard-layout)
2. [Verify Boot Mode](#verify-boot-mode)
3. [Update System Clock](#update-system-clock)
4. [Prepare Disks](#prepare-disks)
5. [Mount Disks](#mount-disks)
6. [Overview and Finale](#overview-and-finale)

### Host System Preparation
- Network
	- Verify network is active
		```console
		# Get network
		ip a s
		ip link
		```
	- If there is no internet 
		- temporary fix 1: using dhcpcd
			```console
			sudo dhcpcd
			```
	- Test connection
		```console
		ping 8.8.8.8
		```

### Set Keyboard Layout
- Get Keyboard Layouts
	```console
	ls /usr/share/kbd/keymaps/**/*.map.gz
	```

- (OPTIONAL) If you are changing keyboard layouts
	```console
	loadkeys [keyboard layout code]
	```

### Verify Boot Mode (Motherboard Firmware)
- Check if firmware is UEFI
	- List efivars directory
		- If the directory displays
			+ without error: Booted in UEFI mode
			+ with error: Booted in BIOS or CSM mode
		```console
		ls /sys/firmware/efi/efivars
		```

### Update System Clock
- Sync Network Time Protocol (NTP)
	```console
	timedatectl set-ntp true
	```

- Check system clock
	```console
	timedatectl status
	```

### Prepare Disks
> This step, as I call it, is the Disk/Partition Management and Configuration step
- NOTES
	+ Please refer to [Partition Configuration Schema/Design](#partition-configuration-schema-design) for the Partition Management schema and reference it when creating the Disks
	+ Partitioning and formatting of Disk labels are permanent, please be extra careful here

- Verify disk/device/file block
	+ Note the device names (i.e. /dev/sdX)
	```console
	# List all disks
	lsblk

	# Using fdisk
	sudo fdisk -l
	```

- Prepare Disks
	- NOTES
		- Utilities and Tools
			> there are Multiple Tools for Partitioning
			- Using parted
				- Synopsis/Syntax
					- Create Device Label (aka Reformat)
						+ parted [device_name] mklabel [partition_table]
					- Creating new partition
						- If Partition Table is MSDOS (MBR)
							+ parted [device_name] mkpart [partition_type] [filesystem_Type] [start_size] [end_size]
						- If Partition Table is GPT (UEFI)
							+ parted [device_name] mkpart [partition_label] [filesystem_Type] [start_size] [end_size]
					- Formatting file system/partition
						+ mkfs.{filesystem-type} {options} [device_name](partition_number)
					- Formatting Swap
						+ mkswap [device_name](partition_number)
					- Set settings to partition
						+ parted [device_name] set [partition_number] {settings}
						- settings:
							+ boot {on|off} : Set Boot to Boot Partition of MSDOS (MBR) Partition Table
							+ esp {on|off} : Set Boot to Boot Partition of GPT Partition Table
			- Using fdisk
			- Using cgdisk
		- Information
			- Disk Label
				+ Create a [gpt] Disklabel type if the partition is GPT (UEFI) or
				+ Create a [msdos] Disklabel type if the partition is MBR (BIOS)
			- Partitions:
				- In every instance in a GPT/(U)EFI Partition Table
					- A special bootable EFI system partition is required
						+ Similar to MSDOS (MBR)'s Boot Partition
					+ Requires FAT32 while MSDOS's Boot Partition Requires EXT4
				+ EFI system partition on a MBR partition table is identified by the Partition Type ID [EF]
	- Create/Format Device Label
		- If Partition Table label is MSDOS
			+ Can be either BIOS or UEFI
			```console
			parted /dev/sdX mklabel msdos
			```
		- If Partition Table label is GPT
			+ Typically requires boot firmware to be UEFI
			```console
			parted /dev/sdX mklabel gpt
			```
	- Create Partitions
		- If Partition Table is MSDOS/MBR (running on BIOS Firmware)
			- Required Information
				+ The Master Boot Record (MBR) only supports up to a maximum of 2TB storage due to legacy reasons
			- Synopsis/Syntax
				+ Device Name : The Disk/Device/Image file path/name of your target device; i.e. /dev/sdX
				- Partition Type : The type of partition you want to create; i.e. primary, extended or logical
					- Primary : The primary parititon blocks
					- Extended 
						+ Logical
				- Partition Filesystem : The filesystem you want the partition to use
				+ Partition Start Size : The position of the memory that you want the partition to start from
					- Can be represented in percentages
						+ 0%  : Start from the beginning of the disk block
						+ 25%  : 1/4 of the device/disk/file's total size
						+ 50%  : 1/2 of the device/disk/file's total size
						+ 70%  : 3/4 of the device/disk/file's total size
				+ Partition End Size : The ending position of the memory that you want the partition to fill to
						+ 25%  : 1/4 of the device/disk/file's total size
						+ 50%  : 1/2 of the device/disk/file's total size
						+ 70%  : 3/4 of the device/disk/file's total size
						+ 100% : Allocate to the end of the device/disk/file's total size
			- Structure
				+ Syntax: parted [device_name] mkpart [partition_type] [partition_fileType] [start_size] [end_size]
			- Examples
				- Boot Partition
					```console
					parted /dev/sdX mkpart primary ext4 0% 1024MiB
					```
				- Swap Partition
					```console
					parted /dev/sdX mkpart primary swap 1024MiB x1MiB
					```
				- Root Partition
					```console
					parted /dev/sdX mkpart primary ext4 x1MiB x2MiB
					```
				- Home Partition
					```console
					parted /dev/sdX mkpart primary ext4 x2MiB 100%
					```
		- If Partition Table is GPT (running on UEFI Firmware)
			- Required Information
				+ All disk/devices/image files above 4TB needs to run on GPT because MBR only supports up to a maximum of 2TB due to legacy reasons
				+ The GPT Partition Table boot partition needs to be in FAT32 because of UEFI Bootloader Firmware requirements
			- Synopsis/Syntax
				+ Device Name : The Disk/Device/Image file path/name of your target device; i.e. /dev/sdX
				- Partition Label : A label (or a "Name") assigned to the partition
					+ Labels allows you to find the partition at '/dev/disk/by-partlabel/[your-partition-label' instead of the device name (i.e. /dev/sdX)
				- Partition Filesystem : The filesystem you want the partition to use
				+ Partition Start Size : The position of the memory that you want the partition to start from
					- Can be represented in percentages
						+ 0%  : Start from the beginning of the disk block
						+ 25%  : 1/4 of the device/disk/file's total size
						+ 50%  : 1/2 of the device/disk/file's total size
						+ 70%  : 3/4 of the device/disk/file's total size
				+ Partition End Size : The ending position of the memory that you want the partition to fill to
						+ 25%  : 1/4 of the device/disk/file's total size
						+ 50%  : 1/2 of the device/disk/file's total size
						+ 70%  : 3/4 of the device/disk/file's total size
						+ 100% : Allocate to the end of the device/disk/file's total size
			- Structure
				+ Syntax: parted [device_name] mkpart [partition_label] [partition_fileType] [start_size] [end_size]
			- Examples
				- Boot Partition
					```console
					parted /dev/sdX mkpart "Boot" fat32 0% 1024MiB
					```
				- Swap Partition
					```console
					parted /dev/sdX mkpart "Swap" swap 1024MiB x1MiB
					```
				- Root Partition
					```console
					parted /dev/sdX mkpart "Root" ext4 x1MiB x2MiB
					```
				- Home Partition
					```console
					parted /dev/sdX mkpart "Home" ext4 x2MiB 100%
					```
	- Format Partitions
		- Synopsis/Syntax
			- File Types
				- Fat{16|32}
					+ mkfs.fat -f {16|32} /dev/sdX(n)
				- EXT4
					+ mkfs.ext4 /dev/sdX(n) 
				- Swap
					+ mkswap /dev/sdX(n)
		- Examples
			- FAT32
				```console
				mkfs.fat -F32 /dev/sdX[partition-number]
				```
			- EXT4
				```console
				mkfs.ext4 /dev/sdX[partition-number]
				```
			- Swap
				```console
				mkswap /dev/sdX[partition-number]
				```
	- Set Bootable
		- If Partition Table is MSDOS/MBR
			- Syntax/Synopsis
				```console
				parted [device_name] set [partition-number] boot on
				```
			- Examples
				```console
				parted /dev/sdX set 1 boot on
				```
		- If Partition Table is GPT
			- Syntax/Synopsis
				```console
				parted [device_name] set [partition-number] esp on
				```
			- Examples
				```console
				parted /dev/sdX set 1 esp on
				```
	- (OPTIONAL) Setup Swap Partition
		- Enable swap partition
			- Synopsis/Syntax
				```console
				swapon [device-name][swap-partition-number]
				```
			- Examples
				```console
				swapon /dev/sdX(n)
				```
		- After Chroot
			- Append Swap partition to filesystems table (/etc/fstab) in mount
				```console
				echo "# -- Swap Partition 1" | tee -a /etc/fstab
				echo "UUID=device_UUID none swap defaults 0 0" | tee -a /etc/fstab
				```

### Mount Disks
- Synopsis/Syntax
	```console
	mount [device-name][partition_number] [mount-path]
	```

- Mount root volume to a mount point
	```console
	mount /dev/sdX2 /mnt
	```

- (OPTIONAL) Make your other directories to mount inside the root volume
	- Notes
		+ This is depending on your partition layout design, refer to it for more information to proceed
	- Boot directory
		- If Partition Table is MBR (MSDOS)
			```console
			mkdir -p /mnt/boot
			```
		- If Partition Table is GPT
			- Typical Boot Partition Mount Points
				+ /boot : The usual boot partition mount point and is the preferred method when directly booting on EFISTUB kernel from UEFI or booting it via a boot manager like systemd-boot
					```console
					mkdir -p /mnt/boot/
					```
				- /efi : Is a replacement for the previously popular (and is possibly still used by other Linux distros) ESP mountpoint [/boot/efi].
					+ Use a bootloader which is capable of accessing the kernel(s) and initramfs image(s) that are stored elsewhere - typically /boot
					```console
					mkdir -p /mnt/efi
					```
	- Home directory
		```console
		mkdir -p /mnt/home
		```

- Mount remaining directories after mounting root
	- Important Information
		- Ensure that you mount your root partition first before any other partition or directories
			+ Otherwise those partitions will be overwritten and mounted by the root partition
	- Examples
		- Home and Boot directories
			```console
			mount /dev/sdX1 /mnt/boot
			mount /dev/sdX3 /mnt/home
			```

### Overview and Finale
+ Past this point is where you begin bootstrapping and/or other steps required by the distribution.
- Steps may be in the following format, but not limited to
	+ Selecting of mirrors
	+ Installing essential packages (aka bootstrapping the tarball/Creating chroot environment)
	+ Generating of filesystem table (fstab) into the '/etc/fstab' file within the mountpoint root partition
	+ Chroot
		+ Set Time Zone
		+ Localization
		+ Network Configuration
		+ Set Root Password
		+ User Management
		+ Install Bootloader
+ Once you chroot into the system, this is where the bulk of the installation will begin.
This will change according to distribution

## Wiki
### Glossary
- Motherboard Bootloader Firmware
	+ BIOS
	+ UEFI
- Device/Disk Partition Table
	+ MSDOS/Master Boot Record (MBR)
	+ GUID Partition Table (GPT)
- Partition Filesystems
	+ ext4
	+ fat{8|16|32}
	+ btrfs
	+ zfs
	+ ntfs (Requires ntfs-3g)

## Templates
### Device Specifications
+ Disk Type : The type of your Disk/device/image file; i.e. VHD, MicroSD
+ Disk Label/pathname : Your Disk/Device/image file pathname; i.e. /dev/sdX
+ Disk total size : The total size of your disk/device/image file; x[MiB/GiB]
+ Partition Table : The partition table of your disk/device/image file; Pleae refer to [Glossary](#glossary) for more information

### Partition Configuration Schema/Design
- Partition Schema [MSDOS (MBR)]:
	```
	======================================================================================================================
	| ROW_ID, device_name, partition_name, mount_path, partition_type, filesystem_type, start_size, end_size, other_opts |
	======================================================================================================================
	1, /dev/sdX1, Boot, /mnt/boot, primary, ext4, 0%,	1024MiB, Bootable
	2, /dev/sdX2, Root, /mnt     , primary, ext4, 1024MiB,	xMiB
	3, /dev/sdX3, Home, /mnt/home, primary, ext4, xMiB, 100%
	```

- Partition Schema [GPT (UEFI)]:
	```
	=======================================================================================================
	| ROW_ID, device_name, partition_label, mount_path, filesystem_type, start_size, end_size, other_opts |
	=======================================================================================================
	1, /dev/sdX1, Boot, /mnt/boot, ext4, 0%     , 1024MiB, Bootable
	2, /dev/sdX2, Root, /mnt     , ext4, 1024MiB, xMiB
	3, /dev/sdX3, Home, /mnt/home, ext4, xMiB   , 100%
	```

### System Design
+ Bootloader : The bootloader you want to use to startup the operating system

### User Design
+ Region : Your system's region/country; refer to 'ls /usr/share/zoneinfo' for a full list of Regions
+ City : Your system's city in the region; refer to 'ls /usr/share/zoneinfo/[your-region]' for a full list of Cities in your region
+ Locale : The system's locale - aka the language; i.e. en_[country-code].UTF-8

### Networking
+ Hostname : The name to be assigned to your system host to be recognized on the network

## Tips n Tricks
### Chrooting
- Notes
	+ There are several mount points you need to mount before you can chroot into the system properly
	+ These are performed automatically when using the wrapper 'arch-chroot', used by ArchLinux in the archiso
	- When using --rbind, some subdirectories of dev/ and sys/ will not be unmountable. 
		- Attempting to unmount with umount -l in this situation will break your session, requiring a reboot. 
		- If possible, use -o bind instead.
- Change directory to the mount root directory
	```console
	cd [mount_path]
	```
- Mounting
	- Temporary API Virtual Filesystems
		- Information
			+ proc  : The processes virtual filesystem
			+ sysfs : system virtual filesystem
			+ dev   : Devices virtual filesystem
			+ run   : Temporary runner virtual filesystem
		```console
		# Mount temporary API filesystems
		mount -t proc /proc [mount-point]/proc
		mount -t sysfs /sys [mount-point]/sys
		mount --rbind /dev [mount-point]/dev
		mount --rbind /run [mount-point]/run # Optional
		```
	- (OPTIONAL) If you are using an UEFI system
		+ Requires access to the EFI variable in the UEFI system firmware folder
		```console
		# If you are using UEFI system
		# require access to EFI variables
		mount --rbind /sys/firmware/efi/efivars [mount-point]/sys/firmware/efi/efivars
		```
- Copying the host's DNS (Domain Name Service) resolver file to the mount point
	+ In order to use an internet connection in the chroot environment
	```console
	cp /etc/resolv.conf [mount-point]/etc/resolv.conf
	```
- Begin chroot into the system
	- Synopsis/Syntax
		```console
		# Chroot into mount directory
		sudo chroot [mount_path] [shell]
		```
	- Common Errors
		- Error [chroot: cannot run command '/usr/bin/bash': Exec format error] : Architectures of the host environment and chroot environment do not match
		- Error [chroot: '/usr/bin/bash': permission denied]					: Remount it with the execute permission - [mount -o remount,exec <new_root>]
	- Examples
		```console
		sudo chroot /mnt /bin/bash
		```

## Resources

## References
+ [ArchWiki - Chroot](https://wiki.archlinux.org/title/Chroot)
+ [ArchWiki - Install ArchLinux from existing linux distribution/system](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux)
+ [Gentoo Cheatsheet](https://wiki.gentoo.org/wiki/Gentoo_Cheat_Sheet)

## Remarks
