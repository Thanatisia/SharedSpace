# VLAN Interface - Setting VLAN

## Information
### Basics
- VLAN stands for "Virtual LAN", basically, assuming you try to break a big network switch of X ports into several smaller switches of X/N ports
    - Each "smaller" network switches are a LAN on its own
    - However, you are not physically breaking the network switches, but virtually, and thats exactly what a VLAN is
        + Just trying to split interfaces of your network switch into standalone sections/groups
        + By splitting, you can specify which group is meant for which department, hosts, devices, allowing for partitioning/compartmentalization
    - only the devices in the same VLAN can talk to each other.
        - i.e.
            + Only devices in VLAN 2 can talk to each other
            - All devices connected to other ports are assigned to VLAN 1 and can only talk to each other but 
                 + not to devices belonging to VLANs 2 or 3. 
                 + Generally, The switch management address is only accessible via a switch port assigned to VLAN 1.

### Terminologies
- Tagged : Generally attached to ports that are connected to a cascaded switch
- Untagged: Frames

### How to pick an interface
- set as 'tagged'?
    + 'Tagged' ethernet ports/interfaces are generally the ports you want to cascade/join to another network device
    + Interfaces with 'tagged' will have the packets tagged in the header with the VLAN ID and then sent out to the connected network device (switch etc)
    + A port can be marked tagged in any number of VLANs
    + Hence, the 'tagged' interfaces are those that are joined to another switch

- set as 'untagged'?
    + 'Untagged' ethernet ports/interfaces are generally the ports that are connected to a non-Layer-2/3 network device such as a router or a network switch
    + Interfaces with 'untagged' will not have the VLAN ID attached to the header of the packets, and will also have the VLAN ID tags removed (aka 'untagged') from the packets received from a tagged interface
    - If a port is marked untagged on one VLAN, it will be excluded from all other VLANs
        + Basically, an untagged interface can only be a part of 1 VLAN at a time
        - This is also why if you are using certain switches like the D-Link DGS-1100 series, 
            - you need to remove (set as Not Used) the interface you want to set as untagged from VLAN-1 (as VLAN-1 is the default VLAN) before you can set as untagged
                + Because you can only set an untagged interface in 1 VLAN
                + Generally you untag if its the first interface (input device) or the last interface (output medium)
    - For example
         + Port is connected to a multicast device
         + Port is connected to a PC

## Connection Examples
### Multicast Device
- HDMI over IP Extender
    - Components
        - TX : Extender Transmitter
        - S1 : Gigabit Network Switch [1]
        - S2 : Gigabit Network Switch [2]
        - RX : Extender Receiver
        - EthN : Ethernet Port/Interfaces
    - Connection
        + TX is connected to S1's Eth4
        + S1's Eth2 is connected to S2's Eth1
        + S2's Eth1 is connected to S1's Eth2
        + S2's Eth5 is connected to RX
    - VLAN Design
        - VLAN-20
            + VLAN ID: 20
            + Group Name: HDMI-EXT-1
            - Tagged, Untagged and Unused
                - S1
                    - Tagged
                        + Eth2
                    - Untagged
                        + Eth4
                - S2
                    - Tagged
                        + Eth1
                    - Untagged
                        + Eth5
    - Reasoning
        - S1
             - The tagged interface (Eth2) is connected to S2 which is a VLAN-capable network switch that will be connected to the RX
                 + the packets are meant to continue travelling to another network device.
                 + Therefore, the packets will be tagged with the VLAN ID in the header and then propagated to the next network device (S2)
             - The untagged interface (Eth4) is connected with the multicast device TX which is an input device sending frames through the network
                 - The goal is to send frames from TX --> S1 --> S2 --> RX, like a typical network traffic except it is a 1-directional transmission
                     + However, because it is a non-network device and is incapable of reading VLAN, we need to untag the header from the interface packets
        - S2
            - The tagged interface (Eth1) is connected to S1 and is receiving packets from S1
                - S1 is a network switch and is tagged as it is a VLAN-readable network device
                    + This means that the packets are tagged with the VLAN ID
            - The untagged interface (Eth5) is connected, and outputting, to the RX
                - Because the packet data (containing the frames) will be going out of the switch, 
                    + the packets have to have the VLAN ID removed ('untagged') from the header before exitting to its next destination (VLAN devices - PC etc)
    - Summary
        - With this isolated "pipeline", a Virtual LAN (VLAN) has been created and only devices connected to interfaces tagged with the same VLAN IDs can communicate with each other
            - i.e. Partitions are created, these partitions are the Virtual LANs
                + The doors that lets you go into these partitions (VLANs) are identifiable with the VLAN ID
                + The road (interfaces) between network devices (switches etc) are joined together using VLAN ID header tags (tagging) to identify how to move within the pipeline
                + Entering and exitting the pipeline will require the VLAN IDs to be removed from the header of the packets entering from a tagged interface because only VLAN-supported devices can read the VLAN headers
        - Using this idea in mind, 
            - To create an isolated network using VLANs
                - Steps
                    1. Setup a VLAN ID specifically for that network
                    2. Connect devices to those interfaces
                    3. Configure the interfaces that are assigned to that VLAN ID however you need
    ```
    transmitter
    |
    |
    |
    |---> Gigabit Network Switch [1]
            | 
            |
            |
            |---> Gigabit Network Switch [2]
                    |
                    |
                    |---> receiver

    ```

