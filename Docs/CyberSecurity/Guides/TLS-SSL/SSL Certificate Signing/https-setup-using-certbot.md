# HTTPS Setup - Automatic SSL Certificate generating using Certbot

## Information
### Certbot
```
CertBot is Let's Encrypt's Automated Certificate Management Environment (ACME) CLI utility 
that is used to help automate the fetching of valid TLS/SSL Certificates for manually-administered websites
from Let's Encrypt - an Open Certificate Authority (CA) launched by the EFF, Mozilla and Others, and deploys it to the webserver
```

## Setup
### Dependencies
- Install certbot
    - Using apt
        ```console
        apt install certbot
        ```
- Install Webserver dependencies
    - nginx
        - Using apt
            ```console
            apt install nginx python3-certbot-nginx
            ```

### Pre-Requisites
- Nginx
    - Prepare Web/proxy server configuration
        ```config
        server {
            listen 80;
            listen [::]:80;
            server_name example.com;
            root        /home/www-example/public;
            charset     utf-8;
            location / {
                # Statements
            }
        }

        server {
            listen 80;
            listen [::]:80;
            server_name www.example.com;
        
            return      301 http://example.com$request_uri;
        }
        ```

    - Enable site configuration
        ```console
        ln -s /etc/nginx/sites-available/www-example /etc/nginx/sites-enabled/www-example
        ```

    - Reload configuration
        ```console
        nginx -t && sudo systemctl reload nginx
        ```

    - Allow HTTPS in the firewall
        - ufw
            ```console
            ufw allow 80
            ```

    - Test accessing your site via HTTP and HTTPS
        - HTTP
            ```console
            curl -L http://your-site.com/
            ```

### HTTPS SSL Certificate Signing
- Setup HTTPS configuration with certbot
    + certbot will automate the signing of certificates for valid HTTPS
    + This will ask for which domains certificates should be created. It will then update the site configuration accordingly and also set up a HTTP -> HTTPs redirect.
    - Apache
        ```console
        certbot --apache
        ```
    - Nginx
        ```console
        certbot --nginx
        ```

### Security and Testing
- Allow HTTPS in the firewall
    - ufw
        ```console
        ufw allow 443
        ```

- Reload configuration
    - Nginx
        ```console
        nginx -t && sudo systemctl reload nginx
        ```

- Test accessing your site via HTTP and HTTPS
    - HTTPS
        ```console
        curl -L https://your-site.com/
        ```

## Wiki
### Related
+ Digital Certificates
+ TLS/SSL
+ Certificate Authority
+ Certificate Signing
+ SSL Certificate
+ Self-Signed Certificate
+ Let's Encrypt

## Resources

## References
+ [CertBot EFF - ReadtheDocs - Stable - Intro](https://eff-certbot.readthedocs.io/en/stable/intro.html#:~:text=Web%20servers%20obtain%20their%20certificates,it%20to%20a%20web%20server.)
+ [CertBot EFF - FAQ](https://certbot.eff.org/faq)
+ [Let's Encrypt - Getting Started](https://letsencrypt.org/getting-started/)
+ [Medium - phlypo - Using Let's Encrypt Certificate Authority](https://medium.com/@phylypo/using-lets-encrypt-certificate-authority-e890ecd0c9e0)
+ [ralfebert - tutorials - Nginx static website with HTTPS](https://www.ralfebert.com/tutorials/nginx-static-website-with-https/)

## Remarks
