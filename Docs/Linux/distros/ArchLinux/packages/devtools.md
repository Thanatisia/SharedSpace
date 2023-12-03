# ArchLinux devtools

## Information
### Project
+ Author: archlinux
+ Project: devtools

- Code Repositories
    + GitHub (Read-only Mirror) : https://github.com/archlinux/devtools
    + GitLab : https://gitlab.archlinux.org/archlinux/devtools

### Summary
```
Tools for ArchLinux package maintainers
```

## Setup
### Dependencies
+ git 
- build-essential (Equivalent to base-devel in pacman)
    + make
+ arch-install-scripts
+ awk
+ bash
+ binutils
+ coreutils
+ diffutils
+ fakeroot
+ findutils
+ grep
+ jq
+ ncurses
+ openssh
+ parallel
+ rsync
+ sed
+ systemd
+ util-linux
+ bzr
+ git
+ mercurial
+ subversion
+ asciidoc (aka a2x)
+ shellcheck

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    ```console
    git clone https://gitlab.archlinux.org/archlinux/devtools
    ```

- Change directory into folder
    ```console 
    cd devtools
    ```

#### Configurations
+ NIL

#### Build/Compile
- Build/Compile source code 
    - Using Makefile
        ```console
        make
        ```

#### Installation
- Install built binary and files to system
    - Using Makefile
        ```console
        sudo make install
        ```

#### Removal
- Uninstall installed files from system
    - Using Makefile
        ```console
        sudo make uninstall
        ```

### Post-Install Setup

## Documentations

## Wiki
### Snippets and Examples
- [Default pacman.conf file](pacman.conf)

## Resources

## References
+ [ArchWiki - Install ArchLinux from an existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux#Using_pacman_from_the_host_system)

## Remarks

