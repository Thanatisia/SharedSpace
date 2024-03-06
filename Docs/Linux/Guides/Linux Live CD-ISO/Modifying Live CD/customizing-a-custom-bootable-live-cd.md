# Linux - Create/Customizing a custom bootable Live CD ISO using mkisofs and squashfs

## Information
### Basics
- A Live USB image is effectively a working, bootable distribution image that has been compiled with squashfs (squash filesystem) which is a immutable/ephemeral filesystem
    + This means that the image cannot be edited and changed unless you extract the image and obtain the files directly.

+ A LiveISO disk image will return to its original state on restart

## Setup
### Dependencies
+ squashfs-tools : For SquashFS
+ xorriso : For building into an ISO
+ isolinux : ISO bootloader image

### Pre-Requisites
- Create working directories to extract and modify the ISO image
    - Folders
        - custom-iso/ : Your main working directory
            + iso/ : Your extracted ISO disk image directory; Place your mounted disc image directory contents here
            + mnt/ : Your rootfs mount directory; Mount and unpack the squashfs filesystem in the 'iso/' directory here
            + squashfs/ : Your unpacked squashfs disk image directory; Copy the contents in '/mnt' here
    ```console
    mkdir -pv custom-iso/{mnt,iso,squashfs}
    ```

- (Optional) If you are creating a new SquashFS bootable disk image
    - Create a new Virtual Disk Image (VDI)/Hard Drive (VHD)
        - Using dd
            - Explanation
                - Parameters
                    + `bs=[size-per-block]` : Specify the size per each block. This will be multiplied with the 'count' parameter to produce the total disk image size; i.e. 1024M (block size) * 50 (count) = 51200M = 50GiB
                    + `count=[number-of-blocks]` : Specify the total number of blocks you wish to create. This will be multiplied with the 'bs' parameter to produce the total disk image size; i.e. 1024M (block size) * 50 (count) = 51200M = 50GiB
            ```console
            dd if=/dev/zero of=disk.img bs=[size-per-block] count=[number-of-blocks]
            ```
    - Format Disk Filesystem Label
        ```console
        sudo parted [disk-image] mklabel {msdos|gpt}
        ```
    - (Optional) Partition Management
        - Notes
            + Create as many partitions as necessary
        - Create partition schema accordingly
            - MBR (MSDOS)
                - Explanations
                    - Parameters
                        - partition-type : Specify the type this partition is using
                            - Types
                                + primary
                                - extended
                                    + logical
                        - partition-filesystem : Specify the filesystem of this partition
                            - Partitions
                                + Ext4
                                + Fat{8|16|32}
                        - start-size : Specify the starting position in the block where you want to start writing the partition
                            - Sizes
                                + Absolute Values: X{KiB|KB|MiB|MB|GiB|GB}; Ensure that the space specified is not less than the ending size of the previous partition (if any)
                                - Relative Values:
                                    - Percentages
                                        + 0% : Start at the beginning of the remaining unused block
                                        + 25% : Write 1/4 of the block starting from the last unused position
                                        + 50% : Write 1/2 of the block starting from the last unused position
                                        + 75% : Write 3/4 of the block starting from the last unused position
                        - end-size : Specify the ending position in the block where you want to write the partition to
                            - Sizes
                                + Absolute Values: X{KiB|KB|MiB|MB|GiB|GB}; Ensure that the space specified is not more than the starting size of an existing partition (if any)
                                - Relative Values:
                                    - Percentages
                                        + 100% : Write to the end of the remaining unused block
                ```console
                sudo parted [disk-image] mkpart [partition-type] [partition-filesystem] [start-size] [end-size]
                ```
            - GPT (UEFI)
                - Explanations
                    - Parameters
                        - partition-label : Specify the name/label of the partition
                        - partition-filesystem : Specify the filesystem of this partition
                            - Partitions
                                + Ext4
                                + Fat{8|16|32}
                        - start-size : Specify the starting position in the block where you want to start writing the partition
                            - Sizes
                                + Absolute Values: X{KiB|KB|MiB|MB|GiB|GB}; Ensure that the space specified is not less than the ending size of the previous partition (if any)
                                - Relative Values:
                                    - Percentages
                                        + 0% : Start at the beginning of the remaining unused block
                                        + 25% : Write 1/4 of the block starting from the last unused position
                                        + 50% : Write 1/2 of the block starting from the last unused position
                                        + 75% : Write 3/4 of the block starting from the last unused position
                        - end-size : Specify the ending position in the block where you want to write the partition to
                            - Sizes
                                + Absolute Values: X{KiB|KB|MiB|MB|GiB|GB}; Ensure that the space specified is not more than the starting size of an existing partition (if any)
                                - Relative Values:
                                    - Percentages
                                        + 100% : Write to the end of the remaining unused block
                ```console
                sudo parted [disk-image] mkpart [partition-label] [partition-filesystem] [start-size] [end-size]
                ```
        - Mount the disk image as a loop device
            ```console
            mount -o [disk-image] [mount-point]/custom-iso
            ```
        - Format the image partition (Repeat this for all partitions as required)
            - ext4
                ```console
                sudo mkfs.ext4 [disk-image]{partition-number}
                ```
            - FAT{8|16|32}
                ```console
                sudo mkfs.fat -f {8|16|32} [disk-image]{partition-number}
                ```
        - Set boot partition as bootable
            - BIOS
                ```console
                sudo parted /dev/loop[device-number] set 1 boot on
                ```
        - (Optional) Mount loop partitions in directories
            ```console
            mount /dev/loop[device-number]p{partition-number} [mount-point]
            ```

