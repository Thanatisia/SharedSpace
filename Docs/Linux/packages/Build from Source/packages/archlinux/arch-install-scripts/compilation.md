# ArchLinux arch-install-scripts

## Information

### Background
```
arch-install-scripts is a package/framework created by the ArchLinux team consisting of various
useful commands/functions/CLI utilities that are used in the archlinux CLI base-system installation steps.

genfstab and arch-chroot, for example, are usable in a general scope regardless of distribution (distro-agnostic) to make
the process of generating the filesystems table, or chrooting, easier
```

### Package
+ Package Type: Framework
+ Package Name: arch-install-scripts
+ Package Author: archlinux
- Package Sources
    + [GitHub - Latest Version](https://github.com/archlinux/arch-install-scripts)
    - Mirrors
        + NIL

## Setup
### Dependencies
+ git
- If distribution is
    - Debian-based: build-essential
    - Arch-based: base-devel
    - Void-based: base-devel
+ m4
+ make
+ coreutils
+ util-linux
+ asciidoc : For generating PDF/ascii documentations

### Pre-Requisites
- Obtain the source code
    - From GitHub (latest version)
        - Clone the repository from GitHub
            ```console
            git clone https://github.com/archlinux/arch-install-scripts
            ```

- Change directory into package folder
    ```console
    cd [Package Name]
    ```

### Compilation/Build Process
- Build/Compile
    ```console
    make {options}
    ```

### Installations
- Install compiled binaries and documentations to the system according to the maintainer's instructions
    ```console
    sudo make {options} install
    ```

## Documentation

### Package Contents/Binaries
- Binaries/Executables
    - Paths
        + User (Local) Bin : /usr/local/bin
    - Files
        + genfstab : Filesystems table generator
        + arch-chroot : A chroot wrapper used in the arch installation steps that contains all the pre-requisites before chrooting into the mount point
        + pacstrap : ArchLinux's base filesystem bootstrapper using pacman; similar to Debian's debootstrap and xbps' xbps-install

- Documentations/Manuals
    - Paths:
        + man folder : /usr/share/local/man/man8/

## Wiki

### Tips n Tricks
- Use flag '-j'
    + Parse the flag '-jX' to the make options
    - where X = number of cores/processors to use
        + To perform multithreading/multiprocessing, speeding up the compilation process

## Resources

## References

## Remarks

