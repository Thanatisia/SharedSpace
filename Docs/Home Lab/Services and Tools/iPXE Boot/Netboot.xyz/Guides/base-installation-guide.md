PXE Boot Server - Netboot.xyz - Installation Guide
==================================================

## Information

### Project
+ Project Author: netbootxyz
+ Project Name: netboot.xyz
- Repositories
    - Source Repositories:
        + GitHub - Source: https://github.com/netbootxyz/netboot.xyz
        + GitHub - Docker: https://github.com/netbootxyz/docker-netbootxyz
    - Docker Image/Containers:
        + GitHub Container Repository: ghcr.io/netbootxyz/netbootxyz
        + DockerHub: https://hub.docker.com/r/netbootxyz/netbootxyz

## Setup

### Host System
> Dependencies

> Pre-Requisites

- Setting up booting via 
    - an ISO
        - Download the netboot.xyz.iso image from `https://boot.netboot.xyz/ipxe/netboot.xyz.iso`
            ```bash
            wget https://boot.netboot.xyz/ipxe/netboot.xyz.iso
            ```
    - a Disk Image for Live USB
        - Download the netboot.xyz.img image from `https://boot.netboot.xyz/ipxe/netboot.xyz.img`
            ```bash
            wget https://boot.netboot.xyz/ipxe/netboot.xyz.img
            ```
        - List disk labels and blocks and plan which disk you wish to install on
            ```bash
            lsblk
            ```
        - Write disk image into a drive
            - Using dd
                - Notes
                    - bs: The Block Size; The size of each individual block; Use alongside 'count' to calculate the total disk size written (bs * count)
                        + Example Value(s): 1{M|G}
                ```bash
                dd if=netboot.xyz.img of=[disk-label] bs=[block-size]
                ```

