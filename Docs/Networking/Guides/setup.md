# Computer Networks - Features and Protocol setup

## Setup
### Multicasting
- Information
    - Unlike broadcasting which is what computers use initially when searching for a specific device (i.e. via pinging) to locate and mapping the IP address of the device to its MAC address in the network
        - Multicasting is basically the idea where 1 device will be looking for multiple receiver signals by sending out IGMP packets to search for specific group IP addresses
- Networking protocols used
    - IGMP
- Examples
    - HDMI over IP Extenders
        - Typically there are 2 components: Transmitter (TX) and Receivers (RX)
            - The TX will be sending out a broadcast IGMP packet to the every address in the network (255.255.255.255) looking for the Group (IP) address (239.X.X.X), as well as sending the UDP packets to every address in the network, not just those devices looking for the group
                + If the group IP is not contained into a virtual IGMP Snooping list, the multicasting will eventually take down the network by drying out the resources internally (internal DoS)
                - To isolate this, you need to enable IGMP Snooping and VLAN controls
                    + By enabling IGMP Snooping, the network router/switch will take the devices looking for the IGMP group, and parse them to the appropriate locations
- Requirements
    - Enable IGMP Snooping
        - Information
            + Layer 2 feature
            + The network router/switch will take the devices looking for a specific IGMP group, and parse them to the appropriate locations
        - Setup
            - Pre-Requisites
                - IGMP Group address (i.e. 239.X.X.X)
                    - To find IGMP group address
                        - Using Wireshark
                            - Filter for IGMP using filter keyword 'igmp'
                            - Look for the Transmitter device's Source IP address
                                + it should have a packet info of 'Membership Report group [group address]
            - In Network Switches
                - Notes
                    - Do this for all switches that are in the transmission flow (i.e. cascading, parallel, as long as data is going through that switch, you need to enable IGMP Snooping in it)
                - Using the WebUI
                    + Enter the Network Switch WebUI
                    - Under 'L2/Layer 2 Features'
                        - This may vary but there should be a 'L2 Multicast Control' option
                            - IGMP Snooping
                                - Edit IGMP Snooping Group Settings
                                    + Enter the VLAN ID you want to map the IGMP control to
                                    + Enter the IGMP Group (IP) Address
                                    + Enter the Ethernet interface number (the port(s) you plugged the multicast transmitter device into)
        - Validation
            - Using Wireshark
                - In the wireshark filter
                    - Search 'ip.dst == 224.0.0.0/4'
                        + This will filter the captured network traffic to only show those packets that have been multicast
                        - Key Indicators of Multicast traffic packets
                            1. Destination address is between 224.0.0.0 to 239.255.255.255
                                + The destination address is the multicast group that a transmitter on the network is broadcasting to (to find a receiver)
                            2. Protocol is UDP

## Wiki

## Resources

## References

## Remarks
