# Virtualization Hypervisor - VirtualBox : Quickstart reference and usage flow

## Quickstart
- To attach a Virtual drive file into a Virtual Machine
    - SATA VDI/VHD file
        ```console
        vboxmanage storageattach "your-vm-name" --storagectl AHCI --port 0 --medium "path/to/disk/image.vdi" --type hdd
        ```
- To detach Virtual drive file from an attached Virtual Machine
    - SATA VDI/VHD file
        ```console
        vboxmanage storageattach "your-vm-name" --storagectl AHCI --port 0 --device 0 --medium none
        ```

