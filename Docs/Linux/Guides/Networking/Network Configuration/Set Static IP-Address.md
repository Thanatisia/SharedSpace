# Linux Networking - Set Static IP Addresses

## Information
### Basics
```
In Operating Systems, there are generally 2 ways of assigning IP Addresses from your router to your host system
    - Dynamic Assignment via DHCP
        - This is where your host system will be assigned an IP address dynamically through a DHCP server in your network.
		- This DHCP server is generally your default gateway and they will determine what IP to assign based on availability.
        - This is generally used by more of the consumer market/average user
    - Static IP Address
        - As the name might suggest, static IP address are IP addresses where you set it yourself
        - This is generally preferred when it comes to Server Management, especially if you plan to port forward because
            - while DHCP assignment migth change your IP address depending on the state and availability
                - Once you set a Static IP address, that address will no longer be available, regardless of state (Turned off/on)
```

### DESCRIPTION
```
This is a guide specifically for setting Static IP Addresses, please refer to the DHCP guide for setting DHCP Network IP Address (WIP)
```

### Files
```
Some files and folders used by linux for networking

NOTE:
- these may be different depending on Linux Distributions
```
### RHEL/CentOS/Fedora
+ /etc/sysconfig/network
+ /etc/sysconfig/network-scripts/ifcfg-[network-interface]

### Generic
> Basically all other mainstream base-distros such as Debian-based or Arch-based
- /etc/network/interfaces : This is the general/global Network Interfaces file, 
    + this will basically source/import all individual network interface configuration file located in '/etc/network/interfaces.d/'
    + However, you can also add all your interface configurations here
- /etc/network/interfaces.d : This contains the individual configuration files for your Network Interfaces
    + Each interface files contains the same syntax as the global configuration settings.
+ /etc/resolv.conf : This is the DNS Resolver Configuration file, effectively, it contains your DNS Resolver Routing Configurations

## Setup
### Pre-Requisites
- Ensure that the IP address you wish to use is not taken by another device in the network
    - Using an IP address octet that is currently being used will result in an IP address conflict.

### Dependencies

## Documentation

### Steps
- Network Interface Configuration
    > Add your Network Interface and the configurations into '/etc/network/interfaces'
    + Please refer to [Network Interface file (/etc/network/interfaces{.d/*} Configurations](#configurations) for more explanation.
    ```
    # /etc/network/interfaces
    auto [interface-name]
    iface [interface-name] inet static
        address 192.168.X.X
        netmask 255.255.255.0
        gateway 192.168.0.1
        dns-nameservers 4.4.4.4        
        dns-nameservers 8.8.8.8
    ```

- Update your DNS Resolver Configurations file ('/etc/resolv.conf')
    + Replace with the DNS Resolver Server's IP Address
    ```
    # /etc/resolv.conf
    nameserver 4.4.4.4
    nameserver 8.8.8.8
    ```

- Restart the networking on your system
    - Using systemd
        ```console
        sudo systemctl restart network
        ```
    - Using SysV
        ```console
        /etc/init.d/network restart
        ```

## Wiki

### Network Interface file (/etc/network/interfaces{.d/*})

#### Configurations
+ auto [interface-name] : The interface should be configured during boot time
- iface [interface-name] inet {static|dhcp} : Specify interface name and the type; inet = The interface uses TCP/IP networking
    + address [static-ip-address] : To specify your static IP address for this interface
    + netmask [subnet-mask-octet] : To specify your Subnet Mask Octet of the network (i.e. 255.X.X.X) depending on the prefix (i.e. /8, /24, /32)
    + gateway [default-gateway-IP-address] : To specify your Default Gateway IP Address
    + dns-nameservers [dns-server-IP-address] : To specify your DNS Resolver Server's IP Address; Can be repeated

#### Skeleton Template
```
    # /etc/network/interfaces
    auto [interface-name]
    iface [interface-name] inet static
        address 192.168.X.X
        netmask 255.255.255.0
        gateway 192.168.0.1
        dns-nameservers 4.4.4.4
        dns-nameservers 8.8.8.8
```

### To check your interfaces
- Using ifconfig
    ```console
    ifconfig
    ```

- Using ip
    > You may want to use this as it is the newer go-to
    ```console
    ip a s
    ```

### To check your currently defined network router
- Using ip
    > Labelled with 'default'
    ```console
    ip r | grep default
    ```

## Resources

## References
+ [Debian Wiki - NetworkConfiguration](https://wiki.debian.org/NetworkConfiguration)
+ [Tecmint - Set static IP address in Linux](https://www.tecmint.com/set-add-static-ip-address-in-linux/)
+ [Creating a Static IP With wlan0](https://serverfault.com/questions/335994/creating-a-static-ip-with-wlan0)

## Remarks