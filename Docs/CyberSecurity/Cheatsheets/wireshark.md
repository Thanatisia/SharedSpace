# Wireshark - Cheatsheet

## Syntax/Format
- Search Filter
    ```console
    [filters] {operator} [values]
    ```

## Operators
+ '!=' : Not Equals to
+ '==' : Equals to
+ '>=' : More than or Equals to
+ '<=' : Less than or Equals to
+ '>'  : More than
+ '<'  : Less than

## Filters
- arp : Search for targets using the ARP protocol
    - dst : Search for a Destination address using the ARP protocol
        - hw_mac : Find the Hardware MAC (physical) address
    - src : Search for a Source address using the ARP protocol
        - hw_mac : Find the Hardware MAC (physical) address
- igmp : Search for IGMP packets
    - maddr : Search for IGMP Membership group addresses (239.X.X.X)
    - saddr : Search for IGMP Source addresses
- ip  : Search for targets using the TCP/IP protocol targets
    - dst : Search for a Destination address using the TCP/IP protocol
    - src : Search for a Source address using the TCP/IP protocol

## Documentation
### Usage
- Multicasting
    - To find IGMP group address
        - Filter for IGMP using filter keyword 'igmp'
        - Look for the Transmitter device's Source IP address
            + it should have a packet info of 'Membership Report group [group address]

    - Validate IGMP Snooping
        - In the wireshark filter
            - Search 'ip.dst == 224.0.0.0/4'
                - Add-on Filters
                    + 'and udp' : To filter and show all UDP packets only
                    + 'and ip.src == [transmitter-ip]' : To filter and check for packets from the multicast device's source IP address
                + This will filter the captured network traffic to only show those packets that have been multicast
                - Key Indicators of Multicast traffic packets
                    1. Destination address is between 224.0.0.0 to 239.255.255.255
                        + The destination address is the multicast group that a transmitter on the network is broadcasting to (to find a receiver)
                    2. Protocol is UDP

### Useful Filters
- Network Debugging
    + `ip.dst == 255.255.255.255` : Check for devices flooding the network with broadcast address packets (255.255.255.255) or a possible broadcast storm

- Checking for IGMP Snooping
    + `ip.dst == 224.0.0.0/4` : Check for all Multicast IGMP packets
    + `ip.dst == 224.0.0.0/4 and udp and ip.src == [multicast-device-ip]` : Check for UDP-related Multicast IGMP packets sent by the multicast device
    + `arp.dst.hw_mac == [mac-address]` : Check for all packets sent to the specified multicast device's MAC address
    + `arp.src.hw_mac == [mac-address]` : Check for all packets sent by the specified multicast device's MAC address

## Wiki
### Network Protocols
+ ICMP : The 'Internet Control Message Protocol'; aka used by ping. ICMP does not have a port number
+ IGMP : The 'Internet Group Message Protocol'; used by Multicasting devices such as HDMI over IP Extenders that requires '1-to-many' packet broadcasting. IGMP does not have a port number

## Resources

## References

## Remarks
