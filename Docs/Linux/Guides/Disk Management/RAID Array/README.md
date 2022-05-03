# RAID Array Disk

RAID is the "Redundant Array of Inexpensive Disks" or "Redundant Array of Independent Disks" 
where the main goal of implementation is to act as a redundancy/temporary failsafe while you replace the broken storage device.

## Table of Contents
- [Information](#information)
- [Setup](#setup)
- [Documentation](#documentation)
- [Remarks](#remarks)
- [Resources](#resources)
- [References](#references)

## Information

mdadm is a Linux utility used to manage and monitor software RAID devices

RAID is extremely useful if uptime and availability are important to you or your business.

### RAID Levels

```
RAID-level | requirements | Name | Description
```
+ linear | 2 Drives | linear | Not a real RAID; acts like 0 where it combined both drives together to make 1 full drive with the combined size of both drives and striping distributes the contents of each file among the drives in the set; (WARNING) Failure of any drive causes the entire RAID 0 volume and all files to be lost; Recommend to use [Spanned volume](https://en.wikipedia.org/wiki/Non-RAID_drive_architectures#Concatenation_(SPAN,_BIG)) instead
+ 0  | 2 Drives | Striped | Combine both drives together to make 1 full drive with the combined size of both drives; Does not have much (if any) redundancy
+ 1  | 2 Drives | Mirror  | Mirror and Splits the data between the 2 drives so that if a drive is down, the alternate drive will act as a temporary failsafe until a replacement drive is inserted.
+ 4/5/6 (Striping with Parity) |  
+ 10 | 5 Drives | 

### Glossary

+ JBOD : Just a Bunch of Disks/Just a Bunch of Drives
+ RAID : Redundant Array of Inexpensive Disks/Redundant Array of Independent Disks

### Files

+ /etc/mdadm/mdadm.conf : mdadm Configuration
+ /proc/mdstat : Contains status of all RAID devices

## Setup

### Pre-Requisites

- Find out the mount points for your drives
	```console
	# 1. block id
	blkid

	# 2. List Block
	lsblk
	```
	+ Note down your device labels (/dev/sdX) for the mounted drives

### Planning

Number of Drives:
Device Labels:
RAID Level: Please refer to [RAID Levels](#raid-levels) for a list of RAID levels and their requirements
RAID volume device: 
RAID volume name: 

### Dependencies

+ mdadm

### Installing

- Debian-based
	```console
	# Update and Upgrade Official Repository
	sudo apt(-get) update && sudo apt(-get) upgrade
	
	# Install package
	sudo apt(-get) install mdadm
	```

- Arch-based
	```console
	# Update and Upgrade Official Repository
	sudo pacman -Syu
	
	# Install package
	sudo pacman -S mdadm
	```

### Create RAID volume or array

- Create 
	```console
	sudo mdadm --create --verbose /dev/md0 --level={linear|stripe|mirror|4|5|6|10} --raid-devices={>=2} /dev/sda1 /dev/sdb1 /dev/sdc1 ....
	```

- Confirm RAID array
	```console
	cat /proc/mdstat
	```

- Save RAID array
	```console
	# Open Interactive Mode
	sudo -i

	# Scan devices for issues and get device details, 
	# and output to /etc/mdadm/mdadm.conf config file
	mdadm --detail --scan >> /etc/mdadm/mdadm.conf

	# Check config
	less /etc/mdadm/mdadm.conf
	```

- Create File System
	```console
	: "
	- Synopsis/Syntax
		sudo mkfs.ext4 {options} [RAID volume]
	- Parameters
		-v : Verbose
		-m : 
		-b [bytes] : Set the number of bytes (1 byte = 8 bits)
		-E : 
		-stride=32
		-stripe-width=64
	"

	# Format RAID volume
	sudo mkfs.ext4 -v -m .1 -b 4096 -E stride=32,stripe-width=64 /dev/md0
	```

- Create mount point
	```console
	sudo mkdir -p [mount_point]/raid_name
	```

- Mount Filesystem
	```console
	sudo mount [raid_volume_label] [raid_mount_folder]
	```

- Verify contents of the mounted file system
	```console
	ls -la [raid_mount_folder]
	```

- Verify its capacity
	```console
	df -h -x devtmpfs -x tmpfs
	```

- Update the inital file system
	- Debian-based
		```console
		sudo update-initramfs -u
		```
	- Arch-based
		```console
		sudo mkinitcpio -P
		```

- Add Filesystem to /etc/fstab
	- Add via UUID
		- Get UUID of RAID volume
			+ Use lsblk to get the UUID
			```console
			# Get UUID
			lsblk

			# Append to /etc/fstab
			# Syntax: UUID={your_uuid} [mount_path] [file_type] [permissions] [start_bit] [end_bit]
			UUID={your_UUID} /mnt/raidx ext4 defaults,noatime 0 0
			```

	- Add via genfstab
		- Pre-Requisites
			+ Install arch-install-scripts
		- Append to /etc/fstab
			```console
			genfstab -U /mnt/raidx | sudo tee -a /etc/fstab
			```

- (OPTIONAL) Retrieve drive parameters
	```console
	sudo hdparm -I [raid_mount_drive]
	```

- (OPTIONAL) Retrieve test speeds
	```console
	sudo hdparm -tT --direct [raid_mount_drives]
	```

### Post-Installation

- (OPTIONAL) To change advanced parameters after creation
	```console
	: "
	Tune2fs
	- Synopsis/Syntax
		sudo tune2fs {options} [RAID volume]
	- Parameters
		-E : 
		stride=n,stripe-width=m : 
	"
	
	# Modify filesystem
	tune2fs -E stride=n,stripe-width=m /dev/md0
	```

- To Change owner of the mount point
	```console
	sudo chown user:group [raid_mount_path]
	```

## Documentation

### Synopsis/Syntax

sudo mdadm \
	# RAID volume definition
	[{options}=[arguments] [RAID_device_name (i.e. /dev/md0)]] \
	# devices to join based on RAID level
	[{options}=[arguments] [devices_1] [device_2] [device_n]...]

### Parameters

#### Output RAID volume definition

+ -C | --create : Create the RAID volume
+ -v | --verbose : Displays stdout messages with info

#### Input RAID devices

+ -l | --level=[raid_level_name] : Set the [RAID level](#raid-levels)
+ -n | --raid-devices=[number_of_devices] : Set the number of devices you want to use

#### System Information

+ -D | --detail : Check mdadm
+ -E | --examine : Information about RAID component device sdx
+ -b | --brief : For shortened/brief details
+ -Q | --query : Show human-readable summary of RAID device
+ --assemble : Restart/Assemble RAID device
+ --scan : Check and scan files in drives
+ --stop : Stop RAID device

### Usage

+ Structure
	```console
	sudo mdadm --create --verbose /dev/md0 --level={linear|stripe|mirror|4|5|6|10} --raid-devices={>=2} /dev/sda1 /dev/sdb1 /dev/sdc1 ....
	```

### Tips

- You can combine all devices you want to RAID with
	```
	# Given 2 drives with the same partition number
	# 	/dev/sda1
	#	/dev/sdb1

	# Instead of writing them seperately
	/dev/sda1 /dev/sdb1

	# You can combine the differences
	/dev/sd[ab]1
	```

### Customization and Configuration

## Remarks

## Resources

## References
- [GitHub Gist - Raspberry Pi RAID NAS Server Setup](https://gist.github.com/leandrofilipe/f9636be272f97d414652ce1f21e6b1f4)
- [Raspberry Tips - How to turn a Raspberry Pi into a file server?](https://raspberrytips.com/raspberry-pi-file-server/)
- [steafast - (Almost) Everything You Need to Know About RAID](https://www.steadfast.net/blog/almost-everything-you-need-know-about-raid)
