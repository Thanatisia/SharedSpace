# Linux ISO image tool - xorriso

## Information 
### Background
+ xorriso is a CLI utility that creates, loads, manipulates and writes ISO 9660 filesystem images with Rock Ridge extension
- When the command finishes, we have a customized ISO file suitable for a USB drive, CD, or other boot media. 

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

## Documentations
### Synopsis/Syntax
```console
xorriso {options} <arguments>
```

### Parameters
- Optionals
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

### Usage
- Mount and convert a root filesystem directory into an ISOLINUX-bootable disk image
    - Explanation
        + `-map ./iso /` : Map the root directory of the modified root filesystem to the disk image directory
        + `-chmod 0755 / --` : Make the root directory of the modified root filesystem to sticky 755
    ```console
    xorriso -outdev [output-device-image-file]-custom.iso \
            -volid [disk-image-volume-ID] \
            -padding 0 \
            -compliance no_emul_toc \
            -map ./iso / \
            -chmod 0755 / -- \
            -boot_image isolinux dir=/isolinux
    ```

## Wiki

## Resources

## References
+ [GNU - xorriso](https://www.gnu.org/software/xorriso/man_1_xorriso.html)

## Remarks

