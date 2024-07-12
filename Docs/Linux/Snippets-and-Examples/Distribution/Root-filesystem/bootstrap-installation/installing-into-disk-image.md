# Linux - Distribution Root/Base Filesystem Bootstrap Installation - Install into a disk image

## Setup
### Dependencies
+ git
+ parted
### Pre-Requisites
- Generate an empty disk image (VDI/VHD/IMG) to mount and install into
    - Installing into a .img disk image file
        - Using dd
            - Explanation
                + `dd if=/dev/zero of=disk.img` : Write the contents of the input file into the output file "disk.img", in this case, create an empty file that has been zeroed out
                + `bs=1024MiB` : Specify the size of each block to write into the disk image file; The bs will be multiplied with the count to determine the total size of the output disk image file
                + `count=50` : Specify the number of blocks to write into the disk image; The count will be multiplied with the bs to determine the total size of the output disk image file
            ```bash
            dd if=/dev/zero of=disk.img bs=1024MiB count=50
            ```
        - Using fallocate
            ```bash
            sudo fallocate -l [size] disk.img
            ```
- Setup loopback devices
    ```bash
    losetup -sf
    ```
- Mount the disk image as a loopback device (loopNpX)
    ```bash
    mount -t loop disk.img
    ```
- Format disk image's partition table label
    ```bash
    sudo parted /dev/loop[disk-number] mklabel {msdos|gpt}
    ```
- Create partitions
    - BIOS (MSDOS)
        ```bash
        sudo parted /dev/loop[disk-number] mkpart [partition-type (primary|logical|extended)] [filesystem-type] [start-size] [end-size]
        ```
    - (U)EFI (GPT)
        ```bash
        sudo parted /dev/loop[disk-number] mkpart [partition-label] [filesystem-type] [start-size] [end-size]
        ```
- Set partition properties
    - Set partition as bootable
        ```bash
        sudo parted /dev/loop[disk-number] set [partition-number] boot {on|off}
        ```
    - Set partition as ESP (for UEFI)
        ```bash
        sudo parted /dev/loop[disk-number] set [partition-number] esp {on|off}
        ```
- Format partition filesystem types
    - ext4
        ```bash
        sudo mkfs.ext4 /dev/loop[disk-number]p[partition-number]
        ```
    - fat{8|16|32}
        ```bash
        sudo mkfs.fat -f{8|16|32} /dev/loop[disk-number]p[partition-number]
        ```
- Create root/base filesystem directory
    ```bash
    mkdir -pv /mnt/rootfs
    ```
- Mount the disk image loopback device's root partition to the rootfs mount directory
    ```bash
    sudo mount /dev/loop[disk-number]p[root-partition-number] /mnt/rootfs
    ```
- Create partition directories
    - Boot partition/directory
        ```bash
        mkdir -pv /mnt/rootfs/boot
        ```
    - Home partition/directory
        ```bash
        mkdir -pv /mnt/rootfs/home
        ```
- Mount the remaining disk image loopback device's partitions to the respective mount directories
    - Boot partition
        ```bash
        sudo mount /dev/loop[disk-number]p[boot-partition-number] /mnt/rootfs/boot
        ```
    - Home partition
        ```bash
        sudo mount /dev/loop[disk-number]p[home-partition-number] /mnt/rootfs/home
        ```

## Resources

## References

## Remarks

