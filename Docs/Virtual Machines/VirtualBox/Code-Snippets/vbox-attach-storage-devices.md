# VirtualBox - Attach a Storage Device programatically

## Information
### Storage Device
- Definition
    + A storage device is any disk/device/file that will hold a filesystem (an Operating System) and or storage (HDD).
- Examples
    - SATA
        + Virtual Hard Drive (.vhd) : Similar to a Virtual Disk Image (VDI), a VHD is a Hard Drive that is used in a Virtual Medium like a Virtual Machine
        + Virtual Disk Image (.vdi) : A raw disk image that was created Virtually and used in a Virtual Medium like a Virtual Machine
        + Virtual Media Disk (.vmdk) : A USB device that has been represented as a raw disk image to be ran in a Virtual Medium such as a Virtual Machine

## Setup
### Dependencies
+ virtualbox
### Pre-Requisite
- Run in sudo (Linux)/administrator mode (Windows)

## Documentation
### Synopsis/Syntax
- Attach storage medium
    ```console
    vboxmanage storageattach [target-virtual-machine-name] --storagectl "Storage Controller Type/Name" --device [device-number (default: 0)] --port [drive-port-number-to-attach-to (default: 0)] --type [medium-type (i.e. hdd)] --medium [location-of-target-vhd/vdi-disk-image-file]
    ```

### Parameters
- Positionals
    + target-virtual-machine-name : Your Target Virtual Machine Name
- Options
    - With Arguments
        - --device [device-number]                     : Specify the device number to use
            + Default: 0
        - --medium [location-of-target-file]           : Specify the location/path of the target file you want to attach
            + Example: /path/to/file.{vdi|vhd|vmdk etc}
            - Possible Values:
                + none : Remove the file located in the specified storage device port number
        - --port [drive-port-number-to-attach-to]      : Specify the port number to attach to
            - Explanation
                + Starting from 0, Select the port number corresponding to the attached storage mediums
                - Examples
                    - if you have 3 disk images (.vdi) attached, 
                         + disk image 0 = item-1.vdi : The first file, 
                         + disk image 1 = item-2.vdi : The second file, 
                         + disk image 2 = item-3.vdi : The third file
            + Default: 0
        - --storagectl [storage controller type/name] : Specify/define the type/name of the Storage Controller (i.e. SATA)
            - Types
                + SATA : For VHD, VDI
                + IDE  : For IDEs
                + CDROM : For CD ROMs
        - --type [medium-type]                        : Specify the storage medium's device type
            - Types
                + hdd : Hard Disk Drive
                + usb : Universal Serial Bus; aka USB
    - Flags

### Usage 
- Attach SATA VDI/VHD storage file
    ```console
    vboxmanage storageattach "Target Virtual Machine Name" --storagectl "SATA" --device 0 --port [drive-port-number-to-attach-to] --type hdd --medium [location-of-target-vhd/vdi-disk-image-file]
    ```

## Resources

## References
+ [Serverfault - How to attach a virtual hard disk using vboxmanage](https://serverfault.com/questions/171665/how-to-attach-a-virtual-hard-disk-using-vboxmanage)

## Remarks