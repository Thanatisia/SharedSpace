# Ethtool

## Information
### DESCRIPTION
```
ethtool is the standard Linux utility for controlling network drivers and hardware
    - particularly for wired Ethernet devices.

Features includes (but not limited to):
    - Get identification and diagnostic information
    - Get extended device statistics
    - Control speed, duplex, autonegotiation and flow control for Ethernet devices
    - Control checksum offload and other hardware offload features
    - Control DMA ring sizes and interrupt moderation
    - Control receive queue selection for multiqueue devices
    - Upgrade firmware in flash memory
    - Handle Wake-on-LAN (WoL) magic packet support (run as root)
```

### Package
+ Package Name : ethtool

## Setup

### Pre-Requisites
- Obtain the ethernet interface 
- Obtain the MAC address of the ethernet interface

### Dependencies

### Installing ethtool
- Using debian-based distributions (apt)
    ```console
    sudo apt install ethtool
    ```
- Using arch-based distributions (pacman)
    ```console
    sudo pacman install ethtool
    ```

### Persistency
> To enable Wake-on-LAN permanently
- Using systemd
    - Create a service file 'wol.service' in '/etc/systemd/system' with the following contents
        - '/etc/systemd/system' is where you place all your systemd service files
            + Afterwhich you can handle the service via systemctl
        ```
        [Unit]
        Description=Enable Wake-on-LAN

        [Service]
        Type=oneshot
        Exec = /sbin/ethtool --change [network-interface] wol g

        [Install]
        WantedBy=basic.target
        ```
    - Enable the service
        ```console
        sudo systemctl daemon-reload
        sudo systemctl enable wol.service
        ```

    - Check the service
        ```console
        sudo systemctl status wol.service
        ```

## Documentation

### Usage
- Check if Network Interface supports Wake-on-LAN
    ```console
    sudo ethtool [network-interface]
    ```

- Turn on Wake-on-LAN temporarily
    ```console
    sudo ethtool --change [network-interface] wol g
    ```

## Wiki

### Synopsis/Syntax

```console
sudo ethtool {options} <arguments> [network-interface]
```

### Parameters

#### Positional Arguments

- network-interface : The target Ethernet Network Interface you want to use
    + Value : The interface name
    + Type : String

#### Optional Arguments

+ --change [network-interface] [feature] [message] : Change the message for the feature set to the Network Interface
    - Feature
        + wol : Wake-on-LAN
    - message : any of the PUMG

### pumg
> The letters are different options that this interface supports for Wake-on-LAN
+ p : Wake on PHY activity
+ u : Wake on unicast messages
+ m : Wake on multicast messages
+ b : Wake on broadcast messages
+ g : Wake on MagicPacket messages
+ d : Disable (wake on nothing) - clears all previous options

## Remarks

## Resources
+ [Linux Kernel - ethtool](https://mirrors.edge.kernel.org/pub/software/network/ethtool/)

## References
