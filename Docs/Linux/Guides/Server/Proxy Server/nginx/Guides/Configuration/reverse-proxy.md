# Nginx - Reverse Proxy Server

## Information
### Basics
- Mapped your parent domain and child subdomains to the server IP addresses (or as a CNAME if is the same machine) in your hosts file or DNS server 
    - To be used in your reverse proxy server
        + DNS servers map IP Addresses to a domain name (aka Human-readable text so you dont need to memorise the IP address)
        + (Reverse) Proxy servers map a domain IP/name to a socket (server_name:port_number) as well as locations to form a full URL route

## Structure
### default.conf
```
server {
    # Your webserver routing and definitions
}
```

## Components
### Default Configurations
> These are the base requirements for reverse proxy using Nginx
+ server{} : For webserver routing definition and configuration
+ listen : Setting listening port number for the webserver connection
- location : For defining the webserver's routing definition and options
    + proxy_set_header : To set the proxy HTTP Headers 
    + proxy_pass : This is the heart of the reverse proxy functionality, this redirects the connection from a client to another webserver

## Setup
### Pre-Requisites
- DNS Server : For mapping your reverse proxy server names to this nginx server for reverse proxy mapping (as well as any other DNS domain name to IP address mappings)
    + Mapped your reverse proxy redirect server names to this nginx server (127.0.0.1)

### Dependencies


## Configuration
- Basic Webserver Configuration
    ```
    # Set webserver definitions
    server {
        listen 80;
        listen [::] 80;
        server_name [domain name];

        location / {
            # Set proxy headers
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $remote_addr;
            proxy_set_header Host $http_host;
            proxy_set_header X-NginX-Proxy true;

            # Reverse Proxy redirect pass
            proxy_pass [url-to-redirect];
        }
    }
    ```

- using Subdomains (i.e. sub.domain.apps.home)
    + Format: sub.domain.apps.home
    + "1 subdomain, Single IP address, multiple locations" system
    ```
    server {
        listen 80|443;
        listen [::] 80|443;
        server_name parent.domain;

        location / {

        }
    }

    server {
        listen 80|443;
        listen [::] 80|443;
        server_name child.domain.1;

        location / {

        }
    }

    server {
        listen 80|443;
        listen [::] 80|443;
        server_name child.domain.2;

        location / {

        }
    }

    ...
    ```



## References
