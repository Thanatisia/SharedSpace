# Virtualization Hypervisor - VirtualBox : Quickstart reference and usage flow

## Quickstart
- To set the target storage device in a Virtual Machine as hotpluggable
    ```bash
    vboxmanage storageattach "your-vm-name" --storagectl SATA --port 0 --hotpluggable on
    ```

- To attach a Virtual drive file into a Virtual Machine
    - SATA VDI/VHD file
        ```bash
        vboxmanage storageattach "your-vm-name" --storagectl SATA --port 0 --type hdd --medium "path/to/disk/image.vdi"
        ```

- To detach Virtual drive file from an attached Virtual Machine
    - SATA VDI/VHD file
        ```bash
        vboxmanage storageattach "your-vm-name" --storagectl SATA --port 0 --type hdd --medium none
        ```

## Resources

## References
+ [Oracle Documentations - Virtualization - VirtualBox 6.0 - User - VBoxManage - Storageattach](https://docs.oracle.com/en/virtualization/virtualbox/6.0/user/vboxmanage-storageattach.html)
+ [Serverfault - Questions - 171665 - How to attach a virtual hard disk using VBoxManage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)
+ [StackOverflow - Questions - 41463588 - How to detach VMDK using VBoxManage CLI](https://stackoverflow.com/questions/41463588/how-to-detach-vmdk-using-vboxmanage-cli)

## Remarks

