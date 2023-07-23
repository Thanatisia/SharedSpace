# Linux - Remote Desktop Protocol (RDP) server

## Information
### Networking
+ Protocol: RDP
+ Port: 3389

## Basics
### Introduction
```
The Remote Desktop Protocol created by Microsoft to allow usage of a target computer's graphical environment on another device through the network. 
The Linux-equivalent of the RDP is VNC
```

## Setup
### Dependencies
- Install [xrdp](projects/xrdp/README.md)
    + This only supports Xvnc as the backend
    - To use xorg instead for the backend
        + Install [xorgxrdp](projects/xrdp/packages/xorgxrdp.md)

## Pre-Requisites
- (OPTIONAL) Enable firewall and allow INCOMING destination port 3389 
    ```console
    sudo iptables -I INPUT -p tcp --dport 3389 -j ACCEPT
    sudo iptables -I INPUT -p udp --dport 3389 -j ACCEPT
    ```

### Basic setup
- Setup ~/.xinitrc
    + This is basically the Xserver's session configuration file
    + By default, if this file or '/etc/X11/xinit/xinitrc' cannot be found, xrdp will read from '/etc/xrdp/startwm.sh'
- Start the xrdp service
    ```console
    sudo systemctl start xrdp
    ```

### Post-Installation
- Connect to the RDP device using your client
    + Enter server IP address
    + Enter server port number as '3389'
    + Enter session username
    + Enter session password
    + Connect and Authenticate

## Documentations
### RDP Clients
+ Microsoft Remote Desktop
+ Apache Guacamole
+ Remmina

## Wiki

## Resources

## References
+ [ArchWiki - xrdp](https://wiki.archlinux.org/title/xrdp)

## Remarks
