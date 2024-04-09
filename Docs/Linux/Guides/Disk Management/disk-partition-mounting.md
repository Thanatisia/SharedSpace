Linux Disk and Partition Management - Mounting disk devices and raw disk images as a chrootable filesystem
===========================================================================================================

## Information
### Description
+ One-stop reference for mounting disk devices and images to a mount point and as a chrootable root filesystem

## Documentations

### Table of Contents
+ [Manage Disk Devices](#disk-device)
+ [Manage Disk Images](#disk-image)

### Disk Device
- Disk Filesystem Management
    - Format raw disk image filesystem label
        ```bash
        parted [disk-label] mklabel [msdos|gpt]
        ```
    - Create new partitions
        ```bash
        parted [disk-label] mkpart [partition-type|partition-label] [filesystem-type] [start-size] [end-size]
        ```

- Partition Management
    - Format partition filesystem type
        - ext4
            - SATA|AHCI (/dev/sdX[partition-number])
                ```bash
                mkfs.ext4 /dev/sdX[partition-number]
                ```
            - NVME (/dev/nvme[device-number]np[partition-number])
                ```bash
                mkfs.ext4 /dev/nvme[device-number]np[partition-number]
                ```
            - Loopback device (/dev/loop[device-number]p[partition-number])
                ```bash
                mkfs.ext4 /dev/loop[device-number]p[partition-number]
                ```
        - fat{8|16|32}
            - SATA|AHCI (/dev/sdX[partition-number])
                ```bash
                mkfs.fat -f {8|16|32} /dev/sdX[partition-number]
                ```
            - NVME (/dev/nvme[device-number]np[partition-number])
                ```bash
                mkfs.fat -f {8|16|32} /dev/nvme[device-number]np[partition-number]
                ```
            - Loopback device (/dev/loop[device-number]p[partition-number])
                ```bash
                mkfs.fat -f {8|16|32} /dev/loop[device-number]p[partition-number]
                ```
    - Optionals
        - Set partition as bootable
            - MBR/MSDOS (BIOS)
                ```bash
                parted [disk-label] set [boot-partition-number] boot on
                ```
            - EFI (UEFI)
                ```bash
                parted [disk-label] set [boot-partition-number] esp on
                ```

- (Optionals) Create additional nested mount points
    - Boot Partition
        ```
        mkdir -pv [mount-point]/boot
        ```
    - Home Partition
        ```
        mkdir -pv [mount-point]/home
        ```

- Mount disk image partitions to mount point
    - Mount loopback device partitions
        - SATA|AHCI (/dev/sdX[partition-number])
            - Examples
                + Root Partition: `mount /dev/sdX2 [mount-point]/`
                + Boot Partition: `mount /dev/sdX1 [mount-point]/boot`
                + Home Partition: `mount /dev/sdX3 [mount-point]/home`
            ```bash
            mount /dev/sdX[partition-number] [mount-point]
            ```
        - NVME (/dev/nvme[device-number]np[partition-number])
            - Examples
                + Root Partition: `mount /dev/nvme[device-number]np2 [mount-point]/`
                + Boot Partition: `mount /dev/nvme[device-number]np1 [mount-point]/boot`
                + Home Partition: `mount /dev/nvme[device-number]np3 [mount-point]/home`
            ```bash
            mount /dev/nvme[device-number]np[partition-number] [mount-point]
            ```
        - Loopback device (/dev/loop[device-number]p[partition-number])
            - Examples
                + Root Partition: `mount /dev/loop[loopback-device-number]p2 [mount-point]/`
                + Boot Partition: `mount /dev/loop[loopback-device-number]p1 [mount-point]/boot`
                + Home Partition: `mount /dev/loop[loopback-device-number]p3 [mount-point]/home`
            ```bash
            mount /dev/loop[loopback-device-number]p[partition-number] [mount-point]
            ```

### Disk Image
- Create an empty raw disk image file
    - Notes
        + This will create a (10 * 1G) == 10G file
        + Do this if you wish to use a raw disk image file of another size
    - Explanation
        - bs: The Block Size; The size of each individual block; Use alongside 'count' to calculate the total disk size written (bs * count)
            + Example Value(s): 1{M|G}
        + count: The number of blocks to create; Use alongside 'bs' to calculate the total disk size written (bs * count)
    ```bash
    dd if=/dev/zero of=disk.img bs=1G count=10
    ```

- Mounting a raw disk image as a chrootable filesystem
    - Disk Filesystem Management
        - Format raw disk image filesystem label
            ```bash
            parted disk.img mklabel [msdos|gpt]
            ```
        - Create new partitions
            ```bash
            parted disk.img mkpart [partition-type|partition-label] [filesystem-type] [start-size] [end-size]
            ```

    - Mount Disk Image as loop devices
        - Modprobe loop devices
            ```bash
            modprobe -o loop
            ```
        - Mount disk image Loop devices
            ```bash
            mount -o loop disk.img
            ```

    - Partition Management
        - Format partition filesystem type
            - ext4
                ```bash
                mkfs.ext4 /dev/loop[loopback-device-number]p[partition-number]
                ```
            - fat{8|16|32}
                ```bash
                mkfs.fat -f {8|16|32} /dev/loop[loopback-device-number]p[partition-number]
                ```
        - Optionals
            - Set partition as bootable
                - MBR/MSDOS (BIOS)
                    ```bash
                    parted [disk-label] set [boot-partition-number] boot on
                    ```
                - EFI (UEFI)
                    ```bash
                    parted [disk-label] set [boot-partition-number] esp on
                    ```

    - (Optionals) Create additional nested mount points
        - Boot Partition
            ```
            mkdir -pv [mount-point]/boot
            ```
        - Home Partition
            ```
            mkdir -pv [mount-point]/home
            ```

    - Mount disk image partitions to mount point
        - Mount loopback device partitions
            - Examples
                + Root Partition: `mount /dev/loop[loopback-device-number]p2 [mount-point]/`
                + Boot Partition: `mount /dev/loop[loopback-device-number]p1 [mount-point]/boot`
                + Home Partition: `mount /dev/loop[loopback-device-number]p3 [mount-point]/home`
            ```bash
            mount /dev/loop[loopback-device-number]p[partition-number] [mount-point]
            ```

## Usage
- Chroot into the root filesystem (if any)
    ```bash
    chroot [mount-point]
    ```

- Using as a Disk Image/Virtual Hard Disk/Drive to store files
    - Change directory into mount point
        ```bash
        cd [mount-point]
        ```
    + Write files

- Backup and Restore a rootfs directly
    - Backup your system's root filesystem into a rootfs tarball archive
        - Explanation
            + c : Compress files into the tarball archive
            + v : Verbose output (i.e. show progress on screen)
            + z : Extract/Compress using the gzip compression algorithm
            + f : Specify the tar archive filename
        ```bash
        tar -cvzf rootfs.tar.gz [mount-point]
        ```

    - Untar and extract the tarball archive
        - Explanation
            + x : Extract files
            + v : Verbose output (i.e. show progress on screen)
            + z : Extract/Compress using the gzip compression algorithm
            + f : Specify the tar archive filename
        ```bash
        tar -xvzf rootfs.tar.gz
        ```

    - Untar and extract root filesystem image contents into mount point
        - Explanation
            + x : Extract files
            + v : Verbose output (i.e. show progress on screen)
            + z : Extract/Compress using the gzip compression algorithm
            + f : Specify the tar archive filename
            + -C | --directory : Specify a custom output directory to extract the files to
        ```bash
        tar -xvzf rootfs.tar.xz -C [mount-point]
        ```

## Wiki

## Resources

## References

## Remarks

