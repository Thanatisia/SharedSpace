# Network Manager CLI Utility

## Information
### DESCRIPTION
```
The Network Manager CLI Utility (nmcli) is, as the name suggests, a command line utility created to communicate and interface with the Network Manager service.
```

### Package Information
+ Package Group: network-manager
+ Package Name: nmcli
- Summary
    + nmcli is a Command Line Interface (CLI) utility to support the Network Manager Daemon networking utility
    + Because nmcli is a CLI utility, it is extensive.
    + nmcli has a Terminal User Interface (TUI) utility named [nmtui](nmtui.md) that is less powerful but it gives you a Terminal GUI to work with

### Files
- /etc/NetworkManager/system-connections : Folder containing all network connection files
- /etc/NetworkManager/system-connections/[interface-name].nmconnection : NetworkManager connection file containing your nmcli settings and configurations
- /etc/NetworkManager/NetworkManager.conf : The NetworkManager global configuration file
- /etc/NetworkManager/conf.d              : Place all additional configuration files here
- /etc/Networkmanager/conf.d/dhcp-client.conf : The NetworkManager DHCP configuration file

## Setup

## Documentation
### Synopsis/Syntax
```console
nmcli [target] [action] [modifier-option] [values] <arguments> ...
```

### Parameters

- Targets
    - connection : Manage linux Network Connections
        + Default: Get a list of connections
        - Actions
            - add : Add a new Network Interface
                - Syntax
                    ```console
                    nmcli connection add [type <interface-type>] {options}
                    ```
                - Parameters
                    - Positionals
                        - type : The interface type
                            - Values
                                + eth : Ethernet
                                - wifi : Wi-Fi interface
                                    - Syntax
                                        ```console
                                        nmcli connection add type wifi {options} [settings].[properties]
                                        ```
                                    - Options
                                        + ifname "Interface-name" : Specify name of new Network Interface
                                        + ssid "SSID name" : Specify your network SSID name; used for WiFi
                                    - Settings
                                        - wifi-sec.
                                            - Properties
                                                - key-mgmt "Security Key encryption algorithm" : Specify the WiFi security key encryption algorithm to use
                                                    - Algorithms
                                                        + wpa-eap : For WPA-EAP
                                        - 802-1x
                                            - Properties
                                                - eap "EAP" : Specify EAP type; Can be ignored
                                                    - Valid Values
                                                        + peap
                                                - phase2-auth "authenticator" : Specify Phase2 Authenticator; Can be ignored
                                                    - Valid Values
                                                        + mschapv2
                                                - identity "email@domain.com" : Specify a unique Identifier for the Wi-Fi; i.e. Email
                                                - password "password" : Specify Wi-Fi password to connect with
                                                - system-ca-certs "yes|no" : Specify to use system certificate from Certificate Authority
                                                - domain-suffix-match "domain.com" : Specify the domain of the example to check
            - delete : Delete a connection
                - Syntax
                    ```console
                    nmcli connection delete [name_or_uuid]
                    ```
            - edit : Startup the nmcli Interactive Editor
                - Syntax
                    ```console
                    nmcli connection edit [interface-name]
                    ```
            - down : Stop/take down the specified interface
                - Syntax:
                    ```console
                    sudo nmcli connection down "Interface name"
                    ```
            - modify : Modify existing network connections
                - Syntax:
                    ```console
                    sudo nmcli connection modify [Interface name] [setting].[property] "values"...
                    ```
                - Modifiers/Settings
                    - ipv4
                        - Properties
                            + dns : target interface's IPv4 DNS server
                                - Value
                                    + Type: String
                            + route-metric : Change the interface's IPv4 route metric
                                - Value
                                    + Type: Integer
                    - ipv6
                        - Properties
                            + dns : target interface's IPv6 DNS server
                                - Value
                                    + Type: String
                - Tips n Tricks
                    - You can set multiple IPv4/IPv6 DNS Addresses in a single go
                        + Seperate each dns address entry with a space-delimiter
            + reload : Reload the configuration file; Perform this when 'etc/NetworkManager/system-connections' is modified
            + show : Get a list of connections with their names, UUIDs, types and backing devices
            - up : Startup the specified interface
                - Syntax:
                    ```console
                    sudo nmcli connection up "Interface name"
                    ```
    - device : Manage network device information
        - Synopsis/Syntax
            ```console
            nmcli device {options} <arguments>
            ```
        + Default: See a list of network devices and their state
        - Actions
            - disconnect : Disconnect from an interface
                - Synopsis/Syntax
                    ```console
                    nmcli device disconnect ifname [interface-name]
                    ```
            + status : Get device list and displays their connection state on standard output
            - wifi {options} : Manage WiFi devices
                - Options
                    - connect : Connect to a Wi-Fi network
                        - Synopsis/Syntax
                            ```console
                            nmcli device wifi connect [SSID_or_BSSID] password [password] {options}
                            ```
                        - Optionals
                            + hidden {yes|no} : Connect to a hidden Wi-Fi network; Flag specifies if Wi-Fi is hidden
                            + ifname [interface-name] [profile_name] : Map a profile to the specified interface
                    + list : List all nearby WiFi networks
                        - Synopsis/Syntax
                            ```console
                            nmcli device wifi list
                            ```
    - general : General NetworkManager Management
        - Synopsis/Syntax
            ```console
            nmcli general [action]
            ```
        - Actions
            + reload : Reload NetworkManager
    - radio : Manage Network interfaces
        - Synopsis/Syntax
            ```console
            nmcli radio [actions] {options}
            ```
        - Actions
            + wifi {off|on} : Turn off/on Wi-Fi

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
    - (Default) See a list of network devices and their state
        ```console
        nmcli device
        ```
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
        sudo nmcli connection up "Interface name or UUID"
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
    - Get a list of connections with their names, UUIDs, types and backing devices
        ```console
        nmcli connection show
        ```
    - Delete a network connection
        ```console
        nmcli connection delete [interface-name_or_UUID]
        ```

