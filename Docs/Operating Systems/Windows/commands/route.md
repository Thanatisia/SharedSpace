# Documentation - Command : route

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Description
```
route is a Ccommand line utility that allows you to view/manage the host system's network routing table.

The *NIX equivalent to route is 'ip route'.
```

## Documentation

### Synopsis/Syntax
```batchdos
route {options} [command] {[destination] [network-mask] [gateway-ip-address] [metric] [network-interface]}
```

### Parameters
```
Note:
- Please refer to 'route /?' for the full documentation/manual
    - This is currently a WIP and is therefore, incomplete.
```

- Commands
    - add [destination-ip-address] mask [subnet-mask] [source-ip-address] : Add routes to the Network Routing Table
        - Positionals
            + destination-ip-address : Target destination IP-address to reach
            + subnet-mask : The Network mask (i.e. 255.X.X.X) that defines your network structure
            + source-ip-address : Source IP address to use
    - delete [target-destination] : Delete an added route in the Network Routing Table
    + print : Print the current network routing table

### Usage

- Add a route to the Network Routing Table
    - Assuming
        + Destination : 192.168.X.0
        + Network Mask : /24 = 255.255.255.0
        + Source IP : 10.X.X.X
    ```batchdos
    route add 192.168.X.0 mask 255.255.255.0 10.X.X.X
    ```

- Delete a route in the Network Routing Table
    ```batchdos
    route delete 192.168.X.0
    ```

- Show current network routing table
    ```batchdos
    route print
    ```

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)

## Remarks

