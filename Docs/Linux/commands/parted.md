# Documentation - Command : Parted

## Table of Contents
* [Background](#background)
* [Documentation](#documentation)
* [Remarks](#remarks)

## Background
### Summary
- Parted is a command line/terminal partition utility, 
    + essentially this is the base of cfdisk or fdisk, with the latter being the frontend interactive menu for parted

## Setup
### Dependencies
### Pre-Requisites

## Documentation
### Syntax
```console
parted [device_name] <actions> {parameters}
```

### Parameters
- Positionals
    + device_name : aka disk label; Specify the disk device you wish to modify

- Actions
    - `mklabel {partition-table}` : Format Disk and Create a new Disk Label (partition table)
        - Partition Table
            + MSDOS (MBR) : Master Boot Record; Used primarily either for legacy, or for drives <= 2TB
            + GPT         : GUID Partiton Table; Newer format that can handle drives > 2TB but will have issues with legacy motherboards
    - `mkpart [partition-type|partition-label] [filesystem-type] [start-size] [end-size]`: Make a new partition in the disk
        - Positionals
            - partition-type|partition-label
                - If MBR
                    partition_type : The Partition's Volume type (i.e. Primary, Logical, Extended)
                - If GPT
                    partition_label : The name to set to the partition for identification, sets the PARTLABEL attribute of the partition
                        - The partition label always has to be set, since mkpart does not allow to create partitions with empty label. 
            - filesystem-type : The partition's filesystem type to be formatted with (i.e. Fat32, EXT4, Btrfs, zfs etc.)
                - Type: String
                - Type examples (there are others):
                    + FAT32 : Generally used if your Bootloader is U(EFI)
                    + Ext4
            - start_size : The beginning sector space for the partition to start filling from on creation
                - Type: String
                - Format: 
                    + `x {KB|KiB|MB|MiB|GB|GiB}`
                    - Percentages
                        + 0% = From the stop of the block
                        + 25% = 1/4 of the block
                        + 50% = Half of the block
                        + 75% = 3/4 of the block
                        + 100% = Until the end of the block
            - end_size : The ending sector space for the partition to stop filling
                - Type: String
                - Format: 
                    + `x {KB|KiB|MB|MiB|GB|GiB}`
                    - Percentages
                        + 0% = From the stop of the block
                        + 25% = 1/4 of the block
                        + 50% = Half of the block
                        + 75% = 3/4 of the block
                        + 100% = Until the end of the block

    - `resizepart [disk-name] [partition_number] [new-size]` : To resize (grow/shrink) partitions
        - Pre-Requisites:
            - As a rule of thumb - Ensure that all partitions are unmounted and not in use
                - It is difficult and hazardous to try to edit the root filesystem on a running OS; use a live media/rescue system instead.
        - Notes:
            - As of parted v4.2, resizepart may need the use of interactive mode
            - To grow a partition, you have to first resize the partition and then resize the filesystem on it
                - i.e. using
                    - ext4 : resize2f
            - To shrink a partition, the filesystem must be resized before the partition to avoid data loss
        - Positionals:
            - disk-name : aka Disk Label; Specify the target disk device the partition you wish to resize is on
            - partition_number : To resize (grow/shrink) the partition number you are editing (i.e. /dev/sdX(n)) to the new_size        
            - new-size : Specify the new size you wish to change to
                - Formats
                    + If the new size is smaller, you are shrinking the partition; This will create another partition with the removed size
                    + If the new size is larger, you are growing the partition;

    - `set [partition_number] {options}` : Set a specific setting to the partition
        - Options:
            + boot {on} : Set bootable to Boot Partition for MBR/BIOS Partition Table
            + esp {on} : Set bootable to Boot Partition for GPT/UEFI Partition Table

### Usage
- Make new Disk Label
    ```
    parted [device_name] mklabel [partition-table]
    ```
- Make new partition:
	- MSDOS (MBR BIOS)
        ```console
        parted [device_name] mkpart [partition-type] [filesystem-type] [start_size] [end_size]
        ```
	- EFI (GPT UEFI)
        ```console
        parted [device_name] mkpart [partition-label] [filesystem-type] [start_size] [end_size]
        ```
- Set Bootable:
	- MSDOS (MBR BIOS)
        ```console
        parted [device_name] set [partition_number] boot on
        ```
	- EFI (GPT UEFI)
        ```console
        parted [device_name] set [partition_number] esp on
        ```
- Removing partitions
    - Notes
        - After resizing the partition, you will also need to resize your filesystem
            - i.e. using
                - ext4 : resize2f
    ```console
    parted [disk-label] rm [partition-number]
    ```
- Resizing partitions
    ```console
    parted [disk-label] resizepart [partition-number] [new-size]
    ```

## Wiki

### Design Documents
- Preparation
	- Device Information:
		- Disk Name: 
            + AHCI/SATA: /dev/sdX
            + NVME: /dev/nvme[disk-number]
            + Loopback: /dev/loop[disk-number]
		+ Disk Size

	- Partition Design:
		- Partition Schema [MSDOS (MBR/BIOS)]:
            ```
            ==================================================================================================================
            | ROW_ID, device, partition_name (personal use only), mount_path, partition_type, filesystem_type, start_size, end_size, other_opts |
            ==================================================================================================================
            1, /dev/sdX1, Boot, /mnt/boot, primary, fat32, 0%,	1024MiB, Bootable
            2, /dev/sdX2, Root, /mnt     , primary, ext4, 1024MiB,	32768MiB
            3, /dev/sdX3, Home, /mnt/home, primary, ext4, 32768MiB, 100%
            ```

		- Partition Schema [GPT]:
            ```
            ==================================================================================================================
            | ROW_ID, device, partition_label, mount_path, filesystem_type, start_size, end_size, other_opts |
            ==================================================================================================================
            1, /dev/sdX1, Boot, /mnt/boot, fat32, 0%,	1024MiB, Bootable
            2, /dev/sdX2, Root, /mnt     , ext4, 1024MiB,	32768MiB
            3, /dev/sdX3, Home, /mnt/home, ext4, 32768MiB, 100%
            ```

## Resources

## References
+ [ArchWiki - Parted](https://wiki.archlinux.org/title/Parted)
+ [ioflood - Blog - parted](https://ioflood.com/blog/parted-linux-command)

## Remarks

