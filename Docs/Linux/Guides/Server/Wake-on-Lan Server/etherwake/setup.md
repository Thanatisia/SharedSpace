# Linux - Wake-on-LAN Server : using Etherwake

## Setup
```console
This process is similar to making any linux system into a Wake-on-Lan (WoL) Server
```
### Pre-Requisites
+ Ensure you have static IP set on the device
- Enable WoL Magic Packets on Operating System
    - Windows
        - Select your Ethernet Network Adapter
            - Enter Properties
                - Go to 'Advanced' Tab
                    - Under 'Wake on Magic Packet' property
                         + Ensure that value is 'Enabled'
                - Go to 'Power Management' Tab
                    - Ensure that at least this is turned on
                        - Allow this device to wake the computer
                            + Only allow a magic packet to wake the computer
                    - Optional
                        + Allow the computer to turn off this device to save power

    - Linux
        - Using ethtools
            - Check WoL
                ```console
                sudo ethtool [network-interface]
                ```
            - Turn on Temporarily
                ```console
                sudo ethtool --change [network-interface] wol g
                ```
            - (OPTIONAL) Enable Persistency
                - Using systemd
                    - Create a new file 'wol.service' in the folder '/etc/systemd/system' with the following contents
                        ```
                        [Unit]
                        Description=Enable Wake On Lan

                        [Service]
                        Type=oneshot
                        ExecStart = /sbin/ethtool --change [network-interface] wol g

                        [Install]
                        WantedBy=basic.target
                        ```
                    - Enabling the service
                        ```console
                        sudo systemctl daemon-reload
                        sudo systemctl enable wol.service
                        ```
                     - Check its status
                        ```console
                        systemctl status wol.service
                        ```
            + For more info on using [ethtools](https://github.com/Thanatisia/SharedSpace/tree/main/Docs/Linux/Guides/Networking/Network%20Drivers/ethtool.md)

    + (OPTIONAL) via BIOS
        > If you are unable to turn on the device from the Windows options


### Dependencies

### Installation
- Install 'etherwake'
    - Debian-based Distributions
        ```console
        sudo apt install etherwake
        ```

## Documentation

### Usage
- Set command to wake PC up with Magic Packet
    ```console
    sudo etherwake -i [ethernet-interface] [target-MAC-address]
    ```