- (Optional) If you are customizing an already existing ISO image file
    - Mount the ISO image file
        ```
        /media/disk.{iso|img}
        ```
    - Change directory into custom iso root working directory
        ```console
        cd /mnt/point/custom-iso/
        ```
    - Use rsync to copy the files from the mounted disc image directory into the ISO folder
        ```console
        sudo rsync -a /media/[disk-image] iso/
        ```
    - Mount and unpack the ISO file's squashfs filesystem into the custom ISO's 'mnt' directory
        ```console
        sudo mount -o loop iso/live/filesystem.squashfs mnt/
        ```
    - Copy the unpacked contents of the squashed filesystem into the custom ISO's 'squashfs' directory
        ```console
        sudo rsync -a mnt/ squashfs/
        ```
    + The squashfs image has now been extracted and ready to be modified

- Copy the current '/etc/resolv.conf' from the host to the squashfs chroot
    + Before we chroot into the image
    ```console
    sudo cp /etc/resolv.conf squashfs/etc
    ```

### Chroot modification
- Enter the chroot
    ```console
    sudo chroot ./squashfs
    ```

- Mount Virtual Filesystems
    ```console
    mount -t proc none /proc/
    mount -t sysfs none /sys/
    ```

> Once you are inside the chroot environment, anything you changed here will remain changed

### Cleanup
> When you are ready to unmount and Re-squash the filesystem

- Remove temporary files
    ```console
    rm -rf /tmp/*
    ```

- Remove host system files from guest
    ```console
    rm /etc/resolv.conf /etc/hostname
    ```

- Unmount Virtual Filesystems
    ```console
    umount /proc/
    umount /sys/
    ```

- Exit chroot environment
    ```console
    exit
    ```

### Re-squash the filesystem
- Squash and convert the filesystem directory tree into a squashfs disk image
    + (Optional) If you are creating a new SquashFS bootable disk image
    - Synopsis/Syntax
        ```console
        sudo mksquashfs [root-filesystem] [cd-image-directory]/[filesystem-directory]/filesystem.[filesystem-type] -noappend
        ```
    - Parameters
        - working-directory : is where our temporary files and mount point will reside.
            - [working-directory]/rootfs : Root Filesystem
        + cd-image-directory : is the location of the CD tree.
        - filesystem-type : is the filesystem type. We you are going to use a compressed squashfs.
            - i.e.
                + squashfs = Use a compressed SquashFS
        + filesystem-directory : is the location of the actual filesystem image within the cd tree.
    - Usage
        ```console
        sudo mksquashfs squashfs filesystem.squashfs -noappend
        ```

