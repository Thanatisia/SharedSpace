# XRDP : RDP Server for XORG Display Server

## Information
### Background
```
xrdp is an Open Source RDP server that provides a graphical login to remote machines using Microsoft Remote Desktop Protocol
```

### Basics
+ RDP : The Remote Desktop Protocol created by Microsoft to allow usage of a target computer's graphical environment on another device through the network. The Linux-equivalent of the RDP is VNC

### Project Information
+ Project Author: Neutrinolabs
+ Project Name: xrdp
- Repositories
    + GitHub: https://github.com/neutrinolabs/xrdp

### Project filesystem structure
- Folders
    + /etc/xrdp/ : The XRDP general folder
    - /etc/X11/ : The X11 Xorg server directory
        - /etc/X11/xinit/ : The xorg-xinit directory
- Files
    - /etc/xrdp/
        + sesman.ini : This contains the parameters used to start Xorg and Xvnc display servers
        + startwm.sh : This is the default XRDP startup script; similar to '.xinitrc'; System will look for this file by default if '~/.xinitrc' is not found
        + xrdp.ini : This is the 'xrdp-sesman' session manager UI 
    - /etc/X11/xinit/
        + xinitrc : This is the default xinitrc template file

## Setup
### Dependencies
- To run
    - Display Server
        + xorg server
- Build/Compilation essentials for development
    + git
    - GNU packages
         - Using package manager
            - apt-based
                ```console
                sudo apt install build-essential
                ```
            - pacman-based
                ```console
                sudo pacman -S base-devel
                ```       
        - make
        - gcc
    + mk-configure 
    + autoconf 
    + automake 
    + pkg-config 
    + libtool 
    + nasm 
    + libxrandr 
    + fuse 
    + libfdk-aac 
    + ffmpeg 
    + imlib2

### Pre-Requisites
- Clone repository
    - Entire
        ```console
        git clone {--recursive} https://github.com/neutrinolabs/xrdp
        ```
    - Change directory into repository
        ```console
        cd xrdp
        ```

### Pre-Configuration 
- Bootstrap source files
    ```console
    ./bootstrap
    ```

- Configure bootstrapped source
    ```console
    ./configure
    ```

### Manually build/compile the source file
- Using Makefile
    ```console
    make
    ```

### Clean temporarily-created files
- Using Makefile
    ```console
    make clean
    ```

### Install binary and files to system
- Using Makefile
    ```console
    sudo make install
    ```

### Uninstall/remove binary and files from system
- Using Makefile
    ```console
    sudo make uninstall
    ```

## Post-Installation


## Documentations

## Wiki

### Services and System
- Services
    - xrdp : This is the RDP service; This handles the starting and stopping of RDP capabilities
        - Using init system
            - Systemd
                - To enable XRDP
                    ```console
                    sudo systemctl enable xrdp
                    ```
                - To disable XRDP
                    ```console
                    sudo systemctl disable xrdp
                    ```
                - To start XRDP
                    ```console
                    sudo systemctl start xrdp
                    ```
                - To stop XRDP
                    ```console
                    sudo systemctl stop xrdp
                    ```
            - Service (agnostic)
                - To enable XRDP
                    ```console
                    sudo service xrdp enable
                    ```
                - To disable XRDP
                    ```console
                    sudo service xrdp disable
                    ```
                - To start XRDP
                    ```console
                    sudo service xrdp start
                    ```
                - To stop XRDP
                    ```console
                    sudo service xrdp stop
                    ```

## Customization and Configuration

### Defaults
- Startup script: xrdp will look for and read from '~/.xinitrc' or '/etc/X11/xinit/xinitrc' if they exist 
    + xrdp will read from '/etc/xrdp/startwm.sh' by default if the files are not found

### Startup script configurations file
+ File location: ~/.xinitrc
- Structure/Contents
    ```bash
    # To add Xresources
    xrdb ~/.[Xresources-file]

    # To execute the session
    exec [session] &
    ```

### Networking
+ Port: 3389

## Resources

## References
+ [ArchWiki - XRDP](https://wiki.archlinux.org/title/xrdp)

## Remarks


