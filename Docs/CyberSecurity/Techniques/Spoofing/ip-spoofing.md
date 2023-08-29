# IP Spoofing

## Information


## Documentation

## Snippets and Examples
- Port Scanning with IP Spoofing
    - Entities
        + Attacker
            + IP Address: 10.0.2.6
        - Target/Client
            - Windows Machine
                + IP Address: 10.0.2.8
                + FTP Server
    - Steps
        1. Find IP address of attacker
        2. Find IP address of client
        - Attacker machine
            - using nmap
                - Port Scan the target client's network
                    - Port scan (-sn)
                        ```console
                        nmap -sn 10.0.2.0/24
                        ```
                        + Will return a group of ports and devices in the network
                        + Choose an IP address to scan for ports
                - Port scan wellknown ports of a specific target client's IP address
                    - TCP Scan
                        ```console
                        nmap -sT -p1-1024 10.0.2.8
                        ```
            - using hping
                + Potentially can perform DoS attacks if target client's resources have been used up
                - Port scan port 21 using Hping
                    ```console
                    sudo hping3 -S -p 21 10.0.2.8
                    ```
                - Port scanning with IP Spoofing
                    - Syntax/Synopsis
                        ```console
                        sudo hping3 -S -p [target-port-to-scan] [client-ip] -a [spoof-ip]
                        ```
                    - Spoofing as Google DNS server (8.8.8.8)
                        ```console
                        sudo hping3 -S -p 21 10.0.2.8 -a 8.8.8.8
                        ````
                - Port Scan while spoofing as randomized IP address
                    - Syntax/Synopsis
                        ```console
                        sudo hping3 -S -p [target-port-to-scan] [client-ip] --rand-source
                        ```
                    - Randomize
                        ```console
                        sudo hping3 -S -p 21 10.0.2.8 --rand-source
                        ````
        - Target Client's machine
            - Windows machine
                - Check ports
                    ```console
                    netstat -an | find ":[port-number]"
                    ```

## Resources

## References

## Remarks