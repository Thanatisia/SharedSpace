# Accessing Home Lab Web application services without VPC

## Components
### Reverse Proxy/Network Server
- Operating System
    + Debian (Recommended)
- Containerization
    + docker
    + docker-compose
- Firewall
    + ufw
- DNS Server
    + pihole + unbound
    + bind9
    + quad9
- Reverse Proxy Server : For HTTP and Web Server internal Routing
    + nginx
- SSH brute-force mitigation
    + fail2ban : Banhammer all brute-force SSH attempts the second they fail

## Setup
### Dependencies
- Containerization
    + docker
    + docker-compose
- Firewall
    + ufw
- DNS Server
    + pihole + unbound
- Reverse Proxy Server : For HTTP and Web Server internal Routing
    + nginx
- SSH brute-force mitigation
    + fail2ban : Banhammer all brute-force SSH attempts the second they fail

### Pre-Requisites
- Router
    - Port Forwarding: 
        - For Web Application access
            + port 80  (HTTP) => Reverse Proxy Server Host
            + port 443 (HTTPS) => Reverse Proxy Server Host

- System Security
    - Reverse Proxy Server Host
        + Setup Fail2ban
        - SSH
            + Disable root access
            + Enable property "maximum retries" to 1 : to prevent brute-forcing of passwords
        - Firewall
            - Incoming connections
            - Outgoing connections
                - Blacklist all outgoing network traffic
                    + For isolation purposes
                + Whitelist only the IP Address/domain of the target web application services you want to access

### Steps
1. Setup your DNS Server and Resolver
    + Set your DNS server name
    + Set your domain CNAME alias for each webapplication server/service IP address

2. Setup your reverse proxy server
    - Configuration files
        - Webserver and domain Routing
            + Map the webserver route to the CNAME alias of the domain

### Snippets

