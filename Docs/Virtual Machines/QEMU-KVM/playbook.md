# Virtualization Hypervisor: QEMU - Playbook

## Basics
### Components
+ qemu : Emulates processors and peripherals
+ kvm  : Accelerates the emulation if the CPU has VT enabled
+ (optional) libvirt : provides a daemon and client to manipulate VMs for convenience

## Filesystem Structure
### Files
- /usr/bin : The $PREFIX/location where the qemu binaries are installed into
     + qemu-system-[architecture] : The QEMU Multi CPU architecture emulation Virtual Machine executables; The 'architecture' specifies the CPU architecture that you wish to emulate as your Virtual Machine

### Folders
TBC

## Snippets and Examples
### Basic Controls and Usage
TBC

### Multiarch Virtual Machines
- Recommended Defaults
    - General
        ```console
        qemu-system-[architecture] -name [name-of-virtual-machine] -cpu [your-cpu-codename] -m [memory (default: 1024)] -daemonize
        ```
    - Headless
        ```console
        qemu-system-[architecture] -name [name-of-virtual-machine] -vnc [vnc-static-ip-adress]:[display-output-number] -cpu [your-cpu-codename] -m [memory (default: 1024)] -drive format=raw,index=[mount-position-index],file=[virtual-image-file] -daemonize
        ```
    - Attach a Virtual Hard Drive
        ```console
        qemu-system-[architecture] [recommended ...] -hda [vdi|vhd|qcow2 virtual drive file] 
        ```
    - Attach a Disk Image (.iso)
        ```console
        qemu-system-[architecture] [recommended ...] -drive format=raw,index=[mount-position-index],file=[virtual-image-file (.iso)] 
        ```
    - Startup a Samba (SMB) server in the Virtual Machine and Mount the specified volume/folder from the host system into the virtual machine
        - Using '-net'
            ```console
            qemu-system-[architecture] [recommended ...] -net user,smb=/path/to/folder -net nic,model=virtio
            ```

## Resources

## References
+ [UNIX StackExchange - Questions - 165554 - Shared folder between QEMU guest and host](https://unix.stackexchange.com/questions/165554/shared-folder-between-qemu-windows-guest-and-linux-host)

## Remarks
