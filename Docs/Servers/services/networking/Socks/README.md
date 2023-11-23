# Socks Proxy 

## Information
### Background
```
Socks (Sometimes known as 'Sock5') stands for 'Socket Secure', and is a network protocol used to setup a proxy server by
creating a Transmission Control Protocol (TCP) connection to another server behind the firewall on the client's behalf.

A proxy server, while like a VPN server - it masks your IP address and changes your location, does not perform encryption
    + There is also a variant of the Socks protocol, known as 'Shadow Socks' that performs encryption like a VPN

In Summary,
    Setting up Socks on a server will turn it into a proxy server, and when a client establishes and sets this server as a target proxy,
    The client's connection will pass through the proxy server as a 'middle-man' before being sent to the destination address.
```

### Basics
#### Terminologies
- Proxy: An alias/temporary replacement; A proxy is effectively something or someone that will perform an activity on behalf of an individual
- VPS : Virtual Private Server; a "Cloud" server instance - which is an isolated virtual platform on a company's server base
- SSH Tunnel: An SSH Tunnel is a connection/communication between your computer (localhost) and a specified remote host through a specified port number

#### Using Proxy Servers as regional 
- By setting up various Virtual Private Servers (VPS), such as Linode, in various regions
    + Afterwhich, setup a Proxy server in the server
    - You can effectively change your current location/country to that target destination location by proxy
        + The destination address will view your current location as the VPS' location

- Examples
    - Accessing from Japan
        + Create a VPS instance located in Japan
        + SSH into the VPS instance
        + Create an SSH tunnel from the server
        + Establish SOCKS proxy communciation in the host to the Proxy server
        + Test

## Setup

### Dependencies
+ OpenSSH

### Pre-Requisites
- Prepare a Virtual Private Server (VPS)
    + Preferably located in another region to maximize the usage

- Update and Upgrade repository packages

- SSH into the target server
    ```console
    ssh [username]@[server-ip]
    ```

### Steps
- Establish an SSH tunnel with Socks
    + Summary: This tells the computer to use itself as a proxy server
    - Explanation
        + This will effectively "Port Forward" the SOCKS proxy port number from the specified remote host
        + To the local host that is communicating/making connection with the Proxy Server
        + Thereby creating an SSH tunnel between your computer and the specified remote host
    - Parameters
        - Positionals
            - proxy-server : Specify the account of the SSH server
                + Format: username@server-ip
        - Optionals
            + `-D [socks-port-number]` : This will open a SOCKS proxy (that supports TCP/UDP connections) on the local port number specified
            + -N : This tells to not execute remote command, just forward the port
            + -C : This tells to compress the data over the tunnel
    ```console
    ssh -D 1337 -N -C [proxy-server (username@server-ip)]
    ```

- Set the proxy server configurations 
    - in your browser
        - Chrome
            - Click on the '3 lines' options to open up the dropdown box
                - Click on 'Settings'
                    + Or type 'chrome://settings'
                + Search for 'Proxy'
                - Click on 'Settings'
                    - To change the proxy server to the SOCKS proxy server
                        + Select 'Manual proxy configuration'
                        - Highlight 'SOCKS Host'
                            + Type in localhost
                        - Highlight 'Port' in the same row
                            + Type in 1337
                    - Remove proxy
                        + Click on 'No Proxy'
        - Firefox
            - Click on the '3 lines' options to open up the dropdown box
                + Click on 'Settings'
                + Search for 'Proxy'
                - Click on 'Settings'
                    - To change the proxy server to the SOCKS proxy server
                        + Select 'Manual proxy configuration'
                        - Highlight 'SOCKS Host'
                            + Type in localhost
                        - Highlight 'Port' in the same row
                            + Type in 1337
                    - Remove proxy
                        + Click on 'No Proxy'
    - in Linux
        - Shellscript
            ```console
            TBC
            ```

## Documentation
### Operational Flow
- 

## Resources
+ [SecurityIntelligence - Posts - SOCKS Proxy Primer: What Is SOCKs5 and Why Should You Use It?](https://securityintelligence.com/posts/socks-proxy-primer-what-is-socks5-and-why-should-you-use-it/)

## References
+ [YouTube - NetworkChuck - Google is forcing you to use their proxy (Build your own instead)](https://www.youtube.com/watch?v=JJ0St6OmTp0)
+ [Mattias Geniar - Create a SOCKS proxy on a Linux server with SSH to bypass content filters](https://ma.ttias.be/socks-proxy-linux-ssh-bypass-content-filters/)

## Remarks

