# iptables

## Information

+ Package Name : iptables
+ Package Type : Networking Monitoring

### DESCRIPTION

```
iptables is a flexible command-line firewall utility developed for Linux systems that uses policies (aka 'rules') to manage packet traffics.

When the firewall detects packets trying to pass through, it will validate and verify the rules before deciding on further actions such as to deny or allow the traffic.
```

### Caution
+ iptables is difficult to setup as it requires a deeper understanding of TCP/IP and basic networking.

## Setup

### Pre-Requisites

### Dependencies

### Installing
> iptables is generally built-in to most if not all linux distributions, however, follow these in case it is not
- Using Package Manager
	- Debian-based (apt)
		```console
		sudo apt(-get) install iptables
		```
    - Arch-based (pacman)
        ```console
        sudo pacman -S iptables
        ```
        
## Documentation

### Synopsis/Syntax

```console
iptables {options} [arguments...]
```

### Parameters
+ -i [interface] | --in-interface [interface] : Sets the name of the interface to receive a packet
+ -j [targets/action-of-rule] | --jump [targets] : Set the target of the rule and what action will be performed if the packet is a match
+ -s [source-address] | --source [address] : Sets the source IP address/hostname/network name etc.
+ -d [destination-address] | --destination [address] : Sets the destination IP address/hostname/network name etc
+ --dport [destination-port] : Sets the destination port
+ -p [protocol] | --protocol [protocol] : Sets the protocol of the packet to track; I.E. TCP, UDP etc.
+ -o [interace] | --out-interface [interface] : Sets the name of the interface to send a packet

### Options
+ -A [Rules] | --append [Rules] : Adds one or more rules to the end of the selected chain
+ -C [Rules] | --check [Rules] : Checks for a rule matching the specifications in the selected chain
+ -D [Rules] | --delete [Rules] : Deletes one or more rules from the selected chain
+ -F | --flush : Refresh iptables and deletes all the rules one-by-one
+ -I [Rule/Chain] [Rule Number] | --insert [Rule] [Rule Number]: Insert one or more rules into the selected chain as the given rule number; Set the insertion rule for a target packet; Adds the specified insertion rule to the beginning of the chain and will be applied for
+ -L | --list : Display the rules in the selected chain
+ -n | --numeric : Displays the IP address or hostname and post number in numeric format
+ -N [name] | --new-chain [name] : Creates a new user-defined chain
+ -v | --verbose : Displays more information when used with the list option
+ -X [name] | --delete-chain [name] : Deletes the user-defined chain
+ --queue-num [queue_number] : Set queue number 

### Usage
+ Assign queue numbers for incoming packets
    ```console
    iptables -I INPUT -j NFQUEUE --queue-num 1
    ```
+ Assign Queue numbers for outgoing packets
    ```console
    iptables -I OUTPUT -j NFQUEUE --queue-num 1
    ```
- List all rules in iptables
    ```console
    sudo iptables -L -v
    ```
    
- Enabling traffic on localhost
    ```console
    sudo iptables -A INPUT -i lo -j ACCEPT
    ```
    
- Enabling Connections on SSH
    + Enable SSH (Port 22)
    ```console
    sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    ```
    
- Enabling Connections on HTTP
    + Enable HTTP (Port 80)
    ```console
    sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    ```
    
- Enabling Connections on HTTPS
    + Enable HTTPS (Port 443)
    ```console
    sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT
    ```

## Wiki

### Rules
``` 
iptables uses 3 different chains (also known as rules) to filter incoming and outgoing data packets
```
- INPUT
    + Used to control the behavior of *incoming connections/packets*
- OUTPUT
    + Used to control the behavior of *outgoing connections/packets*
- FORWARD
    + Used to control the bahavior of IP Forwarded packets; *incoming connections that are not actually being delivered locally.*

### Targets
```
When a packet matches a rule (aka chains), it is given a target. 

A target is like an action to perform if a packet matches a specific rule (chain)
```
- ACCEPT    : Will allow the packet to pass through; Accept the packet
- DROP      : Will not let the packet pass through; Drop the packet 
- RETURN    : Stops the packet from traversing through a chain/rule and tell it to go back to the previous chain
    
## Resources
+ [Linode - Control Network Traffic with iptables](https://www.linode.com/docs/guides/control-network-traffic-with-iptables/)

## References

## Remarks
