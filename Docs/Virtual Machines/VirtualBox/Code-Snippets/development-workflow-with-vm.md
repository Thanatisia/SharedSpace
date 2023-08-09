# Development Workflow with Virtual Machines - VirtualBox

## Information
### Notes
- When working with Virtual Machines, you can work on it either with GUI, or headless (Without a monitor; server-like)
    - When working with Headless VM
        - You may want to startup the Virtual Machine using the Hypervisor's Display Output support
            - Unlike libvirt QEMU/KVM, VirtualBox only (natively) supports RDP display output via the VRDE server
                + To use VNC display output, you need to manually and explicitly change the VRDE server in 'vboxmanage [vm-name] --vrde...'

## Setup
### Dependencies
+ VirtuaBox
### Pre-Requisites
- Using Linux
    - Add user to group 'vboxusers'
        ```console
        usermod -aG vboxusers [username]
        ```

## Documentations
### Steps
- Initial Setup
    1. [Create Virtual Machine Disks](#create-virtual-machine-disks)
    2. [Create Virtual Machine Configuration File](#create-virtual-machine-configuration-file)
- Preparing Development Environment
    3. [Startup Headless VM](#headless-vm-with-rdp)
    4. Perform development of Shellscript, project etc
- If you are doing Systems Programming, or anything requiring external Virtual (i.e. .qcow2, .vdi, .vhd)/Physical Drives
    5. [Mount Virtual Drives](#mount-virtual-drives)
    6. [Unmount Virtual Drives](#unmount-virtual-drives)
    7. [Mount Physical Drives](#mount-physical-drives)
    8. [Unmount Physical Drives](#unmount-physical-drives)

### Headless VM with RDP
- Modify VBox Virtual Machine 
    - Enable Virtual RDP Engine (VRDE): vboxmanage modifyvm "vm-name" --vrde on --vrdeport [custom-RDP-port-number (default: 3389)] --vrdeaddress=[your-host-ip-address]

- Start VBox Virtual Machine: 
    - Headless:  vboxheadless --startvm "vm-name"

- Access VM RDP instance
    - Open RDP client
        + Enter "[ip-address]:[rdp-port-number]"

### Create Virtual Machine Disks
- Create raw VMDK file with pre-partitioning
    ```console
    vboxmanage createmedium disk -filename [VM_DIRECTORY_PATH/disk.vmdk] --format=VMDK --variant RawDisk --property RawDrive=[your-block-device-disk (i.e. /dev/sdX)] --property Partitions=[Partition_Number (Separated by ',' delimited; i.e. 1,2,...,N)]
    ```

- Create RAW disk
    - Useful for
        + Running entire physical disk in VirtualBox (i.e. USB flashdrive)
    - Options
        - your-physical-block-device-disk: Specify the Disk name/label of your target disk
            - For Windows
                - The Windows convention is '\\.\PhysicalDriveX' where X is 0,1,2,3,....,n
                    + \\.\PhysicalDrive1 = /dev/sdb
                - To check for all available drives
                    - Using wmic
                        ```dos
                        wmic diskdrive get name,size,model
                        ```
                    - Using DiskPart (stands for Disk Partitioning)
                        + LIST DISK
                        + SELECT [disk]
                        + LIST PARTITION
    ```console
    vboxmanage internalcommands createrawvmdk -filename /path/to/file.vmdk -rawdisk [your-physical-block-device-disk (i.e. /dev/sdX|\\.\PhysicalDriveX)] {-register}
    ```

### Create Virtual Machine Configuration File
- Create a new Virtual Machine and Register it with VirtualBox
    - Notes
        + To unregister (when deleting), use '--deregister'
    ```console
    vboxmanage createvm -name [virtual-machine-name] -register
    ```

- Create Storage Controller and Prepare to attach RAW disk to Virtual Machine
    - Options
        - storage-controller-name: The name of the storage controller to hold the disk
            - Valid Values
                + IDE Controller: For IDE
                + SATA Controller: For SATA
        - storage-controller-type: The type of storage controller to hold the disk
            - Valid Values
                + ide: For IDE
                + sata: For SATA
    ```console
    vboxmanage storagectl [virtual-machine-name] --name [storage-controller-name] --add [controller-type]
    ```

- Attach the newly created RAW disk to the Virtual Machine
    - Options
        - port-number: Specify the port to attach the Storage Controller to the Virtual Machine; typically 0
        - device-number: Specify the device position to attach the Storage Controller to the Virtual Machine's configuration storage order; Typically 0
        - storage-medium-type: The type of storage to attach to the Virtual Machine
            - Valid Values
                + hdd: For HDD
        - vmdk-file: This is the path to the VMDK file; Format: /path/to/file.vmdk
    ```console
    vboxmanage storageattach [virtual-machine-name] --storagectl [storage-controller-name] --port [port-number (default: 0)] --device [device-number (default: 0 - the first slot)] --type [storage-medium-type] --medium [vmdk-file]
    ```

### Create new virtual disk
```console
vboxmanage createmedium disk -filename [new-file-name].vdi --size [size (in MiB)]
```

### Clone old virtual disk to new virtual disk
```console
vboxmanage clonemedium old.vdi new.vdi --existing
```

### Increasing size of VDI disks
```console
vboxmanage modifymedium disk [vdi-disk-file] --resize [new-file-size]
```

### Mount Virtual Drives
- Options
    - virtual-machine-name: Name of the target virtual machine
    - storage-controller-type: The type of storage controller to hold the disk
        - Valid Values
            + SATA
    - port-number: Specify the port to attach the Storage Controller to the Virtual Machine; typically 0
    - virtual-disk-file: This is the path to the new vdi file you want to attach; Format: file.vdi
    - medium-type: Specify the type of storage medium you want to attach
        - Value Values
            + hdd
```console
vboxmanage storageattach [virtual-machine-name] --storagectl [storage-controller-type] --port [port-number] --medium [virtual-disk-file] --type [medium-type]
```

### Unmount Virtual Drives
- Options
    - virtual-machine-name: Name of the target virtual machine
    - storage-controller-type: The type of storage controller to hold the disk
        - Valid Values
            + SATA
    - port-number: Specify the port to attach the Storage Controller to the Virtual Machine; typically 0
    - virtual-disk-file: This is the path to the new vdi file you want to attach; Set to 'none' to unmount the virtual disk
```console
vboxmanage storageattach [virtual-machine-name] --storagectl [storage-controller-type] --port [port-number] --medium none
```

### Mount Physical Drives
1. [Create RAW VMDK image file for the physical device](#create-virtual-machine-disk)
2. [Mount the RAW VMDK file to the first storage port (0)](#create-virtual-machine-configuration-file)

### Unmount Physical Drives
+ Same as [Unmount Virtual Drives](#unmount-virtual-drives)

### Unregister Virtual Disk from VirtualBox
- To remove a Virtual Disk, you need to
    1. Unregister the registered vdi file that is effectively attached to a Virtual Machine
    2. Delete vdi file
```console
vboxmanage closemedium disk old.vdi
rm old.vdi
```

## Wiki

## Resources

## References
+ [ArchWiki - VirtualBox](https://wiki.archlinux.org/title/VirtualBox)

## Remarks

