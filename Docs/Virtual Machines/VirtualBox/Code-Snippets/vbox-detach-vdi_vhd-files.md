# VirtualBox - Detach a virtual disk image (VDI/VHD) file (SATA) programatically

## Setup
### Dependencies
+ virtualbox
### Pre-Requisite
- Unmount the device/drive label in the Virtual Machine
    ```console
    sudo umount -l /mnt
    ```
- Run in sudo (Linux)/administrator mode (Windows)

## Documentation
### Steps 
- Detach SATA VDI/VHD storage file
    ```console
    vboxmanage storageattach "Target Virtual Machine Name" --storagectl "SATA" --device 0 --port [drive-port-number-to-detach] --type hdd --medium none
    ```

## Resources

## References
+ [Serverfault - How to attach a virtual hard disk using vboxmanage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)

## Remarks