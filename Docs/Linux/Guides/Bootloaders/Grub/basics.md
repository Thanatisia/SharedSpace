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


## Steps
1. Create GRUB boot directory
    - MBR/MSDOS
    - GPT/UEFI
        ```console
        mkdir -p /boot/grub/x86_64-efi/
        ```

2. Install GRUB into bootsystem
    - MBR/MSDOS

    - GPT/UEFI
        ```console
        grub-install --target=[architecture] --efi-directory=esp --bootloader-id=GRUB [device_Label]
        ```

3. Generate GRUB Configuration files
    ```console
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

## Resources
+ [ArchWiki - Grub - Custom Grub Configuration](https://wiki.archlinux.org/title/GRUB#Custom_grub.cfg)
