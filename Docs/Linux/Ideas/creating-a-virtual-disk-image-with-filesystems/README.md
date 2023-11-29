# Create a Virtual Hard Disk file/image and mount to use as a disk

## Information
### Description
```
This idea is simple: The goal is to create a virtual hard disk - also known as a Virtual Disk Image (VDI), a Disk Image, a Disk or an Image File - format it, and mount it  
such that the disk image file can be used as a virtualized copy/clone of a disk containing a working Operating System instance - grub and all.

The benefits and use cases of this are
    - Testing installation of distribution before executing it in your primary storage device/medium.
    - Steps contains mounting tactics, which would also be useful to learn how Partition/Disk Management works as a whole in a step-by-step guide.
```

## Setup
### Dependencies
+ dd : For Disk Image creation
+ losetup : For Loopback device handling
+ mkfs : For Disk Filesystem Formatting
+ parted : For Disk Partition Management from the terminal

### Pre-Requisites
- Create a Virtual Hard Disk image
    - Explanation
        - Parameters
            - Positionals
                - path-to-virtual-hard-disk-img : This specifies the output file to create
            - Options
                - bs : This contains the size (in bytes) of each block that dd will read each time
                - count : This specifies the number of counts to write each block in the Virtual Disk
        - Therefore, to create a VHD of size 56gb
            - Options
                - bs = 1G
                - count = 56
            - 1G * 56 = 56Gb
    ```console
    dd if=/dev/zero of=[path-to-virtual-hard-disk-img] bs=[block-size (bytes-per-block)] count=[number-of-counts]
    ```

- (Optional) Create partitions in disk image
    - Using parted
        - Create Disk Label
            ```console
            parted [path-to-virtual-hard-disk-img] mklabel [msdos|gpt]
            ```
        - Create Partitions
            ```console
            parted [path-to-virtual-hard-disk-img] mkpart [partition-label|type] [filesystem-type] [starting-size] [ending-size]
            ```
        - (Optional) Enable bootable
            - Information
                + Required if this is the boot partition to allow GRUB bootloader
            ```console
            parted [path-to-virtual-hard-disk-img] set [boot-partition-number] boot on
            ```

## Body
### Disk Filesystem Management
- (Optional) Loopback device handling
    - If Disk Image contains partitions
        - Mount Disk Image and Partitions as loopback devices
            - Using losetup
                - Pre-Requisites
                    + losetup
                - Explanation
                    - Parameters
                        + -P
                        + -f : Print the first available loop device
                ```console
                sudo losetup -Pf [path-to-virtual-hard-disk-img]
                ```
        - Format mounted loopback device partitions with a file system
            ```console
            mkfs -t [file-system-type] /dev/loop[loopback-number]p[partition-number]
            ```
    - If Disk Image is a standalone disk
        - Format Virtual Hard Disk with a file system
            ```console
            mkfs -t [file-system-type] [path-to-virtual-hard-disk-img]
            ```

### Disk Mounting
- Mount Virtual Hard Disk
    - Explanation
        - Parameters
            - -o loop : Mount the Virtual Disk Image as a loop device and mount the file in '/dev/loop<n>' where n is the remaining loop number
                + You can use '-o loop=/dev/loop<number>' to explicitly set a loop number
    - If just a standalone Disk Image
        - As a loop
            ```console
            sudo mount -o loop [path-to-virtual-hard-disk-img] [mount-location]
            ```
        - As a typical storage medium
            ```console
            sudo mount -t [file-system-type] [path-to-virtual-hard-disk-img] [mount-location]
            ```
    - Disk Image contains partitions
        - Using losetup
            - Pre-Requisites
                + losetup
            ```console
            sudo mount -t [file-system-type] /dev/loop[loopback-number]p[partition-number] [mount-location]
            ```

### Post-Mount Miscelleneous
+ Make changes to store files in the Virtual Hard Disk

### Cleaning up
- Unmount Virtual Hard Disk
    ```console
    umount -l [mount-location]
    ```

## Documentation
### Usage
- Use in VirtualBox as a VDI/VHD image
    - Pre-Requisites
        - Ensure that the file is a .vdi | .vhd file
            - Convert the .img/.iso file into '.vdi'
                - Using vboxmanage
                    ```console
                    vboxmanage convertdd [path-to-virtual-hard-disk-img] [vdi-output-file].vdi
                    ```

## Wiki

## Resources

## References

## Remarks
