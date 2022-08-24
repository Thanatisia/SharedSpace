# Linux Filesystem - (U)EFI - Installations

```
Installation steps for various bootloaders in UEFI
```

## GRUB
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


