# Grub - Basics

## Information
### Basics
```
GRUB is one of the most well-known and widely used bootloaders that is easy to install and configure
```

### Boot Entries in [/boot/grub/grub.cfg]

- A basic GRUB config file uses the following options
	* (hdX,Y) is the partition Y on disk X, partition numbers starting at 1, disk numbers starting at 0
	* set default=N is the default boot entry that is chosen after timeout for user action
	* set timeout=M is the time M to wait in seconds for a user selection before default is booted
	* menuentry "title" {entry options} is a boot entry titled title
	* set root=(hdX,Y) sets the boot partition, where the kernel and GRUB modules are stored (boot need not be a separate partition, and may simply be a directory under the "root" partition (/)

- Boot menu entry
	```
	Syntax:
		menuentry "name" {
			# commands
		}
	```

### Notes
- Installation
	- Depending on the Bootloader Filesystem, MBR or UEFI,
		+ MBR : GRUB must be installed in the Disk Label (/dev/sdX)
		- (U)EFI : GRUB can be installed in the Boot partition (/dev/sdX1 usually)
			+ Within the EFI folder

## Folders

## Files
+ /boot/grub/grub.cfg : The custom grub configuration file
+ /etc/default/grub : The default GRUB directory; used by 'grub-install' to generate the grub core.img file

## Commands
### Main
> Grub has 2 main commands you will generally use
+ grub-install : To install GRUB Bootloader into the boot system
+ grub-mkconfig : To generate the grub configuration files
- grub-mkfont : To convert a target font into a font that GRUB can actually read
	- GRUB readable fonts
		+ .pf2

### Helper Utilities
> Grub has other helper utilities that may be useful with the configuration
+ grub-mkimage : Used to generate image manually 

## Setup
### Pre-Requisites
- Partition Configuration
	- If using MBR/MSDOS (Partition Table)/BIOS (Motherboard Firmware)
		- Create MBR/MSDOS Partition Table/Label
			```console
			parted /dev/sdX mklabel msdos
			```
		- Create Boot Partition
			+ use 'ext4' filesystem
			```console
			parted /dev/sdX mkpart [partition-type] ext4 [start-size] [end-size]
			```
		- Format Boot Partition
			```console
			mkfs.ext4 /dev/sdX
			```
		- Enable Bootable Flag to Boot Partition
			```console
			parted /dev/sdX set 1 boot on
			```
	- If using GPT (Partition Table)/UEFI (Motherboard Firmware)
		- Create GPT Partition Table/Label
			```console
			parted /dev/sdX mklabel gpt
			```
		- Create Boot Partition
			- Notes
				+ use 'fat32' filesystem due to UEFI firmware ESP requirements
				+ GPT uses Partition Labels - effectively, these are names tagged to the target disk/device in use - instead of Partition Types (i.e. primary, extended, logical)
					- Device partitions can then be searched in '/dev/disk/by-partlabel/[your-partition-label]' instead of its UUID or its disk name (i.e. /dev/sdX)
			```console
			parted /dev/sdX mkpart "Your-Filesystem-Label" fat32 [start-size] [end-size]
			```
		- Format Boot Partition
			```console
			mkfs.fat -F32 /dev/sdX
			```
		- Enable Bootable Flag to Boot Partition
			```console
			parted /dev/sdX set 1 esp on
			```

- Mounting Partitions
	- (Optional) Create Root Directory
		```console
		mkdir -p /mnt
		```
	- Mount Root Partition to Root directory
		```console
		mount [root-partition] [mount-point]
		```
	- Create Boot Directory
		```console
		mkdir -p [mount-point]/boot
		```
	- (OPTIONAL) Create EFI boot directory
		+ If using GPT (Partition Table)/UEFI (Motherboard Firmware)
		```console
		mkdir -p [mount-point]/boot/efi
		```
	- Mount Boot partition to Boot directory
		```console
		mount [boot-partition] [mount-point]/boot
		```

- Chroot into mounted filesystem
	- Mount temporary filesystem APIs
		```console
		# Mount temporary API filesystems
		mount -t proc /proc [mount-point]/proc
		mount -t sysfs /sys [mount-point]/sys
		mount --rbind /dev [mount-point]/dev
		mount --rbind /run [mount-point]/run # Optional

		# If you are using UEFI system
		# require access to EFI variables
		mount --rbind /sys/firmware/efi/efivars [mount-point]/sys/firmware/efi/efivars
		```
	- Copying the host's DNS (Domain Name Service) resolver file to the mount point
		```console
		# In order to use an internet connection in the chroot environment
		cp /etc/resolv.conf [mount-point]/etc/resolv.conf
		```
	- Start Chroot
		```console
		chroot [mount-point] [shell]
		```

### Dependencies
+ grub
- If you are using UEFI
	+ efibootmgr

### Steps
1. Create GRUB boot directory
	```console
	mkdir -p /boot/grub
	```

2. Install GRUB into bootsystem
	- NOTES
		+ Install it to your target disk/device label/partition table, not partition label
    - MBR/MSDOS
		- Parameters
			- --target : Your target system architecture
				+ Recommended: i386-pc
		- Optional Flags
			+ --debug : Display verbose messages
		- Synopsis/Syntax
			```console
			grub-install --target=[architecture] {other options} [device_Label]
			```
		- Examples
			```console
			grub-install --target=i386-pc --debug /dev/sdX
			```

    - GPT/UEFI
		- Parameters
			- --target : Your target system Architecture
				+ Recommended: x86_64-efi
			- --efi-directory : Your EFI system/boot partition directory
				- Notes
					+ Recommended to place it in the same directory as where you mounted
				- Possible Values
					+ /boot
					+ /boot/efi
			- --bootloader-id : Your Bootloader's identifier
				- Default: GRUB
		- Optional Flags
			+ --debug : Display verbose messages
		- Synopsis/Syntax
			```console
			grub-install --target=[architecture] --efi-directory=[your-EFI-system/boot-partition] --bootloader-id=GRUB {other options} [device_Label]
			```
		- Examples
			```console
			grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB --debug /dev/sdX
			```

3. Generate GRUB Configuration files
	- Parameters
		- -o : Your grub configuration file output path
			+ Recommended: [Your-Mounted-Boot-Partition]/grub/grub.cfg
			+ Default: /boot/grub/grub.cfg
    ```console
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

## Wiki
### Target Architectures
+ x86_64-efi : For x86_64 and UEFI Bootloader Motherboard Firmware systems
+ i386-pc : For all general non-UEFI (BIOS) Firmware systems

### Terminologies
- device_Label : aka Disk name; this is the path + name of the disk you want to install into/use; i.e. /dev/sdX
- MBR : Master Boot Record; A Partition Table; usable only by drives less than 2TB (Legacy reasons)
- GPT : GUID Partition Table; A Partition Table; required if drives are more than 2TB
- BIOS : aka MSDOS; A Motherboard Bootloader Firmware; used by older hardware that doesnt support UEFI
- UEFI : Universal EFI; A Motherboard Bootloader Firmware

## Resources
+ [ArchWiki - Grub - Custom Grub Configuration](https://wiki.archlinux.org/title/GRUB#Custom_grub.cfg)
