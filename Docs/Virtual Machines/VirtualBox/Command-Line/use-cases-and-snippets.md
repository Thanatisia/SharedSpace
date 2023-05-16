# VirtualBox - Useful Use-Cases and Snippets

## Use Cases
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

- Control Running Virtual Machine Options
    - Examples
        - (Optional) Power off the Virtual Machine
            ```console
            vboxmanage controlvm "your-vm-name" poweroff
            ```

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

## Terminologies
+ Headless : Run in the background without a GUI

## Resources

## References
+ [VirtualBox Forums - VBoxManage startvm VM --type headless vs VBoxHeadless](https://forums.virtualbox.org/viewtopic.php?t=30245)
+ [VirtualBox Documentations Chapter 7 - Remote Virtual Machines](https://www.virtualbox.org/manual/ch07.html)

## Remarks
