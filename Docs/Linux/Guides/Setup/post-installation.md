# Linux distribution general post-installation documentation

## [Table of Contents]
- [Contents](#contents)
    + [Pre-Requisites](#pre-requisites)
    + [Post-Installation Information](#post-installation-info)
    + [Resources](#resources)
    + [References](#references)
    + [Remarks](#remarks)

## [Contents]

### Pre-Requisites
- You need to self-prepare and plan out some things, hence the following info must be prepared before proceeding

- System Design Documentation
	- Remarks
		+ Please seperate all column values with delimiter ','
		+ Please seperate all subvalues with delimiter ';'
	```
	Requirements:

	Post-Installation: 
		SwapFile Size: {MB|MiB|GB|GiB}
		Packages: 
			# Other packages to install after installation here
			NIL

	Setup Recommendations:
		Custom Window Manager to Desktop Environment Setup:
			"""
			Package Categories in a typical Desktop Environment setup:
				i. Window Manager
						

			Packages (with Categories): 
			"""

	Optional:
		File System Table (/etc/fstab):
			:: Columns
			device, mount_dir, filesystem_type, options, dump_conf_id, fsck_order
	```

### Post-Installation Info
```
	# ========================================================================== #
	# Let
	#	swapfile size: 4.0GiB
	#	packages:
	#		#[Category]={package-name}
	#		[window-manager]=bspwm;sxhkd
	#		[others]=""
	# ========================================================================== #
```

1. Create Swapfile
	- Use fallocate to generate a swapfile of size n{MB|MiB|GB|GiB}
		- Information
			- Steps
				i. Allocate swapfile of size nGiB
				ii. Change Permission of swapfile to 600
				iii. Format swapfile
				iv. Enable swapfile
				v. Append swapfile entry - if not in file systems table (/etc/fstab)
		- Synopsis/Syntax
			```console
			sudo fallocate {options} {swapfile_size} /swapfile
			```
		sudo fallocate -l 8.0GiB /swapfile
	- Change permission of swapfile
		```console
		sudo chmod 600 /swapfile
		```
	- Format swapfile
		```console
		sudo mkswap /swapfile
		```
	- Enable swapfile
		```console
		sudo swapon /swapfile
		```
	- (OPTIONAL): Append swapfile entry - if not in file systems table (/etc/fstab)
		```console
		echo "# Swapfile" | sudo tee -a /etc/fstab
		echo "/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab
		```

2. Install Packages
	- Using Package Manager
		- apt-based
			```console
			sudo apt install [packages-in-requirements]
			```
		- pacman-based
			```console
			sudo pacman -S [packages-in-requirements]
			```

- FIN. Cleanup & Sanitize
	- Safely unmount all mounted systems
		- Safely unmount 
			+ all mounted systems
				```console
				umount -a
				```
			+ only mounted
				```console
				umount -l /mnt
				```

## Wiki

## Resources

## References:
+ [1] https://myterminal.me/diary/20210724/(VIDEO)-Installing-a-Minimal-Debian-system-the-Arch-way
+ [2] https://wiki.archlinux.org/title/Installation_guide

## Remarks