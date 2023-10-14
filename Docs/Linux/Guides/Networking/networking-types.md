# Linux - Networking: Types and Explanations

## Bridge
### Explanation 
- Network Bridge
```
                                                                                                             VLAN/Virtual Machine Network
                                                                                                          ---------------------------------
                                                                                                          |----> [Virtual Machine-1]      |
|------------------------|       --------------------------------       ---------------------------- -----|                               |
| Default Gateway Router | ----> | NIC (Host Network Interface) | ----> | Bridge Network Interface | ---->|----> [Virtual Machine-2]      |
|------------------------|   |   --------------------------------   |   ---------------------------- -----| ...                           |
                             |                                      |                                     |----> [Virtual Machine-N]      |
                             |                                      |                                     ---------------------------------
                         Provides                                Splits and 
                      IP Address to Host                       Attaches to a 
                                                      (Virtual) Bridge Network Interface
```

### Setup

### Create Network Bridge Interfaces
- Using brctl
    - Dependencies
       + bridge-utils
    - Pre-Requisites
       + 
    - Create Bridge Interface
        ```
        sudo brctl addbr [bridge-interface-name]
        ```
    - Show/Check Bridge
        ```console
        sudo brctl show
        ```
- Using iproute2
    - Create new bridge interface
        ```console
        sudo ip link add name [network-interface] type bridge
        ```

### Set Network IP Address to Bridge Interface
- Using iproute2
    - Add IPv4 Address
        ```console
        sudo ip address add [ip-address]/[subnet-prefix] dev [network-interface]
        ```
    - Check IP address
        ```console
        ip a s
        ```

### (Optional) Add bridge adapter specifications into '/etc/network/interfaces'
- Create '/etc/network/interfaces.d/bridges'
    ```
    sudo touch /etc/network/interfaces.d/bridges
    ```
- Add bridge specifications
    - DHCP 
        + Append a new DHCP specification for the bridge network interface
        ```
        auto [bridge-network-interface]
        iface [bridge-network-interface] inet dhcp
            bridge_ports [host-network-interface]
        ```
    - Static IP
        + Append a new static IP specification for the bridge network interface
        ```
        iface [bridge-network-interface] inet static
            address [ipv4-address]
            netmask [subnet-mask]
            gateway [default-gateway]
            dns-nameservers [dns servers]
            bridge_ports [master-network]
        ```

### Startup Network Interface(s)
- Notes
    + Ensure that your host NIC network interface and the bridge network interface states are up

- Using iproute2
    - Bring up Network Interface device
        ```console
        sudo ip link set dev [network-interface] up
        ```

    - Check IP address
        ```console
        ip a s
        ```

### Attach a NIC host network interface to a bridge as master locally
- Using iproute2
    - Notes
        + Doing this will effectively remove the interface from use, and as such, may disconnect any remote connection to your host system (i.e. SSH)
        + As such, please ensure that the network interfaces are created from system startup
    - Set master NIC host network interface to bridge
        ```console
        ip link set [NIC-host-network-interface] master [bridged-network-interface]
        ```

### To attach a NIC host network interface to a bridge as master remotely
- Using iproute2
    - Notes
        + You need to execute the commands in quick succession
        + Advisable to put them in a script file and execute the script
        + Or Append and chain them with ';' or '&&'
    - Attach NIC host network interface to the bridge network interface
        ```console
        ip link set [NIC-host-network-interface-name] master [bridge-network-interface-name]
        ```
    - Remove the IPv4 address from the NIC host network interface so that network connectivity will be retained
        ```console
        ip address del [NIC-host-IPv4-address]/[NIC-host-subnet-prefix] dev [NIC-host-network-interface-name]
        ```

### Verification
- Show existing bridges and associated interfaces
    - Using 'bridge'
        - Dependencies
            + bridge
        - Pre-Requisites
        - Display link
            ```console
            bridge link
            ```

### Uninstallation
#### Remove an interface from a bridge
- Using iproute2
    - Detach bridge from NIC host network interface
        ```console
        ip link set [NIC-host-network-interface] nomaster
        ```

#### Delete a bridge
- Using iproute2
    - Delete bridge virtual network interface
        ```console
        ip link delete [bridge-network-interface] type bridge
        ```

### Quickstart Flow

### Snippets
#### To add the main network interface to the bridge
- Note
    - Take note of the current network status
        - IP address of NIC host network interface
             - Using iproute2
                 ```console
                 ip address show [NIC-host-network-interface]
                 ```
        - IP route of NIC host network interface
             - Using iproute2
                 ```console
                 ip route show dev [NIC-host-network-interface]
                 ```

- Explanation
    + Once eth0 is added to the bridge, it won't be used for routing anymore. br0 will take its place, so it needs an IP and have the default route attached.
    + We cannot delete the IP address on eth0 before adding the interface to br0, otherwise network connectivity will be lost.
    + However, we need to quickly remove the ip address on eth0, otherwise network connectivity will be lost after a short period.
    + Linux does not allow two default routes on the same routing table. The easy workaround is just to append the new default route.
    + Once the IP address of eth0 is removed, the default route attached to it is automatically removed.

- Initial Setup for bridge
    - Using iproute2
        - Create new bridge
            ```console
            ip link add name [bridge-network-interface-name] type bridge
            ```
        - Set state of bridge to up
            ```console
            ip link set dev [bridge-network-interface-name] up
            ```
        - Set IP address of the bridge network interface to the IP address of the NIC host network interface
            ```console
            ip address add [NIC-host-ipv4-address]/[NIC-host-subnet-prefix] dev [bridge-network-interface-name]
            ```
        - Append new route to bridge network interface
            ```console
            ip route append default via [default-gateway] dev [bridge-network-interface-name]
            ```

- Attach the NIC host network interface to the bridge network interface and remove the IPv4 address from the NIC host network interface so that network connectivity will be retained
    - Using iproute2
        - Notes
            + You need to execute the commands in quick succession
            + Advisable to put them in a script file and execute the script
            + Or Append and chain them with ';' or '&&'
        - Attach NIC host network interface to the bridge network interface
            ```console
            ip link set [NIC-host-network-interface-name] master [bridge-network-interface-name]
            ```
        - Remove the IPv4 address from the NIC host network interface so that network connectivity will be retained
            ```console
            ip address del [NIC-host-IPv4-address]/[NIC-host-subnet-prefix] dev [NIC-host-network-interface-name]
            ```

## Wiki
### General Flow

## Resources

## References
+ [ArchWiki - Network Bridge - With iproute2](https://wiki.archlinux.org/title/Network_bridge#With_iproute2)

## Remarks 
