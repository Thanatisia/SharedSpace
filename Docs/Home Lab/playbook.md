Network Systems - Playbook

## Snippets and Examples
### Mapping URL to Domain-Port for production/public deployment
- Setting up domain names for deployed services
    - Install DNS server
- Setting up Reverse Proxy Server for mapping a route URL to a destination [IP address-port number] socket
    - Install Reverse Proxy Server
- Adding new domains for services
    - Add CNAME for new service mapped to a domain host in DNS server
        - Restart DNS Server
    - Add server location route in Reverse Proxy Server
        - Restart Reverse Proxy Server
