# QEMU/KVM Networking - using qemu-system

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

### Synopsis/Syntax
```console
qemu-system-[architecture] {general-options} {networking-options}
```

### Networking Options
- -net [type] : To initialize a new network of the specified type and assign/attach a Network Interface to the Network
    - Types
        - bridge : To initialize a bridge network and attach a bridge network interface to it
            - Options
                + br=[bridge-network-interface] : To specify the bridge network interface to attach to the bridge network
        + nic : To attach the host's Network Interface Card (NIC)
        - user : To initialize a user network related to the user in the host system (username@hostname); This is generally focused at the host system networking (i.e. firewall) instead of device and infrastructure
            - Options
                + hostfwd=[protocol]::[host-system-port]-:[virtual-machine-port] : Port forward/map/translate from the Host System Port to the Virtual Machine Guest Port (similar to docker's "-p | --publish" option)
                + smb=/path/to/folder : Startup a Samba (SMB) server in the Virtual Machine and Mount the specified volume/folder from the host system into the virtual machine
- -netdev [type],{options=value,...} : To Initialize and define a new network device for use
    - General Options
        - id=[network-device-id] : Specify the Network Device ID
    - Types
        - bridge : Create a new bridge network interface
            - Options
                + br=[bridge-network-interface] : Specify the Bridge Network Interface to use from the host system
        - user
            - Options
                + hostfwd=[protocol]::[host-system-port]-:[virtual-machine-port] : Port forward/map/translate from the Host System Port to the Virtual Machine Guest Port (similar to docker's "-p | --publish" option)
- -device [device],{options=value,...} : To initialize a new device of a specified device type
    - Device Type
        + e1000
    - Options
        + netdev=[target-network-device] : Specify a Network Device ID to attach to this new device

### Usages

### Frequently used definitions and explanation
+ -net nic : Initialize a new network using the host NIC
+ -net bridge,br=br0 : Initialize a bridge network and assign/attach a bridge network interface to the network
+ -netdev bridge,id=hn0,br=[bridge-network-interface] : Initialize and define Network Device for the Bridge Network Interface
+ -netdev user,id=[network-device-id-e1000],hostfwd=tcp::[host-system-port]-:[virtual-machine-port] : Define and Initialize a new Network Device for the user/host-level network infrastructure; Initialize the Network Device ID for reuse/labelling and port forwarding from the host system port to the virtual machine guest port (similar to docker's "-p | --publish" option)
+ -device e1000,netdev=[network-device-id-e1000] : Initialize a new device of type 'e1000' and attach the network device 'network-device-id-e1000' as created previously

## Table of Contents
+ [Bridge Networking](bridge-networking.md)
+ [Port Handling](ports.md)

## Wiki
### TODO
+ Figure out how to set static IP address within the Virtual Machine Guest and access like VirtualBox's '--network' flag

## Resources

## References
+ [QEMU Wiki - Networking](https://wiki.qemu.org/Documentation/Networking)

## Remarks
