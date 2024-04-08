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
+ [OpenWRT - Documentations - User Guide - Installation - x86](https://openwrt.org/docs/guide-user/installation/openwrt_x86)
+ [OpenWRT - Documentations - User Guide - Virtualization - VirtualBox](https://openwrt.org/docs/guide-user/virtualization/virtualbox-vm)
+ [OpenWRT - Downloads - Releases - 23.05.3 - x86 - Generic](https://downloads.openwrt.org/releases/23.05.3/targets/x86/generic/)

## Remarks
