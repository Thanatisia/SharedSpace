OpenWRT - Installation Guide
============================

*Setup*
-------
> Dependencies

> Pre-Requisites

- Download the OpenWRT image from `https://downloads.openwrt.org/releases/<version-number>/targets/<platform>/<architecture>/`
    - Notes
        + Please refer to the site for a full complete list of all files, architectures, platforms and targets
    - Explanation
        + version-number: Specify the target OpenWRT you want to download
        - platform: Specify the target platform variant of your hardware
            - Platforms
                + armsr : ARM-based CPU chip variants; i.e. ARMv7, ARMv8
                + x86: The generally-used AMD/Intel chip variants; i.e. x86, x86_64 (aka 64)
        - architecture: Specify the CPU architecture of the chip
            - Architectures
                - armsr
                    + ARMv7
                    + ARMv8
                - x86
                    + 64 : 64-bit CPU
                    + generic : 32-bit CPU
    - OpenWRT image types
        - MSDOS/BIOS/MBR Motherboard Bootloader Firmware
            + generic-squashfs-combined.img.gz : This disk image uses the traditional OpenWrt layout, a squashfs read-only root filesystem and a read-write partition where settings and packages you install are stored. Due to how this image is assembled, you will have only 230-ish MB of space to store additional packages and configuration, and Extroot does not work.
            + generic-ext4-combined.img.gz     : This disk image uses a single read-write ext4 partition with no read-only squashfs root filesystem, which allows to enlarge the partition. Features like Failsafe Mode or Factory Reset won't be available as they need a read-only squashfs partition to function.
        - UEFI Motherboard Bootloader Firmware
            + generic-squashfs-combined-efi.img.gz : This disk image uses the traditional OpenWrt layout, a squashfs read-only root filesystem and a read-write partition where settings and packages you install are stored. Due to how this image is assembled, you will have only 230-ish MB of space to store additional packages and configuration, and Extroot does not work.
            + generic-ext4-combined-efi.img.gz     : This disk image uses a single read-write ext4 partition with no read-only squashfs root filesystem, which allows to enlarge the partition. Features like Failsafe Mode or Factory Reset won't be available as they need a read-only squashfs partition to function.
    ```bash
    wget https://downloads.openwrt.org/releases/<version-number>/targets/<platform>/<architecture>/openwrt-[version]-[platform]-[architecture]-[file-name]
    ```

- Untar and Extract the tarball image archive
    - Using tar
        ```bash
        tar -xvzf openwrt-[version]-[platform]-[architecture]-generic-{squashfs|ext4}-combined{-efi}.img.gz
        ```
    - Using gunzip
        ```bash
        gunzip openwrt-*.img.gz
        ```

- (Optional) Using the rootfs directly
    - Downlad the rootfs tarball archive
        - Information
            - Parameters
                - Architecture : The target CPU architecture
                    - Supported Architectures
                        + amd64 : 64-bit Intel/AMD CPU
                        + arm64 : 64-bit ARM CPU
        ```bash
        wget https://sgp1lxdmirror01.do.letsbuildthe.cloud/images/openwrt/[version]/[architecture]/default/[build-date]/rootfs.tar.xz
        ```

    - Untar and extract the tarball archive
        ```bash
        tar -xvJf rootfs.tar.xz
        ```

    - (Optional) Create an empty raw disk image file
        - Notes
            + This will create a (10 * 1G) == 10G file
            + Do this if you wish to use a raw disk image file of another size
        - Explanation
            - bs: The Block Size; The size of each individual block; Use alongside 'count' to calculate the total disk size written (bs * count)
                + Example Value(s): 1{M|G}
            + count: The number of blocks to create; Use alongside 'bs' to calculate the total disk size written (bs * count)
        ```bash
        dd if=/dev/zero of=disk.img bs=1G count=10
        ```

    - Disk Filesystem Management
        - Format raw disk image filesystem label
            ```bash
            parted disk.img mklabel [msdos|gpt]
            ```
        - Create new partitions
            ```bash
            parted disk.img mkpart [partition-type|partition-label] [filesystem-type] [start-size] [end-size]
            ```

    - Mount Disk Image as loop devices
        - Setup loopback devices
            ```bash
            losetup -Pf [disk-image-file]
            ```
        - Mount disk image Loop devices
            ```bash
            mount -o loop disk.img
            ```

    - Partition Management
        - Format partition filesystem type
            - ext4
                ```bash
                mkfs.ext4 /dev/loop[loopback-device-number]p[partition-number]
                ```
            - fat{8|16|32}
                ```bash
                mkfs.fat -f {8|16|32} /dev/loop[loopback-device-number]p[partition-number]
                ```
        - Optionals
            - Set partition as bootable
                - MBR/MSDOS (BIOS)
                    ```bash
                    parted set [boot-partition-number] boot on
                    ```
                - EFI (UEFI)
                    ```bash
                    parted set [boot-partition-number] esp on
                    ```

    - (Optionals) Create additional nested mount points
        - Boot Partition
            ```
            mkdir -pv [mount-point]/boot
            ```
        - Home Partition
            ```
            mkdir -pv [mount-point]/home
            ```

    - Mount disk image partitions to mount point
        - Mount loopback device partitions
            - Examples
                + Root Partition: `mount /dev/loop[loopback-device-number]p2 [mount-point]/`
                + Boot Partition: `mount /dev/loop[loopback-device-number]p1 [mount-point]/boot`
                + Home Partition: `mount /dev/loop[loopback-device-number]p3 [mount-point]/home`
            ```bash
            mount /dev/loop[loopback-device-number]p[partition-number] [mount-point]
            ```

    - Untar and extract root filesystem image contents into mount point
        - Explanation
            + x : Extract files
            + v : Verbose output (i.e. show progress on screen)
            + z : Extract/Compress using the gzip compression algorithm
            + f : Specify the tar archive filename
            + -C | --directory : Specify a custom output directory to extract the files to
        ```bash
        tar -xvzf rootfs.tar.xz -C [mount-point]
        ```