- Manage WiFi network devices
    - List nearby Wi-Fi networks
        ```console
        nmcli device wifi list
        ```
    - Connect to a Wi-Fi network
        ```console
        nmcli device wifi connect [SSID_or_BSSID] password [password]
        ```
    - Connect to a hidden Wi-Fi network
        ```console
        nmcli device wifi connect [SSID_or_BSSID] password [password] hidden yes
        ```
    - Connect to a Wi-Fi on an interface
        ```console
        nmcli device wifi connect [SSID_or_BSSID] password [password] ifname [interface-name] [profile-name]
        ```

- Disconnect an interface
    ```console
    nmcli device disconnect ifname [interface-name]
    ```

- Turn off Wi-Fi
    ```console
    nmcli radio wifi
    ```

- Editing connection
    - Using nmcli interactive editor
        ```console
        nmcli connection edit [interface-name]
        ```
    - Using nmcli cli
        ```console
        nmcli connection modify [interface-name] [setting].[property] "new-value"
        ```
    - Using connection files (Manual)
        - Edit the '.nmconnection' file in '/etc/NetworkManager/system-connections'
            ```console
            $EDITOR /etc/NetworkManager/system-connections/*.nmconnection
            ```
        - Reload the configuration file
            ```console
            nmcli connection reload
            ```

- General NetworkManager Handling
    + Reload NetworkManager
        ```console
        nmcli general reload
        ```

## Wiki

### Customizations
- Front-ends/GUI
    + nm-applet : The Networkmanager applet for Desktop Environments

### Related
+ [NetworkManager settings](https://man.archlinux.org/man/nm-settings.5)

## Resources

## References
+ [ArchWiki - NetworkManager](https://wiki.archlinux.org/title/NetworkManager)

## Remarks
