# VirtualBox - Attach a virtual disk image (VDI/VHD) file (SATA) programatically

## Setup
### Dependencies
+ virtualbox
### Pre-Requisite
- Run in sudo (Linux)/administrator mode (Windows)

## Documentation
### Steps 
- Attach SATA VDI/VHD storage file
    ```console
    vboxmanage storageattach "Target Virtual Machine Name" --storagectl "SATA" --device 0 --port [drive-port-number-to-attach-to] --type hdd --medium [location-of-target-vhd/vdi-disk-image-file]
    ```

## Resources

## References
+ [Serverfault - How to attach a virtual hard disk using vboxmanage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)

## Remarks