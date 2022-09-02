# PiHole - Setup Guide

## Information
+ PiHole Installation Script : https://install.pi-hole.net

## Setup
### Pre-Requisites
- Any Small Form Factor (SFF), Portable device (if using as intended - you can use any device though)
    - Note
        + Ensure that the device is running Linux and/or a derivative there-of
    - Examples
        + Raspberry Pi
        + OrangePi

- (OPTIONAL) If you are using Proxmox
    + Download the distribution's tar.zst file beforehand

- Create a new container
    - If using Proxmox
        - LXC Container
            > Note : These are just for example, it can be anything, customize it to your intended output
            - "General" Tab
                + Node : proxmox
                + CT ID : 103
                + Hostname : PiHole
                + Set Password
            - "Template" Tab
                + Set Template as the *.tar.zst* file you downloaded
            - "Data" Tab
                + Set storage amount
            - "CPU" Tab
                + 1 Core is fine
            - "Network" Tab
                + IPv4 : Enable DHCP
                + IPv6 : Enable DHCP
            + Finish
    - If using Docker
        ```console
        sudo docker -itd --name "PiHole" --port 8080:80 ubuntu
        ```

- Set Static IP Address
    + PiHole is designed to be a Server (Firewall/DNS Server/DNS Sinkhole)
    
### Dependencies
+ curl

### Preparation
- User Management
    - Create a new user
        - Debian-based Distributions
            ```console
            adduser -m -g sudo -d /home/[home-directory] [username]
            ```
        - Arch-based Distributions
            ```console
            useradd -m -g wheel -d /home/[home-directory] [username]
            ```
            
    - Change user's password
        ```console
        passwd [username]
        ```
    
    - Test User
        ```console
        su - [username]
        sudo whoami
        # should display [username]
        ```

- Update and Upgrade your system
    - Debian-based Distributions (apt)
        ```console
        sudo apt update && sudo apt upgrade
        ```
    - Arch-based Distributions (pacman)
        ```console
        sudo pacman -Syu
        ```
        
### Installation
- Curl PiHole Installation Script and Install it
    ```console
    sudo curl -sSL https://install.pi-hole.net | bash
    ```
    
    - (OPTIONAL) Select Upstream DNS Provider
        + Set a DNS Provider temporarily until you setup the PiHole to be the DNS Server itself

    - (OPTIONAL) Blocklists
        + Choose to use : StevenBlack's Unified Hosts List (Recommended)
        
    - (OPTIONAL) If you want to install dependencies for the Admin Web Interface (Recommended)
        + The Web Interface is so that you can access PiHole via a Web Interface (aka manage via Web Browser)
        - Requirements
            - If you disable this, and do not have an existing web server and required PHP modules installed
                + The web interface will not function
            - The Web Server user needs to be member of the "pihole" group for full functionality
        - Dependencies
            + lighttpd
            - PHP modules
                + sqlite3
                + xml
                + intl
                + json
        - Manual Setup (If you do not want to enable this)
            - Install dependencies
                - Using package manager
                    - Debian-based Distributions (apt)
                        ```console
                        sudo apt install sqlite3 xml intl json lighttpd
                        ```
                    - Arch-based Distributions (pacman)
                        ```console
                        sudo pacman -S sqlite3 xml intl json lighttpd
                        ```
                        
            - Add user to Web server user to "pihole" group
                ```console
                usermod -aG "pihole" [username]
                ```
    
    - (OPTIONAL) If you like to enable query logging
        - Default
            + Can just select "No"
        - If selected Yes
            - Options
                0. Show Everything (Recommended)
                1. Hide Domains
                2. Hide Domains and Clients
                3. Anonymous Mode
    
    - Finishing Installation Process
        - System will provide a temporary password and IP address to connect to
            + Change the temporary password to your own password
        - Change PiHole Password
            ```console
            pihole -a -p [new-password-set]
            ```
    - Test your Web Interface
        - Open your web browser
        - Enter the IP Address provided during installation
            + You should now see the IP Address
  
    + Now you should have full administrative access
  
- (OPTIONAL) Installing DNS Server - Unbound Pi-hole DNS Solution
    + Pihole uses the 'Unbound' All-Around DNS Server Solution to make it into a *Recursive* DNS Server
        + For more information, please refer to [Unbound - DNS Server Setup](Unbound/dns-server-setup.md) for more information

- If you do not need/want to set a recursive DNS server
    - You just want the DNS Sinkhole (Ad-blocking) functionality
        + You can proceed to [Setting Pi-hole as DNS](#setting-pi-hole-as-dns)

## Documentations
### Setting Pi-hole as DNS
- Do any of the following
    + Set the DNS in your router as the Pi-hole (Network-wide)
    - Set the DNS in your computer as the Pi-hole (Individual)
        > These are General Steps for the time being
        - Go into your Wi-Fi settings (or Mobile Data if you are using Mobile)
            - Enter "IPv4"
                - Under DNS
                    + Set the IP address to your pi-hole DNS server
                    + Apply

## Frequently-Asked-Questions (FAQ)
### If you need to temporarily disable Ad-blocker
- Go into Pi-hole Administrative Web Interface
    - Under "Disable"
        + Select the amount of time to disable
                   
## Wiki

## Resources
+ [Pi-Hole Documentations- DNS Server Solution - Unbound](https://docs.pi-hole.net/guides/dns/unbound/)

## References
+ [YouTube | TechHut | The Pi-Hole install EVERYONE needs!](https://www.youtube.com/watch?v=xtMFcVx3cHU)
+ [ArchWiki - Unbound General Installation Documentations](https://wiki.archlinux.org/title/unbound)
 
## Remarks

