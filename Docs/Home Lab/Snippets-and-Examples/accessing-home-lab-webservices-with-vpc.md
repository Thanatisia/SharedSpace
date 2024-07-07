# Home Lab Network Infrastructure Planning Blueprints - Accessing Home Lab Web application services with a VPC

## Design
### Operational Flow

## Components
### Virtual Private Cloud (Tunnel/Middleman)
- Operating System
    + Debian (Recommended)
- Containerization
    + docker
    + docker-compose
- Firewall
    + ufw
- VPN Client : To interface with the home network's VPN Server as an exit node
    + tailscale
    + wireguard (requires port forwarding of wireguard VPN server port)
### Reverse Proxy/Network Server
- Operating System
    + Debian (Recommended)
- Containerization
    + docker
    + docker-compose
- Firewall
    + ufw
- VPN Server
    + headscale : Re-implementation of tailscale's tunneling core functionality
    + wireguard (requires port forwarding of wireguard VPN server port)
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
- VPN Server
    + headscale : Re-implementation of tailscale's tunneling core functionality
    + wireguard (requires port forwarding of wireguard VPN server port)
- DNS Server
    + pihole + unbound
- Reverse Proxy Server : For HTTP and Web Server internal Routing
    + nginx
- SSH brute-force mitigation
    + fail2ban : Banhammer all brute-force SSH attempts the second they fail

### Pre-Requisites
- System Security
    - VPC
        + Setup Fail2ban
        - SSH
            + Disable root access
            + Enable property "maximum retries" to 1 : to prevent brute-forcing of passwords
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

> Reverse Proxy Server
1. Setup your DNS Server and Resolver
    + Set your DNS server name
    + Set your domain CNAME alias for each webapplication server/service IP address

2. Setup your reverse proxy server
    - Configuration files
        - Webserver and domain Routing
            + Map the webserver route to the CNAME alias of the domain

3. Setup VPN Server Tunnel to interface with the VPC as a passthrough "tunnel" middleman without needing to port forward
    + Headscale : Re-implementation of tailscale's tunneling core functionality
    - Alternatives
        + wireguard : requires port forwarding of wireguard VPN server port

> VPC
1. Install the client for your VPN
    + wireguard for wireguard VPN server
        - Pre-Requisites
            + Home Server router port forwarded Wireguard protocol application port 51820/udp
    + tailscale for connect to the headscale core server as an exit node
2. Connect the VPN client to the VPN server, with the home network VPN Server set as the exit node
3. Create a systemd service to startup the client connection on reboot

### Snippets

