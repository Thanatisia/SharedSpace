# Nginx Reverse Proxy Server Configuration - Jellyfin

## Configuration
### HTTP (Default)
```
server {
    listen 80;
    server_name [domain];

    # Routes
    location / {
      proxy_pass http://[ip-address]:[port-number];
      proxy_pass_request_headers on;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-Host $http_host;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $http_connection;
      proxy_buffering off;
    }
}
```

### HTTPS (Default)
- Pre-Requisites
    - Generate your Self-signed certificate and private key
        + Using OpenSSL
            ```console
            sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout [private-key].key -out [ssl-certificate].crt
            ```

```
server {
    listen 443 ssl;
    server_name [domain];

    # SSL Certification
    ssl_certificate /etc/ssl/certs/cert.crt # Place your SSL certificate here
    ssl_certificate_key /etc/ssl/private/private.key # Place your private key here

    # Routes
    location / {
      proxy_pass http://[ip-address]:[port-number];
      proxy_pass_request_headers on;
      proxy_set_header Host $host;
      proxy_set_header X-Real-IP $remote_addr;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_set_header X-Forwarded-Proto $scheme;
      proxy_set_header X-Forwarded-Host $http_host;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $http_connection;
      proxy_buffering off;
    }
}
```