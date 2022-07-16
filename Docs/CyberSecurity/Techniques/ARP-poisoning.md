# Offensive Technique - ARP Poisoning

## Pre-Requisites
+ Gateway : A gateway is a network node that serves as an access point to another network
- Default Gateway
    + Connects the local network to the Public Network (Internet)
    + Is a device such as DSL router or cable router, Access Points
- Environments
    - In a home/small office environment
        + The default gateway router directly connects the local network to the public network
    - In a Enterprise Network Environment
        + The default gateway router connects the local network to an adjacent network, one hop closer to the public network
  

### Description
+ Is based on/A type of Man-in-the-Middle
- ARP Poisoning (Spoofing)
    - An attacker can exploit the fact that
        + ARP request/reply is trusted
        + Clients can accept any responses even if they did not send a request

- Scenario
    - The attacker will connect directly to the target's network
        + Pretending to be the default gateway
        + The attacker will claim they are the gateway, and broadcast his MAC address
        - The host will broadcast asking for MAC addresses
                + ARP will deliver the attacker's MAC address to the host
                + Host will reply and give the attacker its IP address and MAC adress to the attacker
                + The attacker will give the host's IP address and MAC address to the real Default Gateway

- Given the following Structure
    ```console
    Normal:
        Host ----> Default Gatway ----> External Network
        
    ARP Poisoning:        
    ```

### After ARP poisoning:
+ The real gateway thinks that the attacker is Host A while Host A thinks that the attacker is the gateway.
- So the attacker’s device is in the middle of the connection between Host A and the gateway 
	+ Every packet that is going to/from the client will have to go through the attacker’s device first.

### Danger of ARP Poisoning
- ARP poisoning will redirect traffic to and from any client to the attacker’s device
    + The attacker can read/modify/drop these packets in the traffic.
    + This allows the attacker to conduct more powerful attacks.
+ It is very effective and dangerous, but it is difficult to protect against it.

### ARP Poisoning Tools
+ ARPspoof
+ Bettercap
