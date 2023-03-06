# Home Lab/Server initialization setup guide

```
Things to do after base installation before proceeding
```

## TODO
- Set static IP address
    - Information
        - (Recommended) Ensure that you are using Ethernet. 
            + This is because setting static IP address using Ethernet has better reliability plus stability.
        - When setting the DNS server IP addresses, please seperate all ip addresses with a space (' ') delimiter
    - Steps
        - Edit '/etc/network/interfaces'
            + This folder is one location where you define network interfaces
            ```console
            sudo $EDITOR /etc/network/interfaces
            ```
            - Synopsis/Syntax
                ```
                auto [network-interface]
                iface [network-interface] 
                    address [ipv4-address]
                    netmask [subnet-mask]
                    gateway [default-gateway]
                    dns-nameservers [your-dns-server-IP-addresses ]
                ```
        - Teardown Network Interface
            + If up
            ```console
            ifdown [network-interface]
            ```
        - Startup Network Interface
            + If down
            ```console
            ifup [network-interface]
            ```
        - Restart NetworkManager
            - Using service
                ```console
                service networking restart
                ```
            - Using systemd
                ```console
                systemctl restart NetworkManager
                ```

- Enable SSH
    - Install dependencies
        + openssh
    - Enable SSHD
        ```console
        service sshd enable
        ```
    - Start SSHD
        ```console
        service sshd start
        ```
