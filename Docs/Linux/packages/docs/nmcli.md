# Network Manager CLI Utility

## Information
### DESCRIPTION
```
The Network Manager CLI Utility (nmcli) is, as the name suggests, a command line utility created to communicate and interface with the Network Manager service.
```

## Setup

## Documentation
### Synopsis/Syntax
```console
nmcli [target] [action] [modifier-option] [values] <arguments> ...
```

### Parameters

- Targets
    - connection : Manage linux Network Connections
        - Actions
            + down : Stop/take down the specified interface
                - Syntax:
                    ```console
                    sudo nmcli connection down "Interface name"
                    ```
            + modify : Modify existing network connections
                - Syntax:
                    ```console
                    sudo nmcli connection modify [Interface name] <modifier options> "values"...
                    ```
                - Modifiers
                    - ipv4.dns : target interface's IPv4 DNS server
                        - Value
                            + Type: String
                    - ipv6.dns : target interface's IPv6 DNS server
                        - Value
                            + Type: String
                - Tips n Tricks
                    - You can set multiple IPv4/IPv6 DNS Addresses in a single go
                        + Seperate each dns address entry with a space-delimiter
            + up : Startup the specified interface
                - Syntax:
                    ```console
                    sudo nmcli connection up "Interface name"
                    ```
    - device : Manage network device information
        - Actions
            + status : Get device list and displays their connection state on standard output

- Flags

### Usage
- Set the DNS server address(es) for a network interface profile
    - IPv4
        ```console
        sudo nmcli connection modify "Interface-Name" ipv4.dns "dns-server-{ip|mac}-address {other-dns-server-addresses...}"
        ```
    - IPv6
        ```console
        sudo nmcli connection modify "Interface-Name" ipv6.dns "dns-server-{ip|mac}-address {other-dns-server-addresses...}"
        ```

- Get network device state
    - All
        ```console
        nmcli device status
        ```
    - Filter
        + Ethernet
            ```console
            nmcli device status | grep -i ethernet
            ```

        + WiFi
            ```console
            nmcli device status | grep -i wifi
            ```

        + Wireguard
            ```console
            nmcli device status | grep -i wireguard
            ```

- Manage Network Interface's connection state (Up|Down)
    - Startup a network interface
        ```console
        sudo nmcli connection up "Interface name"
        ```
    - Stop/teardown a network interface
        ```console
        sudo nmcli connection down "Interface name"
        ```
    - Reload a network interface
        ```console
        sudo nmcli connection down "Interface name"
        sudo nmcli connection up "Interface name"
        ```

## Wiki

