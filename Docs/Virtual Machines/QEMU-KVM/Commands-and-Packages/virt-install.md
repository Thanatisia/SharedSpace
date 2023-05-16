# KVM/QEMU Commands/Subpackages : virt-install

## Documentations
### Synopsis/Syntax
```console
virt-install {options} <arguments
```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + --cdrom "path-to-cd-iso-file" : Specify the path to the Disk ISO to mount onto the Virtual Machine
        - --cpu [target CPU] : Specify the target CPU configuration to expose to the guest
            - Device
                + host : (Default) Optimizes the CPU properties for the Virtual Machine by exposing the host's CPU configuration to the guest
        - --description "your description here" : Provide a description to the Virtual Machine
        - --disk {disk-image-file,[other_options] | path,size } : Specify the Disk Image to import into the virtual machine; Note that the disk image format that KVM/QEMU uses is 'qcow2'
            - Key-Value Settings
                + path=[disk-image-file] : Specify Disk Image file path
                + size=[size] : Specify the size of the disk image (in Gigabytes)
            - Positional Arguments
                - disk-image-file : Specify the disk image filepath for the Virtual Machine
                    + Format: "path-to-your-disk-image.qcow"
                    - Other Options
                        - `bus=[interface]` : Specify the storage interface to use
                            - Storage Interfaces
                                + sata : SATA Disks
        - --graphics : Specify the protocol for connecting to a display/graphical environment from a remote client to allow
            - Protocol
                + rdp : Allows RDP access to the VM from a remote client
                + vnc : Allows VNC access to the VM from a remote client
        + --memory [desired-amount-of-RAM]     : Specify memory/RAM to assign to the virtual machine (in Megabytes)
        + --name "name-of-virtual-machine"     : Specify the name of the target virtual machine
        - --network [network-type]             : Specify the network type to use
            - Network Types
                + default : Default Network
        + --os-variant [your-operating-system](version-number) : Specify what OS you are running; i.e. windows10, ubuntu22 etc; Get the options using `--osinfo list`
        - --osinfo [action] : Perform an action regarding Operating System information
            - Action
                + list : List all recognized Operating Systems
        + --vcpus [number-of-CPU-cores]        : Specify number of CPU cores to assign to the virtual machine (For multithreading/multiprocessing)
    - Flags
        + --hvm : Request the full hardware virtualization
        + --import : Import a disk image into the virtual machine
        + --noautoconsole : Run the operation in the background

### Usage
- List Operating Systems
    - All
        ```console
        virt-install --osinfo list
        ```
    - Filter a specific OS
        ```console
        virt-install --osinfo list | grep "Operating System"
        ```
- Import a disk image into a Virtual Machine
    ```console
    virt-install --import --name "TestVM" --memory 1025 --vcpus 1 --disk TestVM.qcow,bus=sata --os-variant debian6 --network default
    ```

## Wiki
### Snippets and Examples
- Creating a new Virtual Machine
    - Specifications
        + Name        : "VM1"
        + Description : "Virtual Machine 1"
        + Virtual CPU : 1
        + RAM         : 512MB
        + Disk Path   : /var/lib/libvirt/images/VM1
        + Disk Size   : 3GB
        + CDROM ISO   : /var/lib/libvirt/boot/installer.iso
        + Graphical Environment/Remote Desktop : vnc
    ```console
    sudo virt-install --name "VM1" --description "Virtual Machine 1" --ram=512 --vcpus=1 --cpu host --hvm --disk path=/var/lib/libvirt/images/VM1,size=3 --cdrom /var/lib/libvirt/boot/installer.iso --graphics vnc
    ```

## Resources

## References
+ [linuxjournal - Installing and running a headless virtualization server](https://www.linuxjournal.com/content/installing-and-running-headless-virtualization-server)
+ [ostechnix - Setup headless virtualization server using KVM ubuntu](https://ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/)
+ [RedHat Access Documentation - 3.2. Creating Guests with virt-install](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/virtualization_deployment_and_administration_guide/sect-guest_virtual_machine_installation_overview-creating_guests_with_virt_install)
+ [UNIX Cop - How to run a VM headless in QEMU/KVM](https://unixcop.com/how-to-run-a-vm-headless-in-qemu-kvm/)

## Remarks
