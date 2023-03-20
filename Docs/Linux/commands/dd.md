# Linux Command Documentation: dd

## Table of Contents:
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information
+ Command Name: Disk Destroyer
+ Abbreviation: dd
- Command Summary: Disk Utility that allows you to handle partition and disk operation such as
	1. Write to Disk
	2. Backup/Clone Disk/Partition to File or another Disk
	- Useful and good for Data Recovery and Data Forensics (Infosec Blueteam - Incident Response (IR))
	    - NOTE:
            - Warning, dd doesnt care about data redundancy and the moment you use it
                + all data will be deleted without warning.
                + Please becareful and 
                + backup all files before usage

## Setup
### Pre-Requisites
+ Backup your important files
- (OPTIONAL) Backup your install 
    - Using tar
        - In one file
            ```console
            # Compress using GZ compression scheme
            sudo tar -cvzf /
            ```
        - Seperate files
            - Backup your boot partition
                ```console
                # Compress using GZ compression scheme
                sudo tar -cvzf /boot
                ```
            - Backup your root partition without partition directories
                ```console
                # Compress using GZ compression scheme
                sudo tar -cvzf / --exclude /boot /home
                ```
            - Backup your home partition
                ```console
                # Compress using GZ compression scheme
                sudo tar -cvzf /home
                ```

### Installing
- dd is included in most if not all Linux/UNIX systems
                
## Documentation
### Synopsis/Syntax
    ```console
    dd if=[source disk/partition/file] of=[destination disk/partition/file] {options}
    ```
    
### Parameters: 
- if : Input File
	+ Syntax: dd if=[source]

- of : Output File
	+ Syntax: dd of=[destination]

- ibs : Input Block Space/Size
	- Set amount of bytes read at a time
	+ Syntax: dd if=[disk/partition/file] of=[disk/partition/file] ibs=N

- obs : Output Block Space/Size
	- Set amount of bytes written at a time
	+ Syntax: dd if=[disk/partition/file] of=[disk/partition/file] obs=N

- bs : Block Space
	- amount of data that should be read at a time
	- Syntax: dd if=[disk/partition/file] of=[disk/partition/file] bs=N
	    + Default: 512 (bytes)
	- Examples:
		+ Clone MBR : dd if=/dev/sdX of=mbr.img bs=512 count=1

- count : total amount of blocks to read
	+ Syntax: dd if=[disk/partition/file] of=[disk/partition/file] count=N

- skip : Skip specified blocks of data at the start of input
	+ Syntax: dd if=[disk/partition/file] of=/path/to/file.extension count=[bytes] skip=N
	- Examples:
		1. (Related to seek example [1]) Backup hidden data between the MBR and the first partition on the disk WITHOUT including the MBR : sudo dd if=/dev/sdX of=file_no_mbr.img count=2047 skip=1

- seek : Skip specified blocks of data at the start of output
	+ Syntax: dd if=/path/to/file.extension of=[disk/partition/file] seek=N
	- Examples:
		1. (Related to skip example [1]) Restore cloned data and write it back into the disk zone [hidden between the MBR and the first partition] : sudo dd if=after_mbr.img of=/dev/sdX seek=1

- conv

- status : Method of display for status output
	+ Syntax: dd if=[disk/partition/file] of=[disk/partition/file] status={options}
	- Options:
		+ progress : For Progress Bar
    
### Usage
- Basic/General Usage
    + Refer to this if you dont know how to start
    - Parameters
        + bs = 4096 = 4096 Bytes
        + status = progress = display progress bar
    ```console
    sudo dd if=[disk|partition|file] of=[disk|partition|file] bs=4096 status=progress
    ```

- To Clone a disk/partition
	+ Cloning typically involves 2 disks
	+ Syntax: sudo dd if=[source disk]{partition_number} of=[destination disk]{partition_number} status=progress
	- NOTE:
		- Please prepare a destination target disk with equal or more space than the source
		- If {partition_number} is empty from [source disk], dd will write the [source disk] in its entirety to the destination
		- If {partition_number} is empty from [destination disk], dd will write the [source disk] to the destination in its entirety
		- If {partition_number} is empty from both [source disk] and [destination disk], dd will write the [source disk] in its entirety to the [destination disk] in its entirety
    ```console
	sudo dd if=/dev/sdX(N) of=/dev/sdY(N) status=progress
    ```

- To Backup a Disk to File
	+ Syntax: sudo dd if=[source disk] of=/path/to/file.extension status=progress
	- After Backup, you can mount the image
		+ mount -o loop /path/to/file.extension {mount_path}
	- NOTE:
		+ File extension can be anything
	```console
	# Backup disk to file
		sudo dd if=/dev/sdX of=sdX.img status=progress

	# Mount image file
		mount -o loop sdX2.img /mnt/iso
    ```

- To Backup a Partition to File
	- Syntax: sudo dd if=[source disk]{partition_number} of=/path/to/file.extension status=progress
	- After Backup, you can mount the image
		+ mount -o loop /path/to/file.extension {mount_path}
	- NOTE:
		+ File extension can be anything
		+ If {partition_number} is empty from [source disk], dd will write the [source disk] in its entirety to the destination file
	```console
	# Backup partition to file
		sudo dd if=/dev/sdX2 of=sdX2.img status=progress

	# Mount image file
		mount -o loop sdX2.img /mnt/iso
    ```

- To compress data read by dd
	+ Pass input file dd output to compression tool and output to file
	+ Syntax: sudo dd if=[source disk] bs=1M | {compression-method}
	- via Gzip
		```
		Compress:
			Syntax: gzip -c -[compression-level] > output-file.gz
			Options:
				-c : Short for --to-stdout
					-9 : use the maximum available compression
		```
		- Compress
            ```console
			sudo dd if=/dev/sdX bs=1M | gzip -c -9 > file.dd.gz
            ```
		- Uncompress
            ```console
			gunzip file.dd.gz
            ```
	
## Resources

## References
    
## Remarks
- First partition on the disk usually starts at sector 2048 for alignment reasons
