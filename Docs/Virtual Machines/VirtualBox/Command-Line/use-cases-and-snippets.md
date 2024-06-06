# VirtualBox - Useful Use-Cases and Snippets

## Use Cases
### Networking
- Modify Virtual Machine Settings
    - Examples
        - (Optional) List all bridgeable network interfaces on your host system
            ```console
            vboxmanage list bridgedifs
            ```
        - (Optional) Set bridge network interface to the NIC of the created virtual machine
            - Notes
                + This will enable DHCP and set a IP address assigned by the host's router
            - Parameters
                - --nic{1-N} : Set the Nth Network Interface Card to be a certain network type
                     - Network Types
                         + bridged : Created a bridged Network in NIC
                         + hostonly : Created a host-only Network in NIC
                - --bridgeadapter{1-N} : Set the bridge adapter for the Network Interface Card to the Nth slot
            ```console
            vboxmanage modifyvm "your-vm-name" --nic1 bridged --bridgeadapter1 eth0
            ```
        - (Optional) Enable VRDP server
            - Default
                + VRDP server support is disabled by default
            ```console
            vboxmanage modifyvm "your-vm-name" --vrde on
            ```
        - (Optional) Set custom VRDP server port number
            - Notes
                + Please seperate all port numbers with the ',' delimiter (i.e. 5000,5010)
                + Please specify a range port numbers using the '-' delimiter (i.e. 5010-5012)
            - Default
                + VRDP server uses TCP port 3389
            ```console
            vboxmanage modifyvm "your-vm-name" --vrde-port [port-numbers,port-range,...]
            ```

### Power
- Control Running Virtual Machine Options
    - Examples
        - (Optional) Power off the Virtual Machine
            ```console
            vboxmanage controlvm "your-vm-name" poweroff
            ```

### Virtual Machine
- Start Virtual Machine from command line as headless
    - Pre-Requisites
        - Recommended to modify settings before proceeding
            + please refer to "Modify Virtual Machine Settings" for examples
    - Steps
        - List all existing virtual machines
            + Choose a VM to start and
            + Take note of the VM's name
            ```console
            vboxmanage list vms
            ```
        - (Optional) Power off the Virtual Machine
            + Please refer to "Control Running Virtual Machine Options"
        - Start Virtual Machine in headless mode
            - Using VBoxManage
                ```console
                vboxmanage startvm "your-vm-name" --type headless
                ```
            - Using VBoxHeadless
                - Default
                    ```console
                    vboxheadless --startvm "your-vm-name"
                    ```
                - Start with options
                    - Enable VRDP server
                        ```console
                        vboxheadless --startvm "your-vm-name" --vrde on
                        ```
                    - Disable VRDP server
                        ```console
                        vboxheadless --startvm "your-vm-name" --vrde off
                        ```
                    - Enable VRDP server depending on the Virtual Machine configuration
                        ```console
                        vboxheadless --startvm "your-vm-name" --vrde config
                        ```
        - Check the virtual machine is running
            ```console
            vboxmanage list runningvms
            ```
        - Get bridged IP address of the started Virtual Machine (if provided)
            - In Windows
                ```console
                vboxmanage showvminfo "your-vm-name" | findstr "NIC 1:"
                ```
            - In Linux
                ```console
                vboxmanage showvminfo "your-vm-name" | grep "NIC 1:"
                ```
            + Note down the MAC address
            + Check the IP address on your router for DHCP

### Storage
- Detach a storage device/disk from a Virtual Machine using the command line
    - Setup
        - Pre-Requisites
            - Set your storage ports as 'hot-pluggable'
                + This is required if you wish to detach the storage from the command line while the Virtual Machine is running
                - Using VBoxManage
                    ```bash
                    VBoxManage storageattach [virtual-machine-name] --storagectl [storage-controller] --port [port-number] --hotpluggable on
                    ```

    - Using VBoxManage
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
            - Set your storage ports as 'hot-pluggable'
                + This is required if you wish to detach the storage from the command line while the Virtual Machine is running
                - Using VBoxManage
                    ```bash
                    VBoxManage storageattach [virtual-machine-name] --storagectl [storage-controller] --port [port-number] --hotpluggable on
                    ```

    - Using VBoxManage
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

## Terminologies
+ Headless : Run in the background without a GUI

## Resources

## References
+ [VirtualBox Forums - VBoxManage startvm VM --type headless vs VBoxHeadless](https://forums.virtualbox.org/viewtopic.php?t=30245)
+ [VirtualBox Documentations Chapter 7 - Remote Virtual Machines](https://www.virtualbox.org/manual/ch07.html)
+ [Serverfault - Questions - 171665 - How to attach a virtual hard disk using VBoxManage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)
+ [StackOverflow - Questions - 41463588 - How to detach VMDK using VBoxManage CLI](https://stackoverflow.com/questions/41463588/how-to-detach-vmdk-using-vboxmanage-cli)

## Remarks

