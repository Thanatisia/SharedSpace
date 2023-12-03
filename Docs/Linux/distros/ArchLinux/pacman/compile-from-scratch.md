# ArchLinux - pacman package manager - Compile from Scratch

## Information
### Project
+ Author: archlinux
+ Project: pacman

- Code Repositories
    + GitLab  : https://gitlab.archlinux.org/pacman/pacman

## Setup
### Dependencies
+ git 
+ build-essential (Equivalent to base-devel in pacman)
+ meson
+ ninja-build 
+ cmake
+ pkg-config
+ libarchive(-dev)
+ libcurl(4-openssl-dev)
+ libcrypto++(-dev)
+ libgpgme(-dev)
+ libssl(-dev)

### Pre-Requisites
- Performing within a non-ArchLinux system
    - Create a chroot environment with pacman/for ArchLinux
        - Using 'archlinux/devtools'
            - Dependencies
                - [archlinux/devtools](https://gitlab.archlinux.org/archlinux/devtools) : Tools for Archlinux package maintainers
        - Make your chroot folder to store the chroot root environment
            ```console
            mkdir chroots
            ```

        - Create the actual chroot directory within it
            - Using mkarchchroot
                - Explanation
                    - mkarchchroot will 
                        + create the actual chroot environment - named 'root' - within the folder 'chroots'
                        - Afterwhich, the packages and package groups specified - in this case, 'base' - will be bootstrapped and installed into the chroot environment's filesystem
                            + 'base' is the package group that contains the root filesystem, this is necessary to make a working environment
                ```console
                mkarchchroot chroots/root base
                ```

        - Edit the mirrorlist within the chroot environment to facilitate the downgrade
            - Explanation
                - Write the line 'Server = https://archive.archlinux.org/repos/[year]/[month]/[date]/$repo/os/$arch' into the mirrorlist of the chroot environment
                    - where
                        + year = the year of the repository; i.e. 2016
                        + month = the month of the repository; i.e. 02 = February
                        + date = the date of the repository; i.e. 19
            ```console
            echo 'Server = https://archive.archlinux.org/repos/[year]/[month]/[date]/$repo/os/$arch' > [chroot-environment-path]/root/etc/pacman.d/mirrorlist
            ```

        - Enter the chroot environment
            - Explanation
                + This is just basically chroot (Change root)-ing into the newly create ArchLinux filesystem chroot environment as per normal
                - However, in this example
                    - We will be using 'arch-chroot' which can be found in the ArchLinux package 'arch-install-scripts' which is effectively a wrapper that 
                        + performs several mounts before chroot is ran
            ```console
            sudo arch-chroot [chroot-environment-path]/root [shell]
            ```

        - In the chroot environment
            - Update accordingly
                ```console
                pacman -Syu
                ```


#### Cloning Repository
- Clone Repository
    ```console
    git clone https://gitlab.archlinux.org/pacman/pacman
    ```

- Change directory into folder
    ```console 
    cd pacman
    ```

- Initialize git submodule list
    ```console
    git submodule init
    ```

- Update folder and clone all submodules recursively
    ```console
    git submodule update --recursive
    ```

#### Configurations
- Configure meson with options required to be executed during build/compilation
    - Options
    ```console
    meson build
    ```

#### Build/Compile
- Build/Compile source code 
    - Using ninja
        ```console
        ninja -C build
        ```

#### Installation
- Install built binary and files to system
    - Using ninja
        ```console
        sudo ninja -C build install
        ```

### Post-Install Setup
- Add Pacman repositories into '/etc/pacman.conf'
    - Explanation
        - '/etc/pacman.conf' contains the pacman configurations, including repositories and package management
        - To add repositories into your pacman configuration
            - Add the repo-name, Server name, Repository mirror list path (Include) and other required settings
                ```conf
                [repository-name]
                Server = ServerName
                Include = Repository-Mirrorlist-Include-Path
                ```
    - core package repositories
        ```conf
        [core]
        Include = /etc/pacman.d/mirrorlist
        ```
    - extra package repositories
        ```conf
        [extra]
        Include = /etc/pacman.d/mirrorlist
        ```
    - community package repositories
        ```conf
        [community]
        Include = /etc/pacman.d/mirrorlist
        ```
    - (Optional) multilib repositories
        - If you want to run 32-bit applications on your x86_64 system
        ```conf
        [multilib]
        Include = /etc/pacman.d/mirrorlist
        ```

- Create folders
    - /etc/pacman.d : The primary pacman folder

- Generate mirrorlist
    - /etc/pacman.d/
        - mirrorlist.conf : The pacman repository mirror list
            - Mirror Lists
                + [All Mirrors](https://archlinux.org/mirrorlist/all)
                + [HTTP-only](https://archlinux.org/mirrorlist/all/http)
                + [HTTPS-only](https://archlinux.org/mirrorlist/all/https)

- Install ArchLinux keyring
    ```console
    sudo pacman -S archlinux-keyring
    ```

- Initialize pacman-keyring
    ```console
    sudo pacman-keyring --init
    ```

- Update and refresh pacman packages
    ```console
    sudo pacman -Syu
    ```

## Documentations

## Wiki
### Snippets and Examples
- [Default pacman.conf file](pacman.conf)

## Resources

## References
+ [ArchLinux GitLab - pacman/pacman - Pacman build instructions](https://gitlab.archlinux.org/pacman/pacman/-/tree/master/doc?ref_type=heads)
+ [ArchLinux GitLab - pacman/pacman - Meson build dependencies](https://gitlab.archlinux.org/pacman/pacman/-/blob/master/meson.build?ref_type=heads)
+ [ArchWiki - Install ArchLinux from an existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux#Using_pacman_from_the_host_system)

## Remarks

