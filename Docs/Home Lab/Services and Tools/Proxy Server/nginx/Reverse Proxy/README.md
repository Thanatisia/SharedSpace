# nginx - Reverse Proxy documentation

## Project Workspace
### Components
+ Private Key : /etc/ssl/private
+ SSL Certificate : /etc/ssl/certs
- Nginx Configuration File(s)
    + /etc/nginx/nginx.conf

### Folders

## Setup

### Pre-Requisites
- Edit '/etc/nginx/nginx.conf'
    + This is the nginx main routing configuration file by default
    + Change this to include other configuration files and/or routing
- Edit '/etc/nginx/conf.d/default.conf'
    + This is the nginx default routing configuration file
    + Change this to include your server definition and routes
- (Optional) Encrypting with HTTPS
    + Generate Self-signed certificate with Private key using OpenSSL
- Domain Names 
    + Please ensure that your custom domain names has been added into your DNS server and/or host files

### Dependencies


## Documentation

### Explanations/Terminologies
+ proxy_pass : Pass to a webpage in the nginx server (/var/www/html)
+ proxy_redirect : Redirect and pass to another webserver domain/URL path

### Synopsis/Syntax

### Parameters

### Usage

## Wiki
### Snippets and Examples
- Generate a self-signed certificate
    - using OpenSSL
        + SSL Certificate path: /etc/ssl/certs/cert.crt
        + SSL Private Key path: /etc/ssl/private/private.key
        ```console
        sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/[private-key-name].key -out /etc/ssl/certs/[certificate-name].crt
        ```

- Configure nginx route
    ```
    server {
        listen 443 ssl;
        server_name [your-domain-name | ip-address];
        ssl_certificate /etc/ssl/certs/[self-signed-certificate]; # Place the Self-Signed Certificate which you generated previously in step 1 here
        ssl_certificate_key /etc/ssl/private/[private-key-name];  # Place the Self-Signed Certificate's private key which you generated previously in step 1 here

        # Routes
        location /subdomain/ {
            proxy_pass http://[server-ip|domain-name]:[port-number]/[subdomains];
            ...
        }

        location / {
            proxy_pass http://[server-ip|domain-name]:[port-number]/[subdomains];
            ...
        }
    }
    ```

- Test nginx configuration file
    ```console
    nginx -t
    ```

- Restart nginx
    ```console
    nginx -s restart
    ```

- Reload nginx
    ```console
    nginx -s reload
    ```

- Start nginx
    ```console
    nginx -s start
    ```

- Stop nginx
    ```console
    nginx -s stop
    ```

- Quit nginx
    ```console
    nginx -s quit
    ```

- Check nginx status
    ```console
    ps -ef | grep nginx
    ```

- Test status
    - Attempt to connect to your server over HTTPS
        - Examples
            ```
            https://[server-ip|domain-name]/subdomains (if any)
            ```
        - Expected result
            + It should proxy pass to your target location

### Configurations
+ Please refer to [Configurations](configurations.md) for a full list of (testing/tested) nginx configuration settings

## Resources

## References
+ [Nginx docs - Reverse Proxy](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

## Remarks
