# KVM/QEMU Commands/Subpackages : virsh

## Documentations
### Synopsis/Syntax
```console
virsh [action] {options} <arguments>
```

### Parameters
- Positionals
    - Actions
        + `autostart {options} "your-virtual-machine-name|id"`: Enable autostart on host system bootup
            - Options
                + --disable : Disable Autostart on host system bootup
        - `destroy "your-virtual-machine-name|id"`  : To delete the specified Virtual Machine name/ID
        + `dominfo "your-virtual-machine-name|id"`  : List the specified Virtual Machine's domain information
        + `dumpxml "your-virtual-machine-name"`     : Dump the specified virtual machine details to a XML format output
        - `list {options} <arguments>`              : List running virtual machines
            - Options
                + --all : List all available virtual machines
        - `reboot "your-virtual-machine-name|id"`   : Restart/Reboot the specified virtual machine name/ID
        - `resume "your-virtual-machine-name|id"`   : Resume a suspended/paused Virtual Machine
        - `shutdown "your-virtual-machine-name|id"` : Shutdown a running Virtual Machine
        - `start "your-virtual-machine-name|id"`    : Start the specified virtual machine name/ID
        - `suspend "your-virtual-machine-name|id"`  : Suspend/Pause a running Virtual Machine
        - `undefine "your-virtual-machine-name|id"` : To remove the specified Virtual Machine name/ID from the list
- Optionals
    - With Arguments
    
    - Flags

### Usage
- List virtual machines
    - Running Virtual Machines
        ```console
        virsh list
        ```
    - All available Virtual Machines
        ```console
        virsh list --all
        ```
- Dump Virtual Machine details into a XML format output
    - All details
        ```console
        sudo virsh dumpxml "vm-name"
        ```
    - Get VNC port number
        ```console
        sudo virsh dumpxml "vm-name" | grep vnc
        ```
- To completely remove a Virtual Machine
    - Undefine the Virtual Machine
        ```console
        sudo virsh undefine "vm-name"
        ```
    - Destroy the Virtual Machine
        ```console
        sudo virsh destroy "vm-name"
        ```
- Enable/Disable autostarting Virtual Machine on host system bootup
    - Enable Autostart
        ```console
        sudo virsh autostart "vm-name"
        ```
    - Disable Autostart
        ```console
        sudo virsh autostart --disable "vm-name"
        ```

## Wiki
### Snippets and Examples

## Resources

## References
+ [linuxjournal - Installing and running a headless virtualization server](https://www.linuxjournal.com/content/installing-and-running-headless-virtualization-server)
+ [ostechnix - Setup headless virtualization server using KVM ubuntu](https://ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/)
+ [UNIX Cop - How to run a VM headless in QEMU/KVM](https://unixcop.com/how-to-run-a-vm-headless-in-qemu-kvm/)

## Remarks
