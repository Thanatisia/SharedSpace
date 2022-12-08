# Nginx - Reverse Proxy Server

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

## References
