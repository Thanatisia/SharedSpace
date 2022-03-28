# Documentation - Linux - Linux Live CD/ISO 

Documentation and Guides for Linux Live CD/ISO Handling and Information as well as notes on
	- How to modify a Linux Live CD

## Table of Contents

* [Background](#background)
* [Files](#files-and-folders)
* [Remarks](#remarks)

## Background

Linux Live CD/ISOs uses the Squashfs File System. The Squash File System (SquashFS) is an Read-Only file system 
- thus, when you edit anything within the live CD, you will notice that upon restarting
	- The distro will lose all files created and all modified files will reset

- This makes SquashFS very beneficial and useful in areas such as 
	- Data Backup & Recovery
	- Data Redundancy in mediums where you want to view but not change

- Using SquashFS together with mkisofs allows you to make your own custom Linux distro & live cd by
	Modifying the contents of the Live CD and re-generating the ISO [More Details Here](Modifying%20Live%20CD)
	- Use with an installer like Calamaris (which is quite widely used as of the writing of this README guide) to make
		a Linux Live CD with Installer akin to ArcoLinux (Arch-Based) or PopOS (Debian-based)

## Files and Folders
	
	./
	|
	|-- mkisofs.txt
	|
	|-- Modifying Live CD/
	|    |
	|    |-- 
	| 
	|-- README.md
	|
	|-- squashfs.txt
	
## Remarks

