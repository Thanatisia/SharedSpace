# Home Lab Services, Software and Tools - Proxmox

## Information
### Description
- Proxmox is a powerful Open Source Server Virtualization Platform, and a Type-1 Hypervisor that uses QEMU/KVM for Virtualization and LXC for containerization
    - Proxmox is Type-1 because it is an Operating System, hence there is no existing Operating System underneath Proxmox
        + and as such, it will be close to native/bare metal
+ Proxmox also contains a Web interface for admin and management access

## Setup
### Dependencies

### Pre-Requisites

### Installation
- Add the Proxmox Virtual Environment repository into the debian mirrorlists
    - Notes
        + For Multiarch support: append '[arch=amd64]' after 'deb'
    ```bash
    echo "deb http://download.proxmox.com/debian [debian-version-codename] pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
    ```

- Add the Proxmox Virtual Environment repository private key for authentication and authorisation of the apt package repository
    ```bash
    wget -O- "http://download.proxmox.com/debian/key.asc" | apt-key add -
    ```

- Update the repository list and upgrade packages and system
    ```bash
    apt update && apt upgrade
    ```

- Install the Proxmox Virtual Environment Packages
    - Package List
        + proxmox-ve
        + ssh
        + postfix
        + ksm-control-daemon
        + open-iscsi
        + systemd-sysv
    ```bash
    apt install proxmox-ve ssh postfix ksm-control-daemon open-iscsi systemd-sysv
    ```

### Access Admin Web Interface
- Enter your browser
    + Enter the URL 'http(s)://server-ip-address|domain:8006` to the address bar

## Documentations

### Components
- Virtual Machines (QEMU-KVM)
    - Settings
- Containerization Platforms (LXC)
    - Settings
        + Network

### Proxmox Filesystem Structure/Layout
- /etc : System miscellenous files
    - pve/ : Contains Proxmox Virtual Environment-based configuration files
        - lxc/ : Contains configuration files for LXC containers in Proxmox VE
            - [container-id].conf : Configuration file containing settings and configurations meant for this particular container

### Configurations and settings
- /etc/pve/lxc/[container-id].conf
    + `lxc.cgroup2.devices.allow: c 10:200 rwm` : Allow the use of this container's tunnel interface from the host
    + `lxc.mount.entry: /dev/net dev/net none bind,create=dir` : Enable the mounting of the network device from the host into this LXC container

### Snippets
- Create Network Bridge
    - Click on the Proxmox group
        - Enter 'Network'
            - Click 'Create' to create a new Network Adapter
                + Select 'Linux Bridge'
                + Leave it as default

- (Optionals) Create a Proxmox template
    - Explanation
        + `pct create [container-id] [rootfs-tarball-archive-file]` : Create a new Proxmox container template with the LXC container ID of 'container-id' holding the specified root filesystem tarball archive
        + container-id : Create a LXC container of this ID; This will be tracked by proxmox's pct
        + rootfs-tarball-archive-file : Attach the specified root filesystem tarball archive file to this container on creation
        + `--unprivileged 1` : Enable/Disable (1|0) unprivileged/privileged mode
        + `--ostype [managed|unmanaged]` : Specify whether you want the Operating System to be managed or unmanaged
        + `--hostname [server-hostname]` : Specify the network hostname for the server (i.e. openwrt)
        + `--net0 name=[eth0-network-name]` : Specify the Network Interface name for port 0 (i.e. eth0)
        + `--net1 name=[eth1-network-name]` : Specify the Network Interface name for port 1 (i.e. eth1)
        + `--storage [storage-controller-name]` : Specify the name of the storage controller to attach to this container (i.e. local-lvm)
    ```bash
    pct create [container-id] ./rootfs.tar.xz \
        --unprivileged 1 \
        --ostype unmanaged \
        --hostname openwrt \
        --net0 name=eth0 \
        --net1 name=eth1 \
        --storage local-lvm
    ```

- Configure Network Management to LXC container
    - Select your OpenWRT container
        - Click on 'Network' page
            - Edit Network Interface 'net0'
                + Change 'Bridge' to vmbr0
            - Edit Network Interface 'net1'
                + Change 'Bridge' to vmbr1
    - Enter shell
        - Edit the '/etc/pve/lxc/106.conf' configuration file
            - Notes
                - This is the configuration file for the LXC container
                    - specifically, the PVE directory '/etc/pve/lxc' contains the configuration files for LXC containers
                        + with the name being the LXC container ID
            ```bash
            $EDITOR /etc/pve/lxc/[container-id].conf
            ```
        - Append the following into the bottom of the configuration file
            - Explanation
                + `lxc.cgroup2.devices.allow: c 10:200 rwm` : Allow the use of this container's tunnel interface from the host
                + `lxc.mount.entry: /dev/net dev/net none bind,create=dir` : Enable the mounting of the network device from the host into this LXC container
            ```
            ...
            lxc.cgroup2.devices.allow: c 10:200 rwm
            lxc.mount.entry: /dev/net dev/net none bind,create=dir
            ```

## Resources

## References
+ [Proxmox PVE - Wiki - Install on an existing debian system from command line](https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_Jessie)

## Remarks