## Wiki

### Scenarios
#### Example 1 - 3 Switches and 2 VLANs
##### Information
+ any of the switches has at least one port (left: port 4, middle: ports 1 and 2, right: port 3) that has to transmit more than one VLAN (namely VLAN 2 (blue) and VLAN 3 (red)).

##### Setup
- Pre-Requisites
    - In general if a switch has at least one port to be used with at least two VLANs, you have to:
        + Disable Port-Based VLAN
        + Enable 802.1Q VLAN

##### Configuration
- For the left switch:
    - Add a new VLAN 2 (blue) and set port 4 to "Tagged" and port 6 to "Untagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth4
        - Untagged: Interface connected to a device; Eth6
    - Add a new VLAN 3 (red) and set port 4 to "Tagged" and port 5 to "Untagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth4
        - Untagged : Interface connected to a device; Eth5
    - The already existing VLAN 1 should now have ports 1-4 and 7-8 in state "Untagged" and ports 5-6 in state "Not Member"
        - Tagged : Connected to a cascaded switch; Eth5-6
        - Untagged : Interface connected to a device; Eth1-4, Eth7-8
    - in PVID settings set ports 1-8 to the following PVID values: 1, 1, 1, 1, 3, 2, 1, 1
        - the PVID values are the VLAN numbers for each interface
             - 1 = VLAN-1
             - 2 = VLAN-2
             - 3 = VLAN-3

- For the switch in the middle:
    - Add a new VLAN 2 (blue) and set ports 1 and 2 to "Tagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth1-2
    - Add a new VLAN 3 (red) and set ports 1 and 2 to "Tagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth1-2 (Eth1 = Switch-1, Eth2 = Switch-2)
    - The already existing VLAN 1 should now still have all ports 1-8 in state "Untagged".
        - Untagged : Interface connected to a device; Eth1-8 (No connections)
    - in PVID settings set ports 1-8 to the following PVID values: 1, 1, 1, 1, 1, 1, 1, 1
        - the PVID values are the VLAN numbers for each interface
             - 1 = VLAN-1
             - 2 = VLAN-2
             - 3 = VLAN-3

- For the right switch:
    - Add a new VLAN 2 (blue) and set port 3 to "Tagged" and port 8 to "Untagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth3 (Switch-2)
        - Untagged : Interface connected to a device; Eth8 (Connected to a device)
    - Add a new VLAN 3 (red) and set port 3 to "Tagged" and port 7 to "Untagged" (leave alle other ports in state "Not Member")
        - Tagged : Connected to a cascaded switch; Eth3 (Switch-2)
        - Untagged : Interface connected to a device; Eth7 (Connected to a device)
    - The already existing VLAN 1 should now have ports 1-6 in state "Untagged" and ports 7-8 in state "Not Member"
        - Untagged : Interface connected to a device; Eth1-6 (Not connected)
    - in PVID settings set ports 1-8 to the following PVID values: 1, 1, 1, 1, 1, 1, 3, 2
        - the PVID values are the VLAN numbers for each interface
             - 1 = VLAN-1
             - 2 = VLAN-2
             - 3 = VLAN-3

- As a result only the devices in the same VLAN (2 or 3) can talk to each other. 
    + All devices connected to other ports are assigned to VLAN 1 and can only talk to each other but not to devices belonging to VLANs 2 or 3. 
    + The switch management address is only accessible via a switch port assigned to VLAN 1.

- If you want to add one of the other ports of any of the three switches to VLAN 2 or VLAN 3, you have to
    + Edit the VLAN X (X=2 or 3 respectively) and set the desired port to "Untagged"
    + Set the PVID value (in PVID settings) of the desired port to X (X=2 or 3 respectively).

- Some basics:
    + The PVID value of a port identifies the VLAN that untagged frames entering the port ("receiving direction") will be assigned.
    + In the "sending direction" a frame belonging to VLAN X is sent untagged on port Y, if port Y is configured "Untagged" for VLAN X.
    + Note: Any port can be configured "Untagged" for at most one VLAN only.
    + A port that is configured "Untagged" or "Not Member" for a VLAN X, can be configured "Tagged" for any number of VLANs other than X.

- Summary:
    + Tagged: Frames are already tagged for this VLAN, don't do anything.
    + Untagged: Frames leaving the switch; If a frame belongs to VLAN A and the port is configured as "untagged" for VLAN A, the VLAN Tag is removed by the switch
    + Not Member: The port doesn't belong to the VLAN and mustn't see any frames meant for this VLAN
    + PVID: Frames entering the switch; Frames will be tagged with the given VLAN number. This is only true, if the frames are not tagged already.

## Resources

## References
+ [D-Link Forums - Topic: VLAN question on DGS-1100-08](http://forums.dlink.com/index.php?topic=64742.0)

## Remarks