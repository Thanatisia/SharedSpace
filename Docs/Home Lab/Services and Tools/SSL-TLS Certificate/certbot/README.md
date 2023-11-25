# CertBot

## Information
### Certbot
```
CertBot is Let's Encrypt's Automated Certificate Management Environment (ACME) CLI utility 
that is used to help automate the fetching of valid TLS/SSL Certificates for manually-administered websites
from Let's Encrypt - an Open Certificate Authority (CA) launched by the EFF, Mozilla and Others, and deploys it to the webserver
```

## Setup
### Dependencies
+ certbot

### Pre-Requisites
- Install certbot
    - Using apt
        ```console
        apt install certbot
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

## Documentation

### Synopsis/Syntax
```console
certbot [actions] {options} <arguments>
```

### Parameters
- Positionals
    - Actions
        + dry-run : Do not actually execute the action but just test the action
        + renew : Renew the previously-signed and obtained SSL Certificate; This will add a cronjob that will keep checking for the SSL Certification Expiration and Renewal as necessary
- Optionals
    - With Arguments
    - Flags
        + --apache : Setup certbot/let's encrypt configurations for Apache
        + --nginx : Setup certbot/let's encrypt configurations for nginx

### Usage
- To check the entry for certbot.timer
    ```console
    systemctl list-timers
    ```

- Test renewal of Let's Encrypt SSL Certificate
    ```console
    sudo certbot renew — dry-run
    ```

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

## Wiki

## Resources

## References
+ [CertBot EFF - ReadtheDocs - Stable - Intro](https://eff-certbot.readthedocs.io/en/stable/intro.html#:~:text=Web%20servers%20obtain%20their%20certificates,it%20to%20a%20web%20server.)
+ [CertBot EFF - FAQ](https://certbot.eff.org/faq)
+ [Let's Encrypt - Getting Started](https://letsencrypt.org/getting-started/)
+ [Medium - phlypo - Using Let's Encrypt Certificate Authority](https://medium.com/@phylypo/using-lets-encrypt-certificate-authority-e890ecd0c9e0)
+ [ralfebert - tutorials - Nginx static website with HTTPS](https://www.ralfebert.com/tutorials/nginx-static-website-with-https/)

## Remarks
