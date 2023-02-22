# WireGuard VPN server setup guide

```
This is the general setup steps for installing wireguard and setting up.

Applicable for both Docker and Bare-Metal
```

## Setup
### Steps
+ [Port Forwarding](#port-forwarding)

### Port Forwarding
```
Port Forwarding/translation/mapping - I will be aliasing as 'Port Forwarding' - is where you open up a port (similar to a door/gateway) from your private network to the open public network so that the connection from the outside can reach your server and wont be blocked by the firewall.

Typically, ports exposed will be mapped to an application and wont usually be empty because it is not safe.

Only those ports opened should be accessible and usable, thus, do not open all ports and only those that are necessary.
```
- Open your default gateway/router management panel and Login
    - Typically is one before your broadcast address
        + i.e. 192.168.1.254
- Enter your Port Forwarding page
    - also known as the following:
        + Port Mapping
        + Forwarding Rules
        + Port Translation
- Add a new port mapping rule
    > Note that in here, depending on your router model, the setting specifications may be different. However, the terminology and keyword meanings will be similar so refer to your Router's model documentations for more information on Port Forwarding
    - Settings
        + Mapping Name: This is your port forwarding name for your reference.
        + Internal Host: This refers to the device that will be using this port; May allow you to choose the device IPv4 address corresponding to your device's MAC address
        + External Source IP Address: This refers to the public IPv4 address of the device; Only important if you have another IPv4 address that is in the public domain linked to the device; Can leave empty
    - Add a new port
        - Definitions
            - Protocol: The layer 2 TCP/IP networking protocol that the service is using; I.e. TCP/UDP
                + Value: UDP
            - Internal Port Number: The port number on the private/host system side that you want to expose; Syntax: [host-system-port:public-port]
                + Value: 51820-51820
            - External Port Number: The port number on the public/gateway side that you want to expose and map to the Internal Port Number; Syntax: [host-system-port:public-port]
                + Value: 51820-51820
    + Press Apply

### Documentation

## Resources
+ [Pihole Docs - Wireguard VPN server setup guide](https://docs.pi-hole.net/guides/vpn/wireguard/server/)

## References
+ [YouTube - Techno Time - Meet WireGuard, the new hotness in VPN](https://www.youtube.com/watch?v=xlyTCuWqDOg)
+ [Docker - Linuxserver - Wireguard](https://docs.linuxserver.io/images/docker-wireguard)

## Remarks