> Installation

- Linux
    - List disk labels and blocks and plan which disk you wish to install into
        ```bash
        lsblk
        ```
    - Write disk image into a drive
        - Using dd
            - Notes
                - bs: The Block Size; The size of each individual block; Use alongside 'count' to calculate the total disk size written (bs * count)
                    + Example Value(s): 1{M|G}
            ```bash
            dd if=openwrt-[version]-[platform]-[architecture]-generic-{squashfs|ext4}-combined{-efi}.img of=[disk-label] bs=[block-size]
            ```

- (Optional) If you are running/booting from a containerization platform
    - LXC (Linux Container)
        - Dependencies
            + lxc
        - Pre-Requisites
            - Create Network Bridge
                - Using Proxmox
                    - Click on the Proxmox group
                        - Enter 'Network'
                            - Click 'Create' to create a new Network Adapter
                                + Select 'Linux Bridge'
                                + Leave it as default
                - command line
                    - Explanation
                        + vmbr0 : This is the Bridge Network Interface you want to create
                    ```bash
                    sudo brctl addbr vmbr0
                    ```
            - Prepare and mount the raw disk image to extract the rootfs tarball archive contents into
                + Please refer to the above header block `(Optional) Using the rootfs directly` for the full steps
            - Downlad the rootfs tarball archive
                - Information
                    - Parameters
                        - Architecture : The target CPU architecture
                            - Supported Architectures
                                + amd64 : 64-bit Intel/AMD CPU
                                + arm64 : 64-bit ARM CPU
                ```bash
                wget https://sgp1lxdmirror01.do.letsbuildthe.cloud/images/openwrt/[version]/[architecture]/default/[build-date]/rootfs.tar.xz
                ```
            - Untar and extract the tarball archive
                ```bash
                tar -xvJf rootfs.tar.xz -C [mount-point]
                ```
            - (Optional) Using Proxmox
                - Create a Proxmox template
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
        - Configure container
            - Network Configurations
                - Goals
                    + Edit Network Interface 'net0' to 'vmbr0' (Bridged Network)
                    + Edit Network Interface 'net1' to 'vmbr1' (Bridged Network)
                - From command line
                    - Add the Host Network Interfaces we want to bridge to the Bridged Network Interface
                        - net0
                            ```bash
                            brctl addif vmbr0 net0
                            ```
                        - net1
                            ```bash
                            brctl addif vmbr1 net1
                            ```
                    - Bring up the Bridge Network Interface and the Physical Interfaces
                        ```bash
                        sudo ifconfig vmbr0 up
                        sudo ifconfig vmbr1 up
                        sudo ifconfig net0 up
                        sudo ifconfig net1 up
                        ```
                - On Proxmox
                    - Select your OpenWRT container
                        - Click on 'Network' page
                            - Edit Network Interface 'net0'
                                + Change 'Bridge' to vmbr0
                            - Edit Network Interface 'net1'
                                + Change 'Bridge' to vmbr1
                    - Enter shell
                        - Edit the '/etc/pve/lxc/106.conf' configuration file
                            - Notes
                                - This is the configuration file for the OpenWRT container
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
        - Start container
            ```bash
            lxc-start -n [container-id]
            ```

