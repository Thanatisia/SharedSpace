# VirtualBox - Command Line Documentations

Documentations, Tips n Tricks and Guides on VirtualBox Command Line Documentation & Manuals - VBoxManage

## Table of Contents
- [Information](#information)
- [Documentations](#documentations)
- [References](#references)

## Information

VBoxManage is a VirtualBox Utility created to Manage VirtualBox accessories and helper tools with functionality such as 
+ Creating Virtual Machine, Creating Hard Disk etc.

## Documentations

### Syntax

VBoxManage [action] [options [arguments]...]

### Params

- action : Actions you can perform
    - convertdd : Convert a Virtual Image (i.e. created by dd)
        - Syntax: `vboxmanage convertdd [path-to-virtual-hard-disk-img] [vdi-output-file].vdi`
        - Positionals
            - path-to-virtual-hard-disk-img : Specify the filepath and filename of the target image
            - vdi-output-file : Specify the filepath and filename of the output VDI/VHD file
	- createhd : To create a hard disk for a Virtual Machine
		- Syntax: VBoxManage createhd [{options} {arguments}...]
		- Options:
			+ --filename [path-to-hard-disk-file] : Set the output file name to the hard disk you want to create
			+ --size [storage_size] : Set the Storage space of the Hard Disk
				- Examples:
					+ 80000 : 80GB (1024MiB * 80)
					+ 80GiB
			+ --format [hard-disk-format] : Set the Format of the Hard Disk to create
				- Examples:
					+ VDI : Virtual Disk Image
					+ VHD : Virtual Hard Disk
	- createvm : To create a virtual machine from the terminal
		- Syntax: VBoxManage createvm [{options} {arguments}...]
		- Options:
			+ --basefolder [directory-to-root-folder] : Set the Base (Root) Folder for the Virtual Machine
			+ --name [Name of Virtual Machine] : Set Name of Virtual Machine
			+ --ostype [OS Type (i.e. Debian_64)] : Set Operating System Type
			+ --register : To Register the Virtual Machine with your Oracle VM VirtualBox Installation 
				- Default: VBoxManage createvm creates only the XML configuration for the VM, but does not register for the VM; 
					- To register after creation, run
						```console
						VBoxManage registervm
						```
	- list : List some information related to Virtual Machines depending on Keyword
		- Syntax: VBoxManage list [list-type] [{options} {arguments}...]
		- Positionals
			- list-type : The keyword/category you wish to list
				- List Categories
					+ vms : Get all existing Virtual Machines
					+ runningvms : Get all running Virtual Machines
					+ ostypes : Get all Virtual Machine Operating System types
					+ hostdvds : Get existing DVDs on the Host System
					+ hostfloppies : Get existing Floppy drives (A:) on the Host system
					+ intnets : Get Host System's Internal Network details
					+ bridgedifs : Get Host System's Bridged Network Interfaces
					+ hostonlyifs : Get Host System's Host-only Interfaces
					+ natnets : Get Host System's Network Address Translation (NAT)-based Network Interfaces
					+ dhcpservers : Get all DHCP Servers in VirtualBox
					+ hostinfo : Get all Virtual Machine's Host Information
					+ hostcpuids : Get all Virtual Machine's Host CPU IDs
					+ hddbackends : Get all Virtual Machine's HDD Backends
					+ hdds : Get all Virtual Machine's mounted Hard Disk Drives
					+ dvds : Get all Virtual Machine's mounted DVDs
					+ floppies : Get all Virtual Machine's mounted Floppy Drives
					+ usbhost : Get all Virtual Machine's USB Hosts/Devices
					+ usbfilters : Get all Virtual Machine's USB Filters
					+ systemproperties : Get all Virtual Machine's System Properties
					+ extpacks : Get all installed VirtualBox Extension Pack properties
					+ groups : Get all Virtual Machine groups
					+ webcams : Get all Webcams on Host System
					+ screenshotformats : Get VirtualBox Screenshot Formats
					+ cloudproviders : Get VirtualBox Cloud Providers
					+ cloudprofiles : Get VirtualBox Cloud Profiles
					+ cloudnets : Get VirtualBox Cloud Networks
		- Options
			+ -l | --long : Get long/verbose/detailed information
			+ -s | --sorted : Sorted by Ascending/Descending Format
	- modifyhd : To Modify an existing Virtual Hard Drive/Disk Image
		- Syntax: VBoxManage modifyhd [vdi|vhd name] [{options} {arguments}...]
		- Options:
			+ --resize N : Set the new size to expand to
	- modifyvm : To Modify an existing Virtual Machine
		- Syntax: VBoxManage modifyvm [Virtual Machine Name] [{options} {arguments}...]
		- Options: 
			- --boot(n) [boot-type] : Set the Boot Order of your bootloader; What types to run first
				- boot types:
					+ dvd
					+ disk
				- Examples:
					+ --boot1 dvd --boot2 disk --boot3 none --boot4 none : Set system to look for a DVD first before proceeding to look for disk (if failed)
            - --firmware {firmware} : Set the Virtual Machine's firmware
                - efi : Set the firmware of the Virtual Machine to EFI with the bitness matching the Virtual Machine's CPU
                - efi32 : IA32 EFI
                - efi64 : x86_64 EFI
			+ --ioapic {on|off} : Enable/Disable Input-Output Advanced Programmable Interrupt Controllers (IO APIC)
			+ --memory {ram-memory} : Set your Memory (RAM)
			+ --vram {vram-size} : Set your Virtual Memory to allocate (Optional)	
			+ --vrde {on|off} : Enable/Disable Virtual Remote Desktop Environment
			+ --vrdemulticon {on|off} : Enable/Disable Virtual Remote Desktop Environment Multicon 
			+ --vrdeport [port_number] : Set VRDE Port Number
	- storageattach : Attach a Storage Device to an existing Virtual Machine
		+ Syntax: `storageattach [Virtual Machine Name] [{options} {arguments}...]`
        - Parameters
            - Positionals
                + virtual-machine-name : Specify the name of the target virtual machine
            - Optionals:
                - With Arguments
                    - `--storagectl "Storage Controller Name"` : Set the Storage Controller to use with the Virtual Machine
                        - Storage Controllers
                            + IDE : For CD/ISO Images
                            + SATA : For Disk Images (i.e. VDI, VMDK, VHD)
                    + `--port [port_number]` : Set Port Number for the storage device (start from 0)
                    + `--device [device_number]` : Set Device Number for the Storage Device (start from 0)
                    - `--type [storage_medium_type]` : Set the type of storage 
                        - Examples:
                            + cddrive : CD Drive
                            + dvddrive : DVD Drive
                            + hdd : Hard Disk Drive
                    - `--medium [path-to-image-or-file]` : Set the path to the Image or Storage File to attach with the Storage Controller of the attached Virtual Machine (.vmdk/.vdi/.iso files etc.)
                        - Notes
                            + Set the medium as 'none' (Recommended) or 'emptydrive' to detach the storage controller's port from the Virtual Machine
                    + `--hotpluggable [on|off]` : Enables/Disables the 'hotpluggable' property/attribute of this storage port on the storage controller
	- storagectl : Modify/Create Storage Controller
		- Syntax: VBoxManage storagectl [Virtual Machine Name] [{options} {arguments}...]
		- Options:
			+ --name [Storage Controller Name] : Specify the name of the Storage Controller to control/add/modify/manage
			+ --add [Storage Type to Add] : Specify the type for the new storage device you wish to add to the target Storage Controller
				- Examples:
					+ ide : For IDE
					+ sata : For SATA 
			+ --controller [Storage Controller] : Specify the type for the target Storage Controller
				- Examples:
					+ PIIX4
					+ IntelAhci
	- internalcommands [command] : Run a list of other commands within a Virtual Machine
		- createrawvmdk : Create Raw VMDK file from a given Bootable USB Disk/Drive
			- Options:
				+ -filename [output-file-path] : Set Output Path to VMDK File 
				+ -rawdisk \\.\PhysicalDrive[drive_number] : To set the Physical Drive you want to convert

### Usage

### Create a VirtualBox VM from command line

```console
VBoxManage createvm --name [Name of Virtual Machine] --ostype [OS Type (i.e. Debian_64)] --register --basefolder [directory-to-root-folder]
```

### Create USB vmdk (Virtual Machine Disk Raw File)
- To map a Virtual Machine to the USB Drive (.vmdk file)
	- The vmdk raw file will hold the path of the bootable USB drive for VirtualBox
	- Helps VirtualBox to recognize the USB drive as a normal Virtual Disk Drive
- Syntax: VBoxManage internalcommands createrawvmdk -filename [path-to-vmdk-file-to-create] -rawdisk \\.\PhysicalDrive[drive_number]

```console
VBoxManage internalcommands createrawvmdk -filename [path-to-vmdk-file-to-create] -rawdisk \\.\PhysicalDrive[drive_number]
```

### Modify VHD/VDI Image files

```console
VBoxManage modifyhd file.vdi --resize N{GiB|GB|MiB|MB}
```

### File Conversion
- Convert the .img/.iso file into '.vdi'
    ```console
    vboxmanage convertdd [path-to-virtual-hard-disk-img] [vdi-output-file].vdi
    ```

### Modify Virtual Machine properties
- Firmware
    - Set Virtual Machine as UEFI (EFI)
        ```console
        vboxmanage modifyvm "virtual-machine-name" --firmware efi
        ```

### Storage Management
- Set your storage ports as 'hot-pluggable'
    + This is required if you wish to detach the storage from the command line while the Virtual Machine is running
    ```bash
    VBoxManage storageattach [virtual-machine-name] --storagectl [storage-controller] --port [port-number] --hotpluggable on
    ```

- Detach a storage device/disk from a Virtual Machine using the command line
    - Setup
        - Pre-Requisites
            + Set your storage ports as 'hot-pluggable'

    - Explanation
        + virtual-machine-name : Specify the name of your target virtual machine
        - storage-controller : Specify the Controller of your storage device
            + IDE  : CD/ISO
            + SATA : Virtual Disk Images (i.e. VDI/VMDK/VHD)
        + port-number : Specify the target disk port number you wish to detach from the Virtual Machine
        + medium : Set as none to detach the port from the Virtual Machine
    ```bash
    VBoxManage storageattach [virtual-machine-name] --storagectl [storage-controller] --port [port-number] --type hdd --medium none
    ```

- Attach a storage device/disk from a Virtual Machine using the command line
    - Setup
        - Pre-Requisites
            + Set your storage ports as 'hot-pluggable'

    - Explanation
        + virtual-machine-name : Specify the name of your target virtual machine
        - storage-controller : Specify the Controller of your storage device
            + IDE  : CD/ISO
            + SATA : Virtual Disk Images (i.e. VDI/VMDK/VHD)
        + port-number : Specify the target disk port number you wish to detach from the Virtual Machine
        - type : Specify the type of medium you wish to attach to the Virtual Machine
            + hdd : Hard Disk Drive Disks Image (i.e. VDI, VMDK, VHD)
        + "\path\to\disk-to-mount" : Specify the target disk you wish to mount (i.e. *.vdi, *.vmdk, *.vhd)
    ```bash
    VBoxManage storageattach [virtual-machine-name] --storagectl [storage-controller] --port [port-number] --type hdd --medium "\path\to\disk-to-mount"
    ```

## Snippets

## Wiki

## Resources

## References
+ [Serverfault - Questions - 171665 - How to attach a virtual hard disk using VBoxManage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)
+ [StackOverflow - Questions - 41463588 - How to detach VMDK using VBoxManage CLI](https://stackoverflow.com/questions/41463588/how-to-detach-vmdk-using-vboxmanage-cli)
+ [VirtualBox - How to Boot from USB | How to Convert Bootable USB device to VMDK Raw file](https://www.how2shout.com/how-to/virtualbox-virtual-machine-boot-usb.html)
+ [VirtualBox - How to create a virtualbox vm from command line | How to create a VM from Terminal](https://andreafortuna.org/2019/10/24/how-to-create-a-virtualbox-vm-from-command-line/)
+ [VirtualBox - How to resize a VirtualBox VM from command line](https://www.techrepublic.com/article/how-to-resize-a-virtualbox-vm-from-the-command-line/)

## Remarks