- Copy the squashed filesystem disk image back into the 'iso/live' directory
    ```console
    cp filesystem.squashfs iso/live
    ```

### Build the new ISO
- Using xorriso
    - Notes
        + We can change the -outdev and -volid options to whatever names we want for the filename and volume name
        - When that command finishes, 
            + we have a customized ISO file suitable for a USB drive, CD, or other boot media. 
            + And making disk image backups on a headless device is much easier now.
    - Synopsis/Syntax
        ```console
        xorriso -outdev [output-device-image-file] \
                -volid [volume-id] \
                -padding [bit-paddings] \
                -compliance [compliance-orders] \
                -map [iso-image-directory] [mounted-root-filesystem-directory] \
                -chmod [directory-permission-modifier] [directories ...] \
                -boot_image [boot-image-filesystem] {options}={arguments} \
        ```
    - Parameters
        + `-outdev [output-device-image-file]` : Specify the custom image filename to output`
        + `-volid [disk-image-volume-ID]` : Specify the Volume ID of the Disk Image
        + `-padding [padding-space]` : Specify bit paddings to be added to the left of the partiton/filesystem; Default: 0
        - `-compliance no_emul_toc` : Specify orders that xorriso needs to comply with
            + no_emul_toc : Do not emulate toc
        + `-map [destination-directory] [source-directory]` : Map the source directory (located in the mounted root filesystem directory that contains the modified chroot) to the destination directory (located in the disk image 'iso' directory you want to copy into)
        + `-chmod [directory-permission-modifier] [directories ...]` : Set the specified permission modifier to all specified directories. Use '--' to end listing of directories
        - `-boot_image [filesystems ...] {options}=[arguments]` : Append a new bootloader image to launch the ISO disk image with
            - Filesystem : Bootloader Image Filesystem 
                - filesystems
                    + any : Any filesystem
                    + next
                    + isolinux 
            - `dir=[bootloader-configuration-directory]` : Specify the directory that contains the bootloader configurations
                - Bootloader configuration directories
                    + `/isolinux` : ISOLINUX
                    + `/boot/grub` : GRUB
            - `system_area=[bootloader-system-area]` : Specify the system area library for the bootloader
                - Libraries
                    + /usr/lib/ISOLINUX/isohdpfx.bin
            - `efi_path=[efi-image-directory]` : Specity the image bootloader (U)EFI image directory
                - UEFI image directories
                    + GRUB : boot/grub/efi.img
            - `partition_entry=[partition-table-data]` : Specify the partition table using the boot image
                - Partition Entry 
                    + gpt_basdat : GPT (GUID Partition Table)
    - Usage
        ```console
        xorriso -outdev [output-device-image-file]-custom.iso \
                -volid [disk-image-volume-ID] \
                -padding 0 \
                -compliance no_emul_toc \
                -map ./iso / \
                -chmod 0755 / -- \
                -boot_image isolinux dir=/isolinux \
                -boot_image isolinux system_area=/usr/lib/ISOLINUX/isohdpfx.bin \
                -boot_image any next \
                -boot_image any efi_path=boot/grub/efi.img \
                -boot_image isolinux partition_entry=gpt_basdat
        ```

## Documentations
### Synopsis/Syntax
### Parameters
### Usage

## Wiki

## Resources

## References
+ [ccoff github pages - Customizing Live ISO image](https://ccoff.github.io/customizing-live-iso-image)
+ [Ubuntu Forums - How to make a live CD/DVD from your harddisk installation](https://ubuntuforums.org/archive/index.php/t-688872.html)

## Remarks
