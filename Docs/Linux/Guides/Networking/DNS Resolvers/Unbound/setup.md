# Linux - Open Source DNS Resolver - Unbound : Setup

```
This guide for a generic use to Unbound DNS Resolver is still a WIP, i have a working guide to running Unbound with Pi-hole
```

## Information
### DESCRIPTION
```
Unbound is a secure Open-Source recursive DNS server developed primarily by NLnet Labs, VeriSign Inc., Nominet and Kirei.
- Unbound is the recursive DNS resolver

Using Unbound, we can turn pi-hole's into a recursive DNS server.

In fact, Unbound can make any Linux system into a Recursive DNS server/resolver
    - So this is not necessarily just a Pi-hole specific usage
    - However, this specific configuration is for Pi-hole
        + Generic Unbound setup guide is a TODO
```

### Package
+ Package Name : unbound

### File Location
+ Unbound Default Files : /etc/unbound
+ Unbound Configurations : /etc/unbound/unbound.conf.d/

### Files
- /etc/resolv.conf : Linux DNS resolver config file
- /etc/unbound
    - unbound.conf : Unbound default configuration file

## Setup

### Installing DNS Server - Unbound Pi-hole DNS Solution
- Install 'unbound' package
    - via Package Manager
        - Debian-based (apt)
            ```console
            sudo apt install unbound
            ```            
        - Arch-based (pacman)
            ```console
            sudo pacman -S unbound
            ```
            
- Notes
    - If you see it failed the startup service - thats normal
        + Thats because it doesnt have a configuration yet

### Setup unbound configuration file
- Configure unbound configuration file
    - Open unbound configuration file 
        ```console
        sudo $EDITOR /etc/unbound/unbound.conf
        ```
        - Enter the above config into the file
           
    - Restart your unbound service
        ```console
        sudo service unbound restart
        ```
        
    - Test unbound to see if it is operational
        - Using dig to perform a DNS lookup
            + Target IP: 127.0.0.1 (your dns server interface)
            + Port : 5335
            ```console
            dig [domain-name] @127.0.0.1 -p 5335
            ```
  
    + Unbound configuration should be done
  
### Local DNS Server
- To use unbound as your local DNS server
    - Edit your DNS table in '/etc/resolv.conf'
        ```console
        sudo $EDITOR /etc/resolv.conf
        ```
        - Set your nameserver to the loopback addresses
            + '::1'
            + '127.0.0.1'
            ```
            # /etc/resolv.conf
            nameserver ::1
            nameserver 127.0.0.1
            options trust-ad
            ```
            
## References
+ [YouTube | TechHut | The Pi-Hole install EVERYONE needs!](https://www.youtube.com/watch?v=xtMFcVx3cHU)

## Resources
+ [Pi-Hole Documentations - DNS Server Solution - Unbound](https://docs.pi-hole.net/guides/dns/unbound/)
+ [ArchWiki - Unbound General Installation Documentations](https://wiki.archlinux.org/title/unbound)

## Remarks
