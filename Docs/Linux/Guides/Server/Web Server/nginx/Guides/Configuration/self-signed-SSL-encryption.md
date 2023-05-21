# Nginx Reverse Proxy - SSL/TLS Encryption

## Information
### File structure and Components
+ Private Key : /etc/ssl/private
+ SSL Certificate : /etc/ssl/certs
- Nginx Configuration File(s)
    + /etc/nginx/nginx.conf

## Self-Signed Certificate
- Generate a self-signed certificate
    - using OpenSSL
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

- Restart nginx service
    ```console
    sudo service nginx restart
    ```

- Check nginx status
    ```console
    sudo service nginx status
    ```

- Test status
    - Attempt to connect to your server over HTTPS
        - Examples
            ```
            https://[server-ip|domain-name]/subdomains (if any)
            ```
        - Expected result
            + It should proxy pass to your target location

