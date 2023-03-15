# Server must do after installation

```
Things to do after base installation of home lab/server before proceeding
```

## General TODO
1. Update system packages
    - Using apt-based
        ```console
        sudo apt update && sudo apt upgrade
        ```
    - Using Pacman
        ```console
        sudo pacman -Syu
        ```
2. Setup XDG User Direcrtories
    - Install package
        + Package Name: xdg-user-dirs
        - Using apt-based
            ```console
            sudo apt install xdg-user-dirs
            ```
        - Using Pacman
            ```console
            sudo pacman -S xdg-user-dirs
            ```
    - Update and Create home directory
        ```console
        xdg-user-dirs-update
        ```
3. Setup Swapfiles
    + This step is exceptionally important for low-power SOC like Raspberry Pi where memory is a constraint
    > The following steps are mirrored from my [Swapfile setup guide/documentation](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Linux/Guides/Setup/Swapfile.txt)
    - Allocate and create swapfile
        - Using fallocate
            ```console
            sudo fallocate -l [size] /swapfile
            ```
    - Change Permissions
        ```console
        sudo chmod 600 /swapfile
        ```
    - Format swapfile
        ```console
        sudo mkswap /swapfile
        ```
    - Turn on and Enable swapfile
        ```console
        sudo swapon /swapfile
        ```
    - Add swapfile entry to your filesystems table (/etc/fstab) to startup automatically
        ```console
        echo "# /swapfile" >> /etc/fstab
        echo "/swapfile none swap defaults 0 0" >> /etc/fstab
        ```
    - Verify swapfile is activated
        ```console
        free -h
        ```
4. Enable SSH
    - Install dependencies
        + openssh
    - Enable SSHD
        ```console
        service sshd enable
        ```
    - Start SSHD
        ```console
        service sshd start
        ```

## Server TODO
1. Set Static IP Address
    - Information
        - (Recommended) Ensure that you are using Ethernet. 
            + This is because setting static IP address using Ethernet has better reliability plus stability.
        - When setting the DNS server IP addresses, please seperate all ip addresses with a space (' ') delimiter
    - Steps
        - Edit Network Interfaces 
            - Synopsis/Syntax of Network Interface configuration
                ```
                auto [network-interface]
                iface [network-interface] 
                    address [ipv4-address]
                    netmask [subnet-mask]
                    gateway [default-gateway]
                    dns-nameservers [your-dns-server-IP-addresses ]
                ```
            - Add network definition in '/etc/network/interfaces'
                + This is the file NetworkManager will source
                ```console
                sudo $EDITOR /etc/network/interfaces
                ```
            - Add network definition in '/etc/network/interfaces.d'
                + This folder is one location where you define network interfaces as individual files
                ```console
                sudo $EDITOR /etc/network/interfaces.d/[your-network-interface-name]
                ```
        - Teardown Network Interface
            + If up
            ```console
            ifdown [network-interface]
            ```
        - Startup Network Interface
            + If down
            ```console
            ifup [network-interface]
            ```
        - Restart NetworkManager
            - Using service
                ```console
                service networking restart
                ```
            - Using systemd
                ```console
                systemctl restart NetworkManager
                ```