- (Optional) If you are running/booting from a Virtual Machine Hypervisor
    - VirtualBox
        - Dependencies
            + VirtualBox
        - Possible Errors
            - VBoxManage: error: Cannot create the disk image "openwrt.vdi": VERR_VD_INVALID_SIZE
                - Solution
                    - Pad the image 
                        - with dd
                            ```bash
                            dd if=openwrt-[image-file].img of=openwrt.img bs=128000 conv=sync
                            ```
                        - with `VBoxManage modifymedium`
                            - Explanation
                                + This will enlarge the image to a useful size (size is in MB)
                            ```bash
                            VBoxManage modifymedium openwrt.vdi --resize 128
                            ```
                    + Use the padded image as input to VBoxManage convertfromraw
        - Convert the '.img' file to '.vdi'
            - Explanation
                + This will create the 'openwrt.vdi' Virtual Disk Image file which is a Virtual Hard Drive for the Virtual Machine
            ```bash
            VBoxManage convertfromraw --format VDI openwrt-*.img openwrt.vdi
            ```
        - Create a new Virtual Machine
            + Name: Set a name for the Virtual Machine
            + Type: Choose 'Linux'
            + Version: Choose 'Linux 2.6/3.X/4.X (64-bit)'
            + RAM: Minimum 128MiB
            - Storage:
                + Choose `Use an existing Hard Disk File`
                + Add and choose the 'openwrt.vdi' Virtual Disk Image file
        - Configure Virtual Machine
            - Network Configurations
                - Adapter 1:
                    + Enable Network Adapter
                    + Attached to: Host-only Adapter
                    + Name: The Adapter name (i.e. vboxnet0, VirtualBox Host-Only Ethernet Adapter)
                    - Advanced
                        + Adapter Type: Intel PRO/1000 MT Desktop
                        + Promiscuous Mode: Deny
                - Adapter 2:
                    + Enable Network Adapter
                    + Attached to: NAT
                    - Advanced
                        + Adapter Type: Intel PRO/1000 MT Desktop
                - Adapter 3:
                    + Enable Network Adapter
                    + Attached to: Bridged Adapter
                    + Name: The name of the Network Interface Card (NIC) (Ethernet/WiFi) that is connected to the local network
                    - Advanced
                        + Adapter Type: Intel PRO/1000 MT Desktop
                        + Promiscuous Mode: Deny
        - Start Virtual Machine
            - Pre-Requisites
                - Ensure that the following are properly configured
                    + Storage: The 'openwrt.vdi' Virtual Disk Image file is the 1st Primary Device (device position/index 0)
            + Press 'Enter' after about 4 seconds to activate the console when the boot messages have finshed scrolling
            - Display the current Network Configurations
                ```bash
                uci show network
                ```

> Post-Installation Setup

- Set root password
    ```bash
    passwd
    ```

- Edit the Network Configuration to allow SSH access
    - Set the Network LAN IP Address for the server
        ```bash
        uci set network.lan.ipaddr='192.168.56.2'
        ```
    - Commit all changes made to the UCI (similar to database cursor-pointers and git commit)
        - Explanation
            + This is a failsafe to ensure that you have confirmed that you wish to push the changes to the boot configurations from the runtime
        ```bash
        uci commit
        ```
    - Reboot the machine to apply the changes
        - You should now be able to SSH into the machine from any devices in the LAN
            - Default credentials
                ```bash
                ssh root@192.168.56.2
                ```
        ```bash
        reboot
        ```

