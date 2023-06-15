# Nginx custom configurations for services

## Table of Contents
- Basic
    + [Setup](#setup)
- Services
    + [Gitea](#gitea)
    + [Guacamole](#guacamole)
    + [Heimdall](#heimdall)
    + [it-tools](#it-tools)
    + [Jellyfin](#jellyfin)
    + [Nextcloud](#nextcloud)
    + [Pihole](#pihole)
    + [Searx-NG](#searx-ng)
    + [Syncthing](#syncthing)
    + [Uptime Kuma](#uptime-kuma)

## Basic
### Setup
- HTTP
    ```
    server {
        listen 80;
        server_name [domain];

        # Set Variables

        # Service location Routing
        location / {
            ...
        }
    }
    ```

- HTTPS
    ```
    server {                                                                                                                                              
        listen 443 ssl;
        listen [::]:443 ssl http2;
        server_name [domain];

        # Set Variables

        # SSL Certification
        ssl_certificate /etc/ssl/certs/cert.crt;
        ssl_certificate_key /etc/ssl/private/private.key;

        # Service location routing
        location / {
            ...
        }
    }
    ```

## Services
### Gitea
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Gitea
            location / {
                # Proxy main Gitea traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:3000/;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Gitea
            location / {
                # Proxy main Gitea traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:3000/;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
            }
        }
        ```

### Guacamole
- Nginx configuration routing
    - HTTP
        ```
        server {                                                                                                                                              
            listen 80;
            server_name [domain];

            # Set Variables

            ## Guacamole
            location / {
                # Proxy main guacamole traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number]/;
                proxy_pass_request_headers on;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-Forwarded-Host $http_host;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $http_connection;
                # Disable buffering when the nginx proxy gets very resource heavy upon streaming
                proxy_buffering off;
            }
        ```
    - HTTPS 
        ```
        server {                                                                                                                                              
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Guacamole
            location / {
                # Proxy main guacamole traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number]/;
                proxy_pass_request_headers on;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Forwarded-Proto $scheme;
                proxy_set_header X-Forwarded-Host $http_host;
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection $http_connection;
                # Disable buffering when the nginx proxy gets very resource heavy upon streaming
                proxy_buffering off;
            }
        ```

### Heimdall
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            # Routes
            ## Default
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
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            # Routes
            ## Default
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
            }
        }
        ```

### it-tools
- Nginx configuration routing
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## it-tools
            location / {
                # Proxy main service traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port];
            }
        } 
        ```

### Jellyfin
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            # Routes
            location / {
              proxy_pass http://[ip-address]:[port-number]/;
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
    - HTTPS
        ```
        server {
            listen 443 ssl;
            server_name [domain];

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt # Place your SSL certificate here
            ssl_certificate_key /etc/ssl/private/private.key # Place your private key here

            # Routes
            location / {
              proxy_pass http://[ip-address]:[port-number]/;
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

### Nextcloud
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            ## Nextcloud
            location / {
                # Proxy main Nextcloud traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number];
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Nextcloud
            location / {
                # Proxy main Nextcloud traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number];
            }
        }
        ```

### Pihole
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            # Set Variables

            ## Pihole
            location / {
                # Proxy main guacamole traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number]/;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_hide_header X-Frame-Options;
                proxy_set_header X-Frame-Options "SAMEORIGIN";
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Pihole
            location / {
                # Proxy main guacamole traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:[port-number]/;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_hide_header X-Frame-Options;
                proxy_set_header X-Frame-Options "SAMEORIGIN";
            }
        }
        ```

### Searx-NG
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            ## Searx-NG
            location / {
                proxy_pass http://[ip-address]:[port-number];
                proxy_set_header Host $host;
                proxy_set_header Connection $http_connection;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Scheme $scheme;
            }

            location /searx/static/ {
                alias /usr/local/searx/searx-src/searx/static/;
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Searx-NG
            location / {
                proxy_pass http://[ip-address]:[port-number];
                proxy_set_header Host $host;
                proxy_set_header Connection $http_connection;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header X-Scheme $scheme;
            }

            location /searx/static/ {
                alias /usr/local/searx/searx-src/searx/static/;
            }
        }
        ```

### Syncthing
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            # Set Variables

            ## Syncthing
            location / {
                # Proxy main Syncthing traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:8384;
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Syncthing
            location / {
                # Proxy main Syncthing traffic
                # The / at the end is significant.
                # https://www.acunetix.com/blog/articles/a-fresh-look-on-reverse-proxy-related-attacks/
                proxy_pass http://[ip-address]:8384;
            }
        }
        ```

### Uptime Kuma
- Nginx configuration routing
    - HTTP
        ```
        server {
            listen 80;
            server_name [domain];

            ## Uptime Kuma
            location / {
                proxy_pass         http://[ip-address]:3001/;
                proxy_set_header   X-Real-IP $remote_addr;
                proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header   Host $host;
                proxy_http_version 1.1;
                proxy_set_header   Upgrade $http_upgrade;
                proxy_set_header   Connection "upgrade";
            }
        }
        ```
    - HTTPS
        ```
        server {
            listen 443 ssl;
            listen [::]:443 ssl http2;
            server_name [domain];

            # Set Variables

            # SSL Certification
            ssl_certificate /etc/ssl/certs/cert.crt;
            ssl_certificate_key /etc/ssl/private/private.key;

            ## Uptime Kuma
            location / {
                proxy_pass         http://[ip-address]:3001/;
                proxy_set_header   X-Real-IP $remote_addr;
                proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
                proxy_set_header   Host $host;
                proxy_http_version 1.1;
                proxy_set_header   Upgrade $http_upgrade;
                proxy_set_header   Connection "upgrade";
            }
        }
        ```
