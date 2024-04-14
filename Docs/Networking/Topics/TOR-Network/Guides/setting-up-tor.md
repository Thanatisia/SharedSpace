# Setting up the TOR Network

*DISCLAIMER*
------------
+ The following content is for educational and for learning purposes only, please do not use this for any malicious/illegal use

## Information

### Basics
- TOR stands for The Onion Router, it is a protocol that uses proxychains - effectively chains and networks of proxy servers - to string together 'nodes'
    + TOR nodes are effectively proxy servers that changes your location and information whenever you pass through them which is what anonymizes you the more nodes you pass through

## Setup
### Dependencies
+ tor
- Bundled with the tor package
    - torify : Wrapper for torsocks and tor
        - Operates like a SOCK5 proxy server, with regards to how you move through and have some network communication through that protocol
            + like a proxychains on the command line, you can put this in front of other commands you want to run and that tunnels the traffic all through TOR

### Pre-Requisites
- Install tor to run in the background so that you can tunnel through the onion router
    - Explanation
        + The tor VPN/proxychain is what allows you to access the dark web/deep web `.onion` sites
        + Moving through the different relays and nodes across that network
    - Using package managers
        - apt-based
            ```bash
            apt install tor
            ```
        - pacman-based
            ```bash
            pacman -S tor
            ```

### Setting up TOR
- Edit the TOR configuration file '/etc/tor/torrc'
    ```bash
    $EDITOR /etc/tor/torrc
    ```

- Enable/Disable configuration settings in '/etc/tor/torrc'
    - Enable the Control Port
        + Manually control what port TOR should use to listen for local connections from TOR controller applications
        - if you enabled this, be sure to enable one of the authentication methods to prevent attackers from accessing it
            - Authentication Methods
                + `HashedControlPassword [hashing-size (16|32)]:[hash-hexdigest]`: Specify a custom password hash
                + `CookieAuthentication [0|1]`: Disable/Enable Cookie-based Authentication
        ```
        ControlPort [port-number]
        ```
    - Specify authentication methods
        + `HashedControlPassword [hashing-size (16|32)]:[hash-hexdigest]`: Specify a custom password hash
        + `CookieAuthentication [0|1]`: Disable/Enable Cookie-based Authentication

- Restart tor after completion configurations
    - Using 'service'
        ```bash
        service tor restart
        ```

- Verify your Public IP address is going through TOR
    - using curl
        - By default
            + This will return your Public IP address
            ```bash
            curl https://ifconfig.so
            ```
        - Pass curl through torify as a proxy
            - you should now be using a new public IP address
                + If this is not your real public IP address, TOR should now be working
            + This is because you are now passing through TOR as a proxy server, exitting towards ifconfig and returning
            ```bash
            torify curl https://ifconfig.so
            ```

## Documentations

### CLI utilities
> torify

- Usage
    - Using curl
        - Pass curl through torify as a proxy
            - you should now be using a new public IP address
                + If this is not your real public IP address, TOR should now be working
            + This is because you are now passing through TOR as a proxy server, exitting towards ifconfig and returning
            ```bash
            torify curl https://ifconfig.so
            ```

## Wiki

### Project filesystem structure/layout
- /etc/ : System miscelleoneous and configuration files
    - tor/ : Contains the TOR configuration files
        + torrc : The TOR configuration file

## Resources

## References
+ [YouTube - John Hammond - Scraping Dark Web Sites with Python](https://www.youtube.com/watch?v=r8JzWoU2_lU)

## Remarks


