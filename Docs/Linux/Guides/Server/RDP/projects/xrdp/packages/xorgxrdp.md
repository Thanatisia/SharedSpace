# xorgxrdp : RDP Server driver for XORG Display Server

## Information
### Background
```
xorgxrdp is a collection of modules to be used with a pre-existing X.Org install to make the X server act like X11rdp. 
Unlike X11rdp, you don't have to recompile the whole X Window System. 
    - Instead, additional modules are installed to a location where the existing Xorg installation would pick them.

xorgxrdp is to be used together with xrdp and X.Org Server. 
    - It is pretty useless using xorgxrdp alone.
```

### Basics
+ RDP : The Remote Desktop Protocol created by Microsoft to allow usage of a target computer's graphical environment on another device through the network. The Linux-equivalent of the RDP is VNC

### Project Information
+ Project Author: Neutrinolabs
+ Project Name: xorgxrdp
- Repositories
    + GitHub: https://github.com/neutrinolabs/xorgxrdp

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
- xrdp (and its dependencies)

### Pre-Requisites
- Clone repository
    - Entire
        ```console
        git clone https://github.com/neutrinolabs/xorgxrdp
        ```
    - Change directory into repository
        ```console
        cd xorgxrdp
        ```

### Pre-Configuration 
- Bootstrap source files
    ```console
    ./bootstrap
    ```

- Configure bootstrapped source
    - '/path/to/xrdp/common' is the path containing your installed xrdp binary if it was not installed into the common directory normally
        + if you used the manual installation and didnt change the installation path: use '/usr/local/sbin'
    ```console
    ./configure \
        XRDP_CFLAGS=-I/path/to/xrdp/common
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


