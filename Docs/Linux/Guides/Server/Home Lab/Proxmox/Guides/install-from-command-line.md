# Proxmox: Installing from an existing debian linux system via command line like in ArchLinux

## Information

## Setup
### Steps
0. [Host System Preparation](#host-system-preparation)
1. [Add the Proxmox VE repository](#add-the-proxmox-ve-repository)
2. [Add the Proxmox VE repository key](#add-the-proxmox-ve-repository-key)
3. [Install Proxmox VE packages](#install-proxmox-ve-packages)

### Dependencies
+ ssh
+ postfix
+ proxmox-ve
+ ksm-control-daemon
+ open-iscsi
+ systemd-sysv

### Pre-Requisites
#### Host System Preparation
+ Install Debian Linux

#### Add the Proxmox VE repository
```console
echo "deb http://download.proxmox.com/debian jessie pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
```
- NOTE: 
    - If you have enabled other arch (typically, i386 to run some older software) 
        - and apt-get complains about not being able to find /binary-i386: "Unable to find expected entry 'pve/binary-i386/Packages'" 
            + you need to remove other arch or use insted the row: `deb [arch=amd64] http://download.proxmox.com/debian jessie pve-no-subscription`
            - this is because Proxmox repository does not have other arch then amd64; 
                 + more info on multiarch on debian on: https://wiki.debian.org/Multiarch/HOWTO .
                 + If it does not work for apt-get of some files, then replace http:// with ftp:// especially in the first two urls above.

#### Add the Proxmox VE repository key
```console
wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -
```

#### Update your repository and system
- Update your repository
    ```console
    apt-get update
    ```

- Update your system
    ```console
    apt-get dist-upgrade
    ```

#### Install Proxmox VE packages
- Using package manager
    ```console
    apt(-get) install ssh postfix proxmox-ve ksm-control-daemon open-iscsi systemd-sysv
    ```

### Documentation
#### Post-Installation
- Connect to the admin web interface: `http(s)://[your-ip-address]:8006`
     - Create a bridge called 'vmbr0' (Virtual Machine Bridge Network Interface)
         + Add your first network interface to the ports/slaves of the bridge network interface

## Wiki

### Terminologies
+ VE: Virtual Environment

## Resources
+ [Proxmox VE - Install Proxmox VE from an existing Debian system](https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_Jessie)

## References

## Remarks