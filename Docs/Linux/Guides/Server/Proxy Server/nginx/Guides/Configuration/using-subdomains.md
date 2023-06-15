# Nginx Reverse Proxy Configurations - using Subdomains 

##  Using Subdomains 
- Format: sub.domain.apps.home
- Information
    - "1 subdomain, Single IP address, multiple locations" system
### Setup
- Pre-Requisites
    - Mapped your parent domain and child subdomains to the server IP addresses (or as a CNAME if is the same machine) in your hosts file or DNS server 
        - To be used in your reverse proxy server
            + DNS servers map IP Addresses to a domain name (aka Human-readable text so you dont need to memorise the IP address)
            + (Reverse) Proxy servers map a domain IP/name to a socket (server_name:port_number) as well as locations to form a full URL route

### Documentations        
- Syntax/Structure
    ```
    server {
        server_name parent.domain;

        location / {

        }
    }

    server {
        server_name child.domain.1;

        location / {

        }
    }

    server {
        server_name child.domain.2;

        location / {

        }
    }

    ...
    ```

