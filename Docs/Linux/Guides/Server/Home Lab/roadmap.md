# Home Server Roadmap

```
A master Writeup and drawing of a overview/roadmap of a working Home Lab/Server infrastructure from start (Default Gateway and Clients) to end (Server and Interfaces + Protocols
```

## Overview Structure 
```
- External (Public) Network
    - Clients
        |
        | Connecting via L2TP IPSEC VPN
        |
- Router (Default Gateway)
    |
    | Port Forwarding
    |
    - IPSEC VPN Server (For security)
        - Internal (Private) Network
            |
            |-- Servers (Home Lab Infrastructure)
                 |
                 - Docker Containers
                     |-- NAS Network File Sharing Server (Network Shared Drive)
                         - File Server
                             - Samba/CIFS
                     |-- Media Server 
                         - Jellyfin (Web Interface)

```
