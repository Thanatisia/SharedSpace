# ArchLinux devtools binary/package: mkarchroot

## Information
### Project
+ Author: archlinux
+ Project: devtools
+ Application: mkarchroot

- Code Repositories
    + GitHub (Read-only Mirror) : https://github.com/archlinux/devtools
    + GitLab : https://gitlab.archlinux.org/archlinux/devtools

### Summary
```
Tools for ArchLinux package maintainers
```

## Setup
### Dependencies
- [archlinux/devtools](https://gitlab.archlinux.org/archlinux/devtools) : Tools for Archlinux package maintainers

### Pre-Requisites
- Make your chroot folder to store the chroot root environment
    ```console
    mkdir chroots
    ```

## Documentations
### Synopsis/Syntax
```console
mkarchroot [root-fs-mount-point] [packages-to-bootstrap]
```

### Parameters
- Positionals
    + root-fs-mount-point : Specify the mount folder path/name you wish to create as the root filesystem
    + packages-to-bootstrap : Specify all packages you want to bootstrap and install into the root filesystem; Separate all packages with a ' ' delimiter
- Optionals
    - With Arguments
    - Flags

### Usage
- Create the actual chroot directory within it
    - Using mkarchchroot
        - Explanation
            - mkarchchroot will 
                + create the actual chroot environment - named 'root' - within the folder 'chroots'
                - Afterwhich, the packages and package groups specified - in this case, 'base' - will be bootstrapped and installed into the chroot environment's filesystem
                    + 'base' is the package group that contains the root filesystem, this is necessary to make a working environment
        ```console
        mkarchroot chroots/root base
        ```

## Wiki

## Resources

## References
+ [ArchWiki - Install ArchLinux from an existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux#Using_pacman_from_the_host_system)
+ [RxOS - ReadTheDocs - Development - Creating a chrooted build environment under ArchLinux](https://rxos.readthedocs.io/en/develop/appendices/chroot_environment.html)

## Remarks

