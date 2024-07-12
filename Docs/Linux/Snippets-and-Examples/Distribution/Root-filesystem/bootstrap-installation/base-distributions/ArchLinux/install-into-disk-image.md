# Linux - Distribution Root/Base Filesystem Bootstrap Installation - Install into a disk image - ArchLinux

## Setup
### Dependencies
+ git
+ parted
### Pre-Requisites
- Generate an empty disk image (VDI/VHD/IMG) to mount and install into and prepare for use
    + Please refer to [this](Docs/Linux/Snippets-and-Examples/Distribution/Root-filesystem/bootstrap-installation/installing-into-disk-image.md) documentation
### Base/Root filesystem command line installation
- Bootstrap install the ArchLinux root filesystem using pacstrap
    ```bash
    pacstrap -U [root-filesystem-mount-path] base [kernel] linux-firmware [other-packages-to-bootstrap-into-rootfs]
    ```
- Chroot into the root filesystem mount path
    - Using chroot
        ```bash
        chroot [root-filesystem-mount-path]
        ``` 

## Resources

## References

## Remarks

