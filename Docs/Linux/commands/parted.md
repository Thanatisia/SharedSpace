# Documentation - Command : Parted

## Table of Contents
* [Background](#background)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background

Parted is the command line/terminal partition utility, similar to cfdisk or fdisk but usable in scripting

## Documentation

### Syntax

parted [device_name] <actions> {parameters}

### Parameters

- mklabel {partition-table} : Format Disk and Create a new Disk Label (partition table)

- mkpart : Make a new partition in the disk
	Syntax:
		- If MBR
			partition_type : The Partition's Volume type (i.e. Primary, Logical, Extended)
		- If GPT
			partition_label : The name to set to the partition for identification, sets the PARTLABEL attribute of the partition
				- The partition label always has to be set, since mkpart does not allow to create partitions with empty label. 
		filesystem-type : The partition's filesystem type to be formatted with (i.e. Fat32, EXT4, Btrfs, zfs etc.)
		start_size : The beginning sector space for the partition to start filling from on creation
		end_size : The ending sector space for the partition to stop filling

- resizepart [disk-name](partition_number) <values> : To resize (grow/shrink) partitions
	Pre-Requisites:
		- As a rule of thumb - Ensure that all partitions are unmounted and not in use
			- It is difficult and hazardous to try to edit the root filesystem on a running OS; use a live media/rescue system instead.
	Notes:
		- As of parted v4.2, resizepart may need the use of interactive mode
		- To grow a partition, you have to first resize the partition and then resize the filesystem on it
		- To shrink a partition, the filesystem must be resized before the partition to avoid data loss
	Options:
		partition_number [new_size] : To grow the partition number you are editing (i.e. /dev/sdX(n)) to the new_size
	

- set : Set a specific setting to the partition
	Syntax : set <partition_number>
	Options:
		boot {on} : Set bootable to Boot Partition for MBR/BIOS Partition Table
		esp {on} : Set bootable to Boot Partition for GPT/UEFI Partition Table

### Usage

- Make new Disk Label : parted [device_name] mklabel [partition-table]
- Make new partition:
	- MSDOS (MBR BIOS) : parted [device_name] mkpart [partition-type] [filesystem-type] [start_size] [end_size]
	- EFI (GPT UEFI) : parted [device_name] mkpart [partition-label] [filesystem-type] [start_size] [end_size]
- Set Bootable:
	- MSDOS (MBR BIOS) : parted [device_name] set [partition_number] boot on
	- EFI (GPT UEFI) : parted [device_name] set [partition_number] esp on

## Remarks

### Design Documents

- Preparation
	Device Information:
		Disk Name: /dev/sdX
		Disk Size: 51200 MiB

	Partition Design:
		Partition Schema [MSDOS (MBR/BIOS)]:
		==================================================================================================================
		| ROW_ID, device, partition_name (personal use only), mount_path, partition_type, filesystem_type, start_size, end_size, other_opts |
		==================================================================================================================
		1, /dev/sdX1, Boot, /mnt/boot, primary, fat32, 0%,	1024MiB, Bootable
		2, /dev/sdX2, Root, /mnt     , primary, ext4, 1024MiB,	32768MiB
		3, /dev/sdX3, Home, /mnt/home, primary, ext4, 32768MiB, 100%

		Partition Schema [GPT]:
		==================================================================================================================
		| ROW_ID, device, partition_label, mount_path, filesystem_type, start_size, end_size, other_opts |
		==================================================================================================================
		1, /dev/sdX1, Boot, /mnt/boot, fat32, 0%,	1024MiB, Bootable
		2, /dev/sdX2, Root, /mnt     , ext4, 1024MiB,	32768MiB
		3, /dev/sdX3, Home, /mnt/home, ext4, 32768MiB, 100%

### Thanks to the following for references

ArchWiki - Parted : https://wiki.archlinux.org/title/Parted