# Virtualization Hypervisor - KVM/QEMU : Setup

## Table of Contents
+ [Dependencies](#dependencies)
+ [Pre-Requisites](#pre-requisites)
+ [Installing](#installing)
- [Post-Installation Setup](#post-installation-setup)

## Dependencies
- qemu : QEMU package
    - If package manager is
        - apt
            ```console
            sudo apt(-get) install qemu
            ```
        - pacman
            ```console
            sudo pacman -S qemu
            ```        
- qemu-kvm : The QEMU KVM package
    - If package manager is
        - apt
            ```console
            sudo apt(-get) install qemu-kvm
            ```
        - pacman
            ```console
            sudo pacman -S qemu-kvm
            ```        
- ebtables : Ethernet Bridge
    - If package manager is 
        - apt
            ```console
            sudo apt(-get) install ebtables
            ```
	- pacman
            ```console
            sudo pacman -S ebtables
            ```
- libvirt-clients : Virtualization Library for clients
    - If package manager is
        - apt
            ```console
            sudo apt(-get) install libvirt-clients
            ```
        - pacman
            ```console
            sudo pacman -S libvirt-clients
            ```        
- virtinst : Virtualization/Virtual Machine Installer for QEMU/KVM
    - If package manager is
        - apt
            ```console
            sudo apt(-get) install virtinst
            ```
        - pacman
            ```console
            sudo pacman -S virtinst
            ```  
- bridge-utils : Network Bridging utilities
    - If package manager is
        - apt
            ```console
            sudo apt(-get) install bridge-utils
            ```
        - pacman
            ```console
            sudo pacman -S bridge-utils
            ```  

## Pre-Requisites
- Check if Linux system is compatible with kvm
    - Intended Output: 
    	+ Virtualiztion: {architecture}
    ```console
    LC_ALL=C lscpu | grep Virtualization
    ```

## Installing

## Post-Installation Setup
- Ensure service 'libvirtd' is running
    ```console
    systemctl status libvirtd
    ```
    - If not running : start service 'libvirtd'
        - Using systemctl
            ```console
            sudo systemctl start libvirtd
            ```
        - Using service
            ```console
            sudo service libvirtd start
            ```
- (OPTIONAL) Enable service 'libvirtd' to start from boot
    - Using systemctl
        ```console
        sudo systemctl enable libvirtd
        ```
    - Using service
        ```console
        sudo service libvirtd enable
        ```

- (OPTIONAL) add user to group [libvirtd]
    ```console
    sudo usermod -aG libvirtd [user]
    ```

## Wiki

## Resources

## References
+ [ostechnix - Setup headless virtualization server using KVM ubuntu](https://ostechnix.com/setup-headless-virtualization-server-using-kvm-ubuntu/)
+ [UNIX Cop - How to run a VM headless in QEMU/KVM](https://unixcop.com/how-to-run-a-vm-headless-in-qemu-kvm/)

## Remarks
