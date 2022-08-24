# Bootloaders - Grub - grub-install

## Setup
### Pre-Requisites
- UEFI
    + system supports GPT/UEFI Boot mode

### (If UEFI/GPT) Prepare EFI Filesystem
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

### Prepare MBR/MSDOS Filesystem
- Mount mount partition
    ```
    mount /dev/sdX{n} /mnt
    ```

- Make Boot directory 
    ```console
    mkdir -p {boot-partition}/boot
    ```
- Mount Boot Partition
    ```console
    mount /dev/sdX{n} {boot-partition}/boot
    ```

## Documentation 
### Architecture 
+ x86_64-efi : 32-bit + 64-bit UEFI support
+ i386-pc

### Synopsis/Syntax
```console
grub-install {options}=<arguments> [device_Label]
```
### Parameters

#### General
+ --boot-directory=[target_path] : To explicitly specify boot directory
+ --target=[architecture] : Specify target device architecture

#### UEFI/EFI
+ --bootloader-ID=[id] : Specify Bootloader ID (default: GRUB)
+ --efi-directory=[efi folder] : Specify (U)EFI folder directory (default: efi)


## Usage 

### UEFI
- Make GRUB  folder
    ```console
    mkdir -p /boot/grub/x86_64-efi/
    ```

- Install GRUB with UEFI
    + Replace [architecture] with your system's architecture (i386, x86_64-efi etc)
    ```console
    grub-install --target=[architecture] --efi-directory=esp --bootloader-id=GRUB [device_Label]
    ```

- Generate GRUB config
    ```console 
    grub-mkconfig -o /boot/grub/grub.cfg
    ```


