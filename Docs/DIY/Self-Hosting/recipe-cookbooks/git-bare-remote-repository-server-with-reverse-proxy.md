# Self-Hosting - Setting up a git remote repository using git bare and using a reverse proxy to give it a human-readable path

## Information
### Description
+ The goal of this documentation is to setup a proper git remote repositgory server using just CLI and git bare (whats going on under the hood in GitHub, GitLab and Gitea)
+ As well as to use a Reverse Proxy Server to proxy pass the request from the git remote repository path to a route corresponding to the domain

## Setup
### Dependencies
+ git
- DNS Server (Optional) : Used to give the server a human-readable name (DNS)
    + pihole + unbound
    + bind9
- Reverse Proxy Server : Used to map/route the git remote repository path to the target path of the server
    + apache
    + nginx

### Pre-Requisites
1. Setup git bare remote repository server
2. Setup DNS server
    + Set a custom domain name for your git remote repositry server IP address
3. Setup Reverse Proxy server
    - Add a location block/route in the Reverse Proxy Server to map the git remote repository path to the URL path/route
        - Explanations
            - The various protocols have a different method of rendering the URL paths
                - Examples
                    + SSH: `ssh://[username]@[server-ip|domain]:/path/to/git/repository`
                    + WebSSH/HTTP(S): `[protocol]://[username]@[server-ip|domain]/path/to/git/repository`
                + They are all the same, however, the the HTTP(S) format is formatted by nginx's `proxy_pass` function which replaced the colon (':') in the path of the URL with a forward slash ('/')
        - Apache
            - Dependencies
                + apache2
            - Pre-Requisites
                - Enable Apache modules for proxying
                    ```bash
                    sudo a2enmod proxy
                    sudo a2enmod proxy_http
                    ```
            - Edit '/etc/apache2/sites-available/server.domain.conf'
                - Explanation
                    - `<VirtualHost *:80` : Define a new server block alongside the port this proxy/reverse proxy server will be listening for. For each block defined, a new entry/task/job is created for the proxy server
                        + `ServerName server.domain` : Set the name corresponding to this server block
                        - `ProxyPass /[custom-repository-name].git [internal-path]` : Define a new route/location for this server as well as the internal path to redirect/proxy passthrough. 
                            - When this domain is accessed, the route will be checked and if found, the (reverse) proxy server will route/redirect the connection according to the defined parameters, statements and properties
                                + Default: '/' (Root/index path)
                                - Examples
                                    + 'ProxyPass / protocol://server.domain' => 'protocol://server.domain/'
                                    + 'ProxyPass /route protocol://server.domain' => 'protocol://server.domain/route'
                                    + 'ProxyPass /route/api protocol://server.domain' => 'protocol://server.domain/route/api'
                ```
                <VirtualHost *:80>
                    ServerName server.domain

                    ProxyPass /[custom-repository-name].git http(s)://[username]@[server-ip-address|domain]/path/to/git/repository;
                    ProxyPassReverse /[custom-repository-name].git http(s)://[username]@[server-ip-address|domain]/path/to/git/repository;
                    ErrorLog ${APACHE_LOG_DIR}/error.log
                    CustomLog ${APACHE_LOG_DIR}/access.log combined
                </VirtualHost>
                ```
        - Nginx
            - Dependencies
                + nginx
            - Edit '/etc/nginx/nginx.conf'
                - Explanation
                    - `server {}` : Define a new server block specifying the port this proxy/reverse proxy server will be listening for. For each block defined, a new entry/task/job is created for the proxy server
                        + `listen 80;` : Begin listening for port 80 (HTTP). Set this to 443 to listen for HTTPS
                        + `server_name server.domain;` : Set the name corresponding to this server block
                        - `location /[custom-repository-name].git {}` : Define a new route/location for this server. 
                            - When this domain is accessed, the route will be checked and if found, the (reverse) proxy server will route/redirect the connection according to the defined parameters, statements and properties
                                + Default: '/' (Root/index path)
                                - Examples
                                    + 'location /' => 'protocol://server.domain/'
                                    + 'location /route' => 'protocol://server.domain/route'
                                    + 'location /route/api' => 'protocol://server.domain/route/api'
                            - `proxy_pass [internal-path];` : This tells the server to redirect internally via a passthrough (using the current server as a proxy) to the specified URL
                                - Internal Path Syntax: Web-based protocols have various ways of accessing resources/locations
                                    + General URL: `http(s)://new-url"
                                    + Authentication/Authorization-based: `http(s)://[username]@[server-ip-address|domain]/path/to/resource`
                            - `proxy_set_header [header-key] [header-value]` : Map/Set the specified header key to the header value to be passed into the proxy redirect connection
                                - Headers
                                    + `Host $host;` : Specify the new host IP address/domain for the redirect
                                    + `X-Real-IP $remote_addr;` : Specify the Real IP address for the redirect
                                    + `X-Forwarded-For $proxy_add_x_forwarded_for;` : Specify the target server this is redirecting to;
                                    + `X-Forwarded-Proto $scheme;` : Specify the "scheme" (aka the protocol) of the URL you are accessing with (i.e. HTTP, HTTPS)
                                - Special Keywords/Variables
                                    + $host : Get the current host
                                    + $remote_addr : Get the connection's default remote address
                                    + $proxy_add_x_forwarded_for : Get the default forwarding target
                                    + $scheme : Get the default protocol of the URL you are accessing (i.e. HTTP, HTTPS)
                ```
                server {
                    listen 80;
                    server_name server.domain;
                    location /[custom-repository-name].git {
                        proxy_pass http(s)://[username]@[server-ip-address|domain]/path/to/git/repository;
                        proxy_set_header Host $host;
                        proxy_set_header X-Real-IP $remote_addr;
                        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                        proxy_set_header X-Forwarded-Proto $scheme;
                    }
                }
                ```
4. Restart services
    + On service restart, you should be able to clone the remote repository server using the path/domain you set in the reverse proxy server

## Resources

## References

## Remarks