- (Optional) If you are running/booting from a containerization platform
    - Docker
        - Dependencies
            + docker
            + docker-compose
        - Pre-Requisites
            - Add user to 'dockeruser' group
                ```bash
                usermod -aG dockeruser [username]
                ```

            - Startup docker system service
                ```bash
                service docker start
                ```

            - Restart the system
                ```bash
                sudo reboot now
                ```

        - Using docker-run
            - Startup and run docker container
                ```bash
                docker run -itd \
                    --name=netbootxyz \
                    --restart unless-stopped \
                    -p 3000:3000                       `# sets web configuration interface port, destination should match ${WEB_APP_PORT} variable above.` \
                    -p 69:69/udp                       `# sets tftp port` \
                    -p 8080:80                         `# optional, destination should match ${NGINX_PORT} variable above.` \
                    -v /local/path/to/config:/config   `# optional` \
                    -v /local/path/to/assets:/assets   `# optional` \
                    ghcr.io/netbootxyz/netbootxyz
                ```

            - Remove a stopped container
                ```bash
                docker container rm [container-name]
                ```

            - Start a stopped container
                ```bash
                docker start [container-name]
                ```

            - Stop a running container
                ```bash
                docker stop [container-name]
                ```

            - Restart a running container
                ```bash
                docker restart [container-name]
                ```

            - View a container's logs
                ```bash
                docker logs [container-name]
                ```

            - Inspect a container/image
                ```bash
                docker inspect [container-name]
                ```

        - Using docker-compose
            - NOTE: 
                + Please prepare your docker-compose.yaml file before running
                + Refer to [Templates](#templates) for an example of the configuration file

            - Startup and run docker container(s)
                ```bash
                docker-compose {-f [docker-compose-file-name]} up -d
                ```

            - Stop, Teardown and remove container compose environment
                ```bash
                docker-compose down
                ```

            - Start a stopped container
                ```bash
                docker-compose start [container-name]
                ```

            - Stop a running container
                ```bash
                docker-compose stop [container-name]
                ```

            - Restart a running container
                ```bash
                docker-compose restart [container-name]
                ```

            - Execute a command in a container
                ```bash
                docker-compose [run|exec] [container-name] [command]
                ```

    - Accessing Service
        - Check if the service has started
            ```bash
            docker logs [container-name]
            ```
        - Once the container is started, 
            + the netboot.xyz web application can be accessed by the web configuration interface at http://localhost:3000 or via the specified port.
            + Downloaded web assets will be available at http://localhost:8080 or the specified port. If you have specified the assets volume, the assets will be available at http://localhost:8080.
            + If you wish to start over from scratch, you can remove the local configuration folders and upon restart of the container, it will load the default configurations.
        - If you are using OpenWRT
            + Port Forward internally netboot.xyz port 3000 to the external port 3000 from the router

- (Optional) If you are running/booting from a Virtual Machine Hypervisor
    - Proxmox (QEMU/KVM)
        - Setup
            + Please refer to [Proxmox README.md](/Docs/Home%20Lab/Services%20and%20Tools/Operating%20Systems/Proxmox/README.md)
        - Netboot.xyz Network Boot client
            - Create a new Virtual Machine
                - General
                    + Name: Set a name for the Virtual Machine
                    + VM ID: Set a virtual machine ID
                - OS
                    + Storage: Do not set any; You will boot from the network
                    + Guest OS Type: Does not matter
                    + Guest OS Version: Does not matter
                - System
                    - BIOS: Because we will be booting from the legacy BIOS, we want to make sure that we are using SeaBIOS
                        + If using UEFI: Use 'OVMF'
                - Network Configurations
                    + Bridge: Set this to a Network Bridge Interface (i.e. vmbr0)
                    + Model: Set VirtIO unless it is required (i.e. E1000 for Windows)
            - Start Virtual Machine
                - Pre-Requisites
                    - Ensure that the following are properly configured
                        - Change the Boot Order
                            + Set the Network Boot to the first interface method
    - VirtualBox
        - Dependencies
            + VirtualBox
        - Convert the '.img' file to '.vdi'
            - Explanation
                + This will create the 'openwrt.vdi' Virtual Disk Image file which is a Virtual Hard Drive for the Virtual Machine
            ```bash
            VBoxManage convertfromraw --format VDI netboot.xyz.img netboot.xyz.vdi
            ```
        - Create a new Virtual Machine
            + Name: Set a name for the Virtual Machine
            + Type: Choose 'Linux'
            + Version: Choose 'Linux 2.6/3.X/4.X (64-bit)'
            + RAM: Minimum 128MiB
            + Storage: Do not set any; You will boot from the network
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
                    + Storage: The 'netboot.xyz.vdi' Virtual Disk Image file is the 1st Primary Device (device position/index 0)

> Post-Installation Setup

- Configure the router
    - OpenWRT
        - Set DHCP server
            + Enable NTP Server
            + Enable Network Boot
            + Set the IP address/domain of the TFTP server

- Edit Boot configuration file
    - Access the netboot.xyz WebUI 
        + Enter '[server-ip|domain]:3000' in the Address Bar
    - Enter 'Menus'
        - Click on 'boot.cfg'
            + This is the boot configuration file
            - Edit the setting `set live_endpoint [custom-netboot.xyz-live-assets-repository-url]`
                - Explanation
                    - `set live_endpoint` : This setting basically specifies the location of the remote custom netboot.xyz live assets repository server
                        + By default, it is always pulling from github every time
                        + Change this to pull from the specified internal network live end point
                    + `custom-netboot.xyz-live-assets-repository-url` : This is the remote custom netboot.xyz live assets repository
                ```
                set live_endpoint http://[live-assets-server-ip|domain]:8080
                ```
            + Press 'Save Config'

- Start downloading the assets you want
    + Root file system
    + Disk Images

### Operational Workflow
- Notes
    + The following specifies ways of using Netboot.xyz

> To boot up on a host system via PXE Boot

- In the BIOS
    + Press 'Boot via PXE Server'

## Documentations

### Network
+ 3000   : sets web configuration interface port, destination should match the 'WEB_APP_PORT' environment variable
+ 69/udp : sets tftp port
+ 80     : NGINX server port for hosting assets; destination should match NGINX_PORT environment variable

### Project filesystem structure/layout and Volumes Storage
- /config : Place/Mount your netboot.xyz configuration files here
- /assets : Place/Mount your netboot.xyz assets here

### Environment Variables
+ MENU_VERSION=2.0.76 : Explicitly specify the netboot.xyz menu's version; Unset this to always grab the latest version
+ NGINX_PORT=80       : Explicitly specify the Nginx proxy server's port number
+ WEB_APP_PORT=3000   : Explicitly specify the Web application/UI's port number
+ SUBFOLDER=/         : Explicitly specify the subfolder path

### VirtualBox
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

### Templates

> docker-compose.yaml

```yaml
---
version: "3.7"
services:
  netbootxyz:
    image: lscr.io/linuxserver/netbootxyz:latest
    container_name: netbootxyz
    environment:
      - PUID=1000
      - PGID=1000
      - TZ=Etc/UTC
      # - MENU_VERSION=1.9.9 #optional
      - PORT_RANGE=30000:30010 #optional
      - SUBFOLDER=/ #optional
      - NGINX_PORT=80 #optional
      - WEB_APP_PORT=3000 #optional
    volumes:
      - /path/to/config:/config
      - /path/to/assets:/assets #optional
    ports:
      - 3000:3000
      - 69:69/udp
      - 8080:80 #optional
    restart: unless-stopped
```

### Terminologies
+ TFTP : Trivial File Transfer Protocol; a simple file transfer protocol which allows a client to get a file from or put a file onto a remote host; Default Port Number: 69

## Resources

## References
+ [Netboot.xyz Docs - Docker](netboot.xyz/docs/docker)
+ [Linuxserver - Docs - Images - Netboot.xyz Docker](https://docs.linuxserver.io/images/docker-netbootxyz/)
+ [YouTube - Novaspirit Tech - Ditching USB Boot for iPXE Boot with NetBoot.XYZ](https://www.youtube.com/watch?v=drw0O9LG5jQ)
+ [YouTube - Techno Tim - Meet netboot.xyz - Network Boot Any Operating System](https://www.youtube.com/watch?v=4btW5x_clpg)

## Remarks

