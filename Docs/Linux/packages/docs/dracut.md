# CLI Utility Documentation: dracut

## Information
### Background
```
dracut is an initramfs CLI utility, similar to 'mkinitcpio', that creates an initial image used by the Kernel for preloading the block device modules (such as IDE, SCSI or RAID)
which are needed to access the root/base filesystem.

Upon installing the linux kernel, you can choose between 'mkinitcpio' and 'dracut'
    - Dracut : Used by Fedora, RHEL, Gentoo, Debian, Void Linux and others
    - mkinitcpio : Used by Arch by default
```
### Program

## Setup
### Dependencies
### Pre-Requisites
### Installation
- Using package manager
    - apt
        ```console
        sudo apt install dracut
        ```
    - pacman
        ```console
        sudo pacman -S dracut
        ```
    - xbps
        ```console
        sudo xbps-install {-S} dracut
        ```
    - emerge/portage
        ```console
        sudo emerge dracut
        ```

### Testing
- If dracut works on your machine after you test it
    + You can uninstall 'mkinitcpio'

## Documentation

### Synopsis/Syntax
```console
dracut {options} [output-image-file-name]
```

### Parameters
> This list of parameters are incomplete as there are alot of options, please refer to the documentations/man page for more information
- Positionals
    - output-image-file-name : The filename of the output initramfs image
        - Valid Values
            + '/boot/[output-image-file].img'
- Optionals
    - With Arguments
        + --kver <kernel-version> : Explicitly specify the target kernel version; Please check for the linux kernel modules in '/lib/modules' for the available versions
    - Flags
        + --force : Force the generating of the initramfs image file
        + --hostonly : To generate an initramfs for the running kernel
        + --no-hostonly-cmdline : Disable command line

### Usage
- To generate an initramfs output image file
    ```console
    dracut /boot/initramfs-linux.img
    ```

- To generate an initramfs for the running kernel
    ```console
    dracut --hostonly --no-hostonly-cmdline /boot/initramfs-linux.img
    ```

- To update the initramfs with a target kernel version
    + This will generate an initramfs image file in '/boot/initramfs-<version>.img'
    ```console
    dracut --force --hostonly --kver <version-number>
    ```

## Wiki

### Snippets and Examples
- To generate a fallback initramfs output image file
    ```console
    dracut /boot/initramfs-linux-fallback.img
    ```

## Resources
+ [Kernel Documentation - Using Dracut](https://mirrors.edge.kernel.org/pub/linux/utils/boot/dracut/dracut.html)

## References
+ [ArchWiki - Dracut](https://wiki.archlinux.org/title/Dracut)
+ [Arch Manpage - Dracut](https://man.archlinux.org/man/dracut.8)

## Remarks