- Perform Network Management using uci batch
    - >= 23.05
        ```bash
    uci batch <<EOF
set network.mng=interface
set network.mng.device='br-lan'
set network.mng.proto='static'
set network.mng.ipaddr='192.168.56.2'
set network.mng.netmask='255.255.255.0'
set firewall.@zone[0].network='mng'
set firewall.@zone[0].name='mng'
delete network.lan
delete network.wan6
set network.wan=interface
set network.wan.device='eth1'
set network.wan.proto='dhcp'
EOF
        ```
    - <= 22.03
        ```bash
    uci batch <<EOF 
set network.mng=interface 
set network.mng.type='bridge' 
set network.mng.proto='static'
set network.mng.netmask='255.255.255.0'
set network.mng.ifname='eth0'
set network.mng.ipaddr='192.168.56.2'
delete network.lan
delete network.wan6
set network.wan=interface
set network.wan.ifname='eth1'
set network.wan.proto='dhcp'
EOF
        ```

    - Check if the setting configuration was loaded correctly
        - Valid Values
            - If you see the following on 22.03 and earlier (the network.mng entries MUST be the same as the ones shown here, the network.wan might be slightly different), everything went well
                ```
                network.mng='interface'
                network.mng.type='bridge'
                network.mng.proto='static'
                network.mng.netmask='255.255.255.0'
                network.mng.ifname='eth0'
                network.mng.ipaddr='192.168.56.2'
                -network.lan
                -network.wan6
                network.wan='interface'
                ```
            - For 23.03 and later, you should see
                ```
                firewall.cfg02dc81.network='mng'
                firewall.cfg02dc81.name='mng'
                network.mng='interface'
                network.mng.device='br-lan'
                network.mng.proto='static'
                network.mng.ipaddr='192.168.56.2'
                network.mng.netmask='255.255.255.0'
                -network.lan
                -network.wan6
                ```
        ```bash
        uci changes
        ```
        - If setting was loaded correctly
            - Save and commit configurations to boot time
                ```bash
                uci commit
                ```
            - Reboot the machine to apply the changes
                - You should now have both internet access (try a opkg update) AND a management interface with a static address you can connect your SSH client program to even if your PC is disconnected from a local network.
                    - To access the management interface (WebUI)
                        - Enter the OpenWRT's WebUI URL `http(s)://<server-ip-address|domain>` into the address bar
                            ```
                            http(s)://192.168.56.2
                            ```
                ```bash
                reboot
                ```
        - If setting was not loaded correctly
            - Reboot the machine to erase the temporary changes and restart the above steps
                ```bash
                reboot
                ```

- (Optional) Set DHCP to Bridged Network Interface
    - For <= 22.03
        - Set Network LAN interface, Network interface name and Network Protocol using uci batch
            ```bash
        uci batch <<EOF 
set network.lan=interface
set network.lan.ifname='eth2'
set network.lan.proto='dhcp'
EOF
            ```
        - Commit all changes made
            ```bash
            uci commit
            ```

    - For >= 23.05
        - Set Network LAN interface, Network interface name and Network Protocol using uci batch
            ```bash
        uci batch <<EOF 
set network.lan=interface
set network.lan.device='eth2'
set network.lan.proto='dhcp'
EOF
uci commit
service network restart
            ```
        - Commit all changes made
            ```bash
            uci commit
            ```
        - Restart Network Manager service
            ```bash
            service network restart
            ```

- Install packages as normal
    - Using 'opkg'
        - Basics
            - Update the Package Manager repositories database
                ```bash
                opkg update
                ```
            - Install packages
                ```bash
                opkg install [package-names ...]
                ```
        - Recommended Packages
            + luci : The WebUI Management Interface

## Documentations

- Run with VirtualBox automatically on Start of Windows OS
    - Import the following entry to your registry or add it manually:
        1. [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run]
        2. “VB-MYDEVICE”=“\”C:\\Program Files\\Oracle\\VirtualBox\\VBoxManage.exe\“ startvm \”NAMEOFVBINSTANCE\“ --type headless”
    - Alternatively create 2 shortcuts and use the Windows Task scheduler
        1. “C:\Program Files\Oracle\VirtualBox\VBoxManage.exe” startvm MYDEVICE --type headless
            + Create a task in the Scheduler triggered by logon of any user as action the shortcut
        2. “C:\Program Files\Oracle\VirtualBox\VBoxManage.exe” controlvm MYDEVICE acpipowerbutton
            - Create a task in the Scheduler triggered by an event and as action the shortcut
                + Begin the task: On an event
                + Basic Log: System
                + Source: User32
                + Event ID: 1074

## Wiki

## Resources

## References
+ [Baeldung - Linux - Bridging Network Interfaces](https://www.baeldung.com/linux/bridging-network-interfaces)
+ [OpenWRT - Documentations - User Guide - Installation - x86](https://openwrt.org/docs/guide-user/installation/openwrt_x86)
+ [OpenWRT - Documentations - User Guide - Virtualization - VirtualBox](https://openwrt.org/docs/guide-user/virtualization/virtualbox-vm)
+ [OpenWRT - Downloads - Releases - 23.05.3 - x86 - Generic](https://downloads.openwrt.org/releases/23.05.3/targets/x86/generic/)
+ [Linuxcontainers (LXC) Images (Previously images.linuxcontainers.org](https://sgp1lxdmirror01.do.letsbuildthe.cloud/images/)
+ [YouTube - Novaspirit Tech - Must-Have OpenWrt Router Setup For Your Proxmox](https://www.youtube.com/watch?v=3mPbrunpjpk)

## Remarks

