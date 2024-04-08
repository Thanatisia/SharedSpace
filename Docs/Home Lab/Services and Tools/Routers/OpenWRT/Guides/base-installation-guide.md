OpenWRT - Installation Guide
============================

*Setup*
-------
> Dependencies

> Pre-Requisites

- Download the OpenWRT image from `https://downloads.openwrt.org/releases/<version-number>/targets/<platform>/<architecture>/`
    - Notes
        + Please refer to the site for a full complete list of all files, architectures, platforms and targets
    - Explanation
        + version-number: Specify the target OpenWRT you want to download
        - platform: Specify the target platform variant of your hardware
            - Platforms
                + armsr : ARM-based CPU chip variants; i.e. ARMv7, ARMv8
                + x86: The generally-used AMD/Intel chip variants; i.e. x86, x86_64 (aka 64)
        - architecture: Specify the CPU architecture of the chip
            - Architectures
                - armsr
                    + ARMv7
                    + ARMv8
                - x86
                    + 64 : 64-bit CPU
                    + generic : 32-bit CPU
    - OpenWRT image types
        - MSDOS/BIOS/MBR Motherboard Bootloader Firmware
            + generic-squashfs-combined.img.gz : This disk image uses the traditional OpenWrt layout, a squashfs read-only root filesystem and a read-write partition where settings and packages you install are stored. Due to how this image is assembled, you will have only 230-ish MB of space to store additional packages and configuration, and Extroot does not work.
            + generic-ext4-combined.img.gz     : This disk image uses a single read-write ext4 partition with no read-only squashfs root filesystem, which allows to enlarge the partition. Features like Failsafe Mode or Factory Reset won't be available as they need a read-only squashfs partition to function.
        - UEFI Motherboard Bootloader Firmware
            + generic-squashfs-combined-efi.img.gz : This disk image uses the traditional OpenWrt layout, a squashfs read-only root filesystem and a read-write partition where settings and packages you install are stored. Due to how this image is assembled, you will have only 230-ish MB of space to store additional packages and configuration, and Extroot does not work.
            + generic-ext4-combined-efi.img.gz     : This disk image uses a single read-write ext4 partition with no read-only squashfs root filesystem, which allows to enlarge the partition. Features like Failsafe Mode or Factory Reset won't be available as they need a read-only squashfs partition to function.
    ```bash
    wget https://downloads.openwrt.org/releases/<version-number>/targets/<platform>/<architecture>/openwrt-[version]-[platform]-[architecture]-[file-name]
    ```

- Untar and Extract the tarball image archive
    - Using tar
        ```bash
        tar -xvzf openwrt-[version]-[platform]-[architecture]-generic-{squashfs|ext4}-combined{-efi}.img.gz
        ```
    - Using gunzip
        ```bash
        gunzip openwrt-*.img.gz
        ```

> Installation

- Linux
    - List disk labels and blocks and plan which disk you wish to install into
        ```bash
        lsblk
        ```
    - Write disk image into the drive
        - Using dd
            - Notes
                - bs: The Block Size; The size of each individual block; Use alongside 'count' to calculate the total disk size written (bs * count)
                    + Recommended: 1M
            ```bash
            dd if=openwrt-[version]-[platform]-[architecture]-generic-{squashfs|ext4}-combined{-efi}.img.gz of=[disk-label] bs=[block-size]
            ```

- (Optional) If you are running/booting from a Virtual Machine Hypervisor
    - VirtualBox
        - Dependencies
            + VirtualBox
        - Possible Errors
            - VBoxManage: error: Cannot create the disk image "openwrt.vdi": VERR_VD_INVALID_SIZE
                - Solution
                    - Pad the image 
                        - with dd
                            ```bash
                            dd if=openwrt-[image-file].img of=openwrt.img bs=128000 conv=sync
                            ```
                        - with `VBoxManage modifymedium`
                            - Explanation
                                + This will enlarge the image to a useful size (size is in MB)
                            ```bash
                            VBoxManage modifymedium openwrt.vdi --resize 128
                            ```
                    + Use the padded image as input to VBoxManage convertfromraw
        - Convert the '.img' file to '.vdi'
            - Explanation
                + This will create the 'openwrt.vdi' Virtual Disk Image file which is a Virtual Hard Drive for the Virtual Machine
            ```bash
            VBoxManage convertfromraw --format VDI openwrt-*.img openwrt.vdi
            ```

## Documentations

- Run with VirtualBox automatically on Start of Windows OS
    - Import the following entry to your registry or add it manually:
        1. [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
        2. “VB-MYDEVICE”=“\”C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage.exe\“ startvm \”NAMEOFVBINSTANCE\“ --type headless”
    - Alternatively create 2 shortcuts and use the Windows Task scheduler
        1. “C:\Program Files\Oracle\VirtualBox\VBoxManage.exe” startvm MYDEVICE --type headless
            + Create a task in the Scheduler triggered by logon of any user as action the shortcut
        2. “C:\Program Files\Oracle\VirtualBox\VBoxManage.exe” controlvm MYDEVICE acpipowerbutton
            - Create a task in the Scheduler triggered by an event and as action the shortcut
                + Begin the task: On an event
                + Basic Log: System
                + Source: User32
                + Event ID: 1074

## Wiki

## Resources

## References
+ [OpenWRT - Documentations - User Guide - Installation - x86](https://openwrt.org/docs/guide-user/installation/openwrt_x86)
+ [OpenWRT - Documentations - User Guide - Virtualization - VirtualBox](https://openwrt.org/docs/guide-user/virtualization/virtualbox-vm)
+ [OpenWRT - Downloads - Releases - 23.05.3 - x86 - Generic](https://downloads.openwrt.org/releases/23.05.3/targets/x86/generic/)

## Remarks