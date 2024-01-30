# Requiring ArchLinux activities within a non-ArchLinux system

## Create a chroot environment with pacman/for ArchLinux
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

- Using docker
    - Pull latest archlinux image
        ```console
        docker pull archlinux:latest
        ```
    - Startup a container
        - Using docker run
            - Explanation
                - Startup an ArchLinux docker container with the name 'arch-chroot'
                    - Optionals
                        - Adding/Passthrough the disk/devices to container
                            - Examples
                                - SATA/AHCI
                                    ```console
                                    --device=/dev/sdX
                                    ```
                                - NVME
                                    ```console
                                    --device=/dev/nvme[device-number]
                                    ```
                                - Loopback Device
                                    ```console
                                    --device=/dev/loop[device-number]
                                    ```
                            ```console
                            --device=[disk-label]
                            ```
                        - Mount the following volumes from the host system to the container
                            - [host-system-source-volume] => [container-destination-volume]
                - Parameters
            ```console
            docker run -itd --name=arch-chroot {other-options} archlinux:latest
            ```
    - Chroot (Change root) into the container
        ```console
        docker exec -it [container-name] [shell]
        ```

## Wiki

## Resources

## References
+ [ArchWiki - Install ArchLinux from an existing Linux](https://wiki.archlinux.org/title/Install_Arch_Linux_from_existing_Linux#Using_pacman_from_the_host_system)
+ [RxOS - ReadTheDocs - Development - Creating a chrooted build environment under ArchLinux](https://rxos.readthedocs.io/en/develop/appendices/chroot_environment.html)

## Remarks
