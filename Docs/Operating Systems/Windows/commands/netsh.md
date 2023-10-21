# Documentation - Command : netsh

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information

### Setup
+ Built-in

### Description
```
netsh, also known as Net Shell, is a Windows Command Line Utility that is not only older than ipconfig, it is more powerful - similar to how ufw (the Uncomplicated Firewall) is based on iptables.

netsh allows you to completely configure your networking environment via the Command Line, such as
    - ipsec
    - tcp/ip
    - rpc
    - firewall
    - network interface
    etc
```

## Documentation

### Synopsis/Syntax
```batchdos
netsh {options ...} [commands] {actions arguments...}
```

### Parameters
```
Note:
- Please refer to 'netsh /?' for the full documentation/manual
    - This is currently a WIP and is therefore, incomplete.
```

- Commands
    + ? : Use this in a context to display a list of commands
    + add : Adds a configuration entry to an existing list of entries
    - Context Change
        + advfirewall : Change to the netsh 'advfirewall' context
        + firewall : Change to the netsh 'firewall' context
        + int | interface : Change to the netsh 'interface' context
        + wlan : Changes to the netsh 'wlan' context

- Contexts
    - advfirewall : Modify host system firewall options (with more features than firewall)
        - Notes
            - Similar to 'firewall' context but 'firewall' is unable to 
                + Enable group of rules
                + Create rules for services
                + Create rules that support multiple filtering criteria
            - Recommended instead of 'firewall'
        - Action
            - set {profiles} {options arguments} : Modify a firewall option in a specified profile
                - Profiles
                    + allprofiles : Modify all profiles
                - Options
                    + state {on|off} : Enable/Disable Firewall
    - firewall : Modify host system firewall options
        - Action
            - set {profiles} {options arguments} : Modify a firewall option in a specified profile
                - Profiles
                    + allprofiles : Modify all profiles
                - Options
                    + state {on|off} : Enable/Disable Firewall
    - int | interface : Modify network interface options
        - Action
            - show {options} : Show a Network Interface option
                - Option
                    + interface : Show your current network interface statuses
            - ip [{action} [arguments] : Manage Network Interface's IP-related options
                - Action
                    + dump : Dump out current IP configuration; Redirect to write the IP config into a file for re-import/backup
                    - set {option} : Set an option to the Internet IP
                        - Options
                            + addr [interface] {static|dhcp} [ip-address] [subnet-mask] [default-gateway] : Set IP Address, Subnet Mask and Default Gateway to the specified interface
                            + dns [interface] {static|dhcp} [dns-ip-address] [primary|secondary]: Set static (primary/secondary) DNS server IP address to the specified interface
                    - show {option} : Show Network Interface IP-related options
                        - Options
                            + address : List all IP Addresses in all network interfaces
                            + dnsservers : List all DNS Server Addresses in all network interfaces
    - wlan : Manages Wireless LAN (aka Wi-Fi) options
        - Action
            - show [format] : Generate a report on your Wireless LAN status according to the format specified
                - Formats
                    + `profile [network-ssid/name] {options}`: Displays all information related to your Network Wi-Fi profile
                    + wlanreport : In a report document; Save it in "C:/ProgramData/Microsoft/Windows/WlanReport"
        

- Optionals
    + -f [ip-configuration-file] : Import in an IP configuration file you dumped
    + /? : Displays a detailed list of commands

### Usage

- Setting static IP address, Subnet Mask and Default Gateway
    ```batchdos
    netsh int ip set addr lo static [ip-address] [subnet-mask] [default-gateway]
    ```

- Setting Static primary DNS Server IP Address
    ```batchdos
    netsh int ip set dns lo static [dns-ip-addr] primary
    ```

- Switch interface to DHCP from Static IP address
    ```batchdos
    netsh int ip set addr lo dhcp
    ```

- Dump out current IP configuration
    ```batchdos
    netsh int ip dump >> [ip-config-file]
    ```

- Reimport IP configuration file
    ```batchdos
    netsh -f [ip-config-file]
    ```

- Generate a formatted wireless report file about your Wireless LAN status
    ```batchdos
    netsh wlan show wlanreport
    ```

- Show Wi-Fi network profile
    + This will show all information pertaining to your WiFi
    + Add the 'key=clear' to display your Wi-Fi password in clear text
    ```batchdos
    netsh wlan show profile [network name/ssid] {key=clear}
    ```

- Show your current Network Interfaces
    ```batchdos
    netsh interface show interface
    ```

- Show specific IP Addresses
    ```batchdos
    netsh interface ip show address | findstr "IP Address"
    ```

- Show all DNS servers
    ```batchdos
    netsh interface ip show dnsservers
    ```

- Turn off Windows Defender Firewall
    ```batchdos
    netsh advfirewall set allprofiles state off
    ```

- Turn on Windows Defender Firewall
    ```batchdos
    netsh advfirewall set allprofiles state on
    ```

## Wiki

### Basics

### Terminologies
> Some basic networking terminologies that you might need to know when working with netsh
- Network Interfaces
    + lo : Localhost (aka 127.0.0.1)
- Network Allocation Types
    + DHCP : Dynamic Host Control Protocol; Dynamically allocate an IP address to your host system by your router
    + Static : Static IP Address allocation - state your own IP address

## Resources

## References
+ [YouTube | NetworkChuck | 40 Windows Commands you NEED to know (in 10 Minutes)](https://www.youtube.com/watch?v=Jfvg3CS1X3A)
+ [leastprivilege - netsh vs ifconfig](https://leastprivilege.com/2004/06/20/netsh-vs-ifconfig/)

## Remarks

