# ArchLinux - Bootloader - UEFI

## Setup
### Pre-Requisites
+ system supports GPT/UEFI Boot mode

### Requirements
- Folders
    + {boot_partition}/efi : EFI Boot Folder

### Prepare EFI Filesystem
- Mount mount partition
    ```
    mount /dev/sdX{n} /mnt
    ```
- Make EFI Boot Folder
    ```console
    mkdir -p {boot-partition}/efi
    ```
- Mount EFI Boot Partition
    ```console
    mount /dev/sdX{n} {boot-partition}/efi
    ```

## Documentation 
### Architecture 
+ x86_64-efi : 32-bit + 64-bit UEFI support
+ i386-pc

## Installations
### GRUB
- Make GRUB folder
    ```console
    mkdir -p /boot/grub/x86_64-efi/
    ```

- Install GRUB with UEFI
    + Replace [architecture] with your system's architecture (i386, x86_64-efi etc)
    + To explicitly specify boot directory
        + --boot-directory=/mnt/boot
    ```console
    grub-install --target=[architecture] --efi-directory=esp --bootloader-id=GRUB [device_Label]
    ```

- Generate GRUB config
    ```console 
    grub-mkconfig -o /boot/grub/grub.cfg
    ```

