# VirtualBox Guest Additions

## Table of Contents
- [Setup](#setup)
- [Documentations](#documentations)
- [Wiki](#wiki)
- [Resources](#resources)
- [References](#references)
- [Remarks](#remarks)

## Setup

### Dependencies
+ gcc
+ make
+ perl
+ virtualbox

### Pre-Requisites
- Update and Upgrade Repository to latest version
	- If Package Manager
        - apt
            ```console
            sudo apt update && sudo apt upgrade
            ```
        - pacman
            ```console
            sudo pacman -Syu
            ```

- Install VirtualBox Guest Additions/Utilities
    - using Package Manager
        - apt (Debian-based)
            - virtualbox-guest-x11 : VirtualBox Guest utilities with X support
                ```console
                sudo apt install virtualbox-guest-x11
                ```
            - virtualbox-guest-utils : VirtualBox Guest utilities with No X (nox) support (i.e. headless)
                ```console
                sudo apt install virtualbox-guest-utils
                ```
        - pacman (Arch-based)
            - virtualbox-guest-utils : VirtualBox Guest utilities with X support
                ```console
                sudo pacman -S virtualbox-guest-utils
                ```
            - virtualbox-guest-utils-nox : VirtualBox Guest utilities with No X (nox) support
                ```console
                sudo pacman -S virtualbox-guest-utils-nox
                ```

    - using ISO
        - Install ISO package
            - using Package Manager
                + This should install the ISO into '/usr/share/virtualbox/VBoxGuestAdditions.iso'
                - apt (Debian-based)
                    ```console
                    sudo apt install virtualbox-guest-additions-iso
                    ```
                - pacman (Arch-based)
                    ```console
                    sudo pacman -S virtualbox-guest-iso
                    ```
        - Mount the Guest Additions ISO
            ```console
            mount /usr/share/virtualbox/VBoxGuestAdditions.iso /mnt
            ```
        - Change directory into mount point
            ```console
            cd /mnt
            ```
        - Run Linux VBox Guest Additions
            ```console
            sudo ./VBoxLinuxAdditions.run
            ```

- Add current user to virtualbox groups 
    - Explanation 
        + vboxsf : to have permission to traverse shared folder
        + vboxguest/vboxuser : VirtualBox user permissions
	```console
	sudo usermod -a -G {vboxsf | vboxguest | vboxuser} [your_username (Default: $USER)]
	```

- Restart your computer
	```console
	sudo reboot now
	```

### Load VirtualBox kernel modules
- Load automatically
    - Startup and run VirtualBox guest additions service
        ```console
        sudo systemctl start vboxservice.service
        ```

    - Enable service for automatic startup
        ```console
        sudo systemctl enable vboxservice.service
        ```

- Load manually
    - Using modprobe
        ```console
        modprobe -a vboxguest vboxsf video
        ```

### Uninstall Guest Additions
- Installed from ISO
    - Change directory into the Guest Additions folder in '/opt/<VirtualBoxAdditions-[version]>'
        ```console
        cd /opt/<VirtualBoxAdditions-[version]>
        ```
    - Uninstall
        ```console
        sudo ./Uninstall.sh
        ```

## Documentations

### Usage
#### Launch VirtualBox guest services
- Using VBoxClient
    - Explanation
        + VBoxClient will interact with your X window system
    - Shared Clipboard between the host system and the guest
        ```console
        VBoxClient --clipboard
        ```
    - Drag and drop between the host system and the guest
        ```console
        VBoxClient --draganddrop
        ```
    - Seamless window mode
        + Guest Display is automatically resized according to the side of the guest window
        ```console
        VBoxClient --seamless
        ```
    - Check VirtualBox host version
        ```console
        VBoxClient --checkhostversion
        ```
    - Virtual Machine SVGA setting
        ```console
        VBoxClient --vmsvga
        ```

#### Shared Folder Mount
- Pre-Requisites
    + User is added to the group 'vboxsf'
    - VirtualBox Shared Folder on host system is properly setup and mounted
        - Mounted using VirtualBox Machine Settings
            - VirtualBox
                - Settings
                    - Shared Folders
                         - Edit
                            - [FolderName] menu

- Manual Mount
    - In guest system
        - Explanation
            + Filesystem type: vboxsf (virtualbox shared folders)
            - Other Mount Options:
                + uid (User ID): 1000
                + gid (Group ID): 1000 (can be vboxsf)
        ```console
        mount -t vboxsf -o uid=1000,gid=1000 [shared-folder-name] [mount-point-on-guest-system]
        ```

- Automatic mounting
    - Pre-Requisites
        + Service 'vboxservice.service' is started
        - Enabled automount feature
            + This will mount the folder from the host system into the guest system in '/media/[shared-folder-name]'
            - in CLI/TTY
                ```console
                VboxManage --automount sharedfolder
                ```
    - Use symlinks to have a more convenient access location
        ```console
        ln -s /media/[shared-folder-name] [destination-directory]
        ```

- Mount at boot
    - Add into '/etc/fstab' (filesystems table)
        - Explanation
            + shared-folder-name : The name of the shared folder to mount
            + guest-mount-point-path : The path of the mount point to mount the shared folder in the guest system
            + Filesystem type: The type of the folder filesystem type; in this case, it is vboxsf
            - Folder Options
                + `uid=[user]` : The user ID to mount the folder as
                + `gid=[group]` : The group ID to mount the folder with
                + rw (Read-write) : File open mode
                + dmode=700 : Directory permission modifier (mode)
                + fmode=600 : File permission modifier (mode)
                + noauto : No automatic mount during startup
                + x-systemd.automount : Enable automount with systemd
        ```
        [shared-folder-name] [guest-mount-point-path] vboxsf uid=[user],gid=[group],rw,dmode=700,fmode=600,noauto,x-systemd.automount
        ```

## Wiki

## Resources

## References
+ [ArchWiki - Install ArchLinux as a guest](https://wiki.archlinux.org/title/VirtualBox/Install_Arch_Linux_as_a_guest)
+ [Debian Wiki - VirtualBox](https://wiki.debian.org/VirtualBox)

## Remarks

