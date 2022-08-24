# Networking - Dictionary 

## Hardware
- NIC : Network Interface Card; Provides a device with a MAC (Hardware) Address for networking

## Software
- ARP Table: A cache table within an operating system that contains all identified device IP and MAC address within the network

## Networking 
- IP Address: The name/network address of a network-enabled device within the network
    - This changes depending on if 
        + it is statically set, 
        + or assigned according to DHCP
- MAC Address: The Physical Hardware Address assigned to a layer 2/3 device
    - All NIC has a unique MAC Address
        + thus it will not change

## Protocols
+ ARP : The Address Resolution Protocol; Maps an IP Address of a device in the network to the MAC Address for location by the router
+ DHCP : Dynamic Host Control Protocol; Used by a router to Dynamically assign an IP Address to a device within the network whenever
+ TCP/IP : Transmission Control Protocol/Information Protocol

## TCP/IP OSI 7-Layer
- A : Application (The Software); Layer 7
    + Display in the software/application
- P : Presentation; Layer 6
    + Prepare to display information in the software/application
- S : Session; Layer 5
    + Unpacks the packets received to prepare for presentation in the software
- T : Transportation; Layer 4
    + Transports the packets from a source to  a destination
    - Examples
        - Protocols
            + TCP/IP
- N : Network; Layer 3
    + identifies the network and prepares for transportation of packets
    - Examples
        + Routers
- D : Data Link; Layer 2;
    + Prepares the network for identification and packs the data into packets
    - Examples
        + Switches
- P : Physical (The Hardware); Layer 1


