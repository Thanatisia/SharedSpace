# Home Lab/Server - Essential things to do after installation

```
Things to do after base installation of home lab/server before proceeding
```
## Setup
### General
- Update system packages
    - Using apt
        ```console
        sudo apt update && sudo apt upgrade
        ```
    - Using pacman
        ```console
        sudo pacman -Syu
        ```

- Install essential packages
    + vim
    + xdg-user-dirs : For XDG directories

- (Optional) Setup XDG User Directories
    + Update and Create home directory
    ```console
    xdg-user-dirs-update
    ```

- Set Static IP address
    - Information
        - (Recommended) Ensure that you are using Ethernet. 
            + This is because setting static IP address using Ethernet has better reliability plus stability.
        - When setting the DNS server IP addresses, please seperate all ip addresses with a space (' ') delimiter
    - Steps
        - Edit Network Interfaces 
            - Synopsis/Syntax of Network Interface configuration
                ```
                # Network Interfaces for Ethernet Interface [interface-name]
                auto [interface]
                iface [interface] inet static
                    address [ipv4-address]
                    netmask [subnet-mask (i.e. /24 = 255.255.255.0)]
                    gateway 192.168.1.254
                    nameservers 8.8.8.8 8.8.4.4
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
        - If using NetworkManager
            - (Optional) Restart NetworkManager
                - Using service
                    ```console
                    service networking restart
                    ```
                - Using systemd
                    ```console
                    systemctl restart NetworkManager
                    ```

- (Optional) Create swapfile
    - This step is exceptionally important for low-power SOC like Raspberry Pi where memory is a constraint
        + Unnecessary if you have sufficient RAM
        + The following steps are mirrored from my [Swapfile setup guide/documentation](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Linux/Guides/Setup/Swapfile.txt)
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

- Setup configurations and dotfiles
    - Examples
        + neovim
        + tmux

- User Management

- (Optional) Enable SSH
    - Notes
        + If you are currently working on this with a monitor
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

### For Raspberry Pi
- Open 'rpi-config'
    - Set timezone
    - Set hostname (OPTIONAL) - rpi4b-network

### Servers
- Setup Docker
    - Install packages
        + docker
        + docker-compose
    - Add user to group 'docker'
        ```console
        sudo usermod -aG docker [user-name]
        ```
    - Restart system
        ```console
        sudo reboot now
        ```

## Resources

## References

## Remarks


