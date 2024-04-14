# Setting up the TOR Network

*DISCLAIMER*
------------
+ The following content is for educational and for learning purposes only, please do not use this for any malicious/illegal use

## Information

### Basics
- TOR stands for The Onion Router, it is a protocol that uses proxychains - effectively chains and networks of proxy servers - to string together 'nodes'
    + TOR nodes are effectively proxy servers that changes your location and information whenever you pass through them which is what anonymizes you the more nodes you pass through

- After installing and setting up TOR on your local machine
    + You will want to access the TOR network via tor (the onion router) protocol like going through multiple proxy server nodes

## Setup

### Summary
+ Please refer to [setting-up-tor.md] for a full setup documentation
- Steps
    + Install TOR
    + Configure TOR
    + Verify TOR is setup properly

### Accessing Onion Top-level domain addresses
- Using curl
    - Explanation
        - By default, trying to curl or torifying the curl command wouldnt work because the system doesnt know where or what these '.onion' sites are
            + Hence, you need to tell curl to pull that information in since TOR is setup
        - curl parameters/arguments
            - Positionals
                + onion-site: Specify the target `.onion` site you want to curl and return the HTML code from
            - Optionals
                - With Arguments
                    - `--socks5-hostname [tor-socks5-server-ip|domain]:[tor-socks5-server-port-number (i.e. 9051)]` : Use and pass through the specified socks5 proxy server's hostname instead
                        - Examples
                            + tor-socks5-server-ip: 127.0.0.1
                            + tor-socks5-server-port-number: 9050
                - Flags
                    + '-s'
    ```bash
    curl -s --socks5-hostname [tor-socks5-server-ip|domain]:[tor-socks5-server-port-number] [onion-site]
    ```

## Documentations

## Wiki

### Terminologies
+ TLD: Top-level domains in the domain hierarchy is called the Top-level domains because its right at the top immediately before the root authority

## Resources

## References
+ [YouTube - John Hammond - Scraping Dark Web Sites with Python](https://www.youtube.com/watch?v=r8JzWoU2_lU)

## Remarks


