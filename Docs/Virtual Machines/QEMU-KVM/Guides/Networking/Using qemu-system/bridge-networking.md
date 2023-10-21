# QEMU/KVM Networking - Bridge Network using qemu-system

## Setup
### Pre-Requisites
- Add your user to the group 'kvm'
    ```console
    sudo usermod -aG kvm [username]
    ```
- Create folder '/etc/qemu' if it does not exist yet
    - Create QEMU ACL white/blacklist file for network interfaces '/etc/qemu/bridge.conf'
        - Notes
            + Ownership and Permission of folder '/etc/qemu/' has to be 'root:kvm' and 0770
            + Ownership and Permission of folder '/etc/qemu/bridge.conf' has to be 'root:kvm' and 0640

## Documentations
### Notes
- The syntax used here are primarily focused on the Networking device/interfaces, including and especially bridges
    - However some important flags are as follows
        + -name [vm-name] : Specify the name of the Virtual Machine for processing; typically used by virsh (KVM) for tracking and identification
        + -daemonize : Run Virtual Machine as a background process (Daemon)
        + -cpu host  : Passthrough host's CPU
        + -enable-kvm : Enable and run Virtual Machine with KVM accelerator

## Creating Bridge Network Interface/Adapters for Virtual Machine Guests

### Steps
- Create network bridge interfaces in the host system
- Set Network IP Address to Bridge Interface
- Startup Network Interface
- Add bridge adapter specifications into '/etc/network/interfaces'
- Allow the newly-created bridge interface in the QEMU bridge ACL blocklist '/etc/qemu/bridge.conf'
- Attach a NIC host network interface to a bridge as master remotely
- Refresh Network Interfaces
- Startup QEMU/KVM with bridge network interface

#### Create Network Bridge Interfaces in the host system
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

#### Set Network IP Address to Bridge Interface
- Using iproute2
    - Add IPv4 Address
        ```console
        sudo ip address add [ip-address]/[subnet-prefix] dev [network-interface]
        ```
    - Check IP address
        ```console
        ip a s
        ```

#### (Optional) Add bridge adapter specifications into '/etc/network/interfaces' or '/etc/network/interfaces.d/[file-name]'
- Append a new DHCP specification for the bridge network interface
    ```
    auto [bridge-network-interface]
    iface [bridge-network-interface] inet dhcp
        bridge_ports [host-network-interface]
    ```

#### Startup Network Interface
- Using 'ip'
    ```console
    sudo ip link set dev [network-interface] up
    ```
- Check IP address
    ```console
    ip a s
    ```

#### Allow the newly-created bridge interface in the QEMU bridge ACL blocklist '/etc/qemu/bridge.conf'
- Syntax: 'allow [bridge-interface-name]'
- Examples
    ```
    allow virbr0
    allow br0
    ```

#### Attach a NIC host network interface to a bridge as master remotely
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

#### Refresh Network Interfaces
- Restart '/etc/init.d/networking'
    ```console
    sudo /etc/init.d/networking restart
    ```

#### Startup QEMU/KVM with bridge network interface
- Snippets and Examples
    - Bridged Network using 'br0'
        - Explanations
            + -name [vm-name]
            + -daemonize : Run Virtual Machine as a background process (Daemon)
            + -cpu host  : Passthrough host's CPU
            + -enable-kvm : Enable and run Virtual Machine with KVM accelerator
            - Networking
                + -net nic : Passthrough the Host's Network NIC to the guest temporarily
                + -netdev bridge,id=hn0,br=[bridge-network-interface] : Initialize and define Network Device for the Bridge Interface
                + -netdev user,id=[network-device-id-e1000],hostfwd=tcp::[host-system-port]-:[virtual-machine-port] : Define and Initialize a new Network Device for the user/host-level network infrastructure; Initialize the Network Device ID for reuse/labelling and port forwarding from the host system port to the virtual machine guest port (similar to docker's "-p | --publish" option)
                + -device e1000,netdev=[network-device-id-e1000] : Initialize a new device of type 'e1000' and attach the network device 'network-device-id-e1000' as created previously
        - Host System Usage
            - To utilize an application from a certain port
                + SSH (Port 22): `ssh [server-ip] -p [service-port-number]`
                + Web Server: `[protocol]://[server-ip]:[service-port-number]`
        ```console
        qemu-system-[architecture] -name [vm-name] -daemonize -cpu host -enable-kvm -net nic -netdev bridge,id=hn0,br=[bridge-network-interface] -netdev user,id=[network-device-id-e1000],hostfwd=tcp::[host-system-port]-:[virtual-machine-port] -device e1000,netdev=[network-device-id-e1000]
        ```

## Wiki
### TODO
+ Figure out how to set static IP address within the Virtual Machine Guest and access like VirtualBox's '--network' flag

## Resources

## References
+ [QEMU Wiki - Networking](https://wiki.qemu.org/Documentation/Networking)

## Remarks
