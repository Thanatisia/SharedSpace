# HTTPS SSL Encryption

Please place all your SSL Public Key Encryption (PKE) Digital Certificates and your SSL Certificate Private Keys in this folder.

Folder Contents:
 * digicert.crt | digicert.pem : Your Public Key Encryption (PKE) Digital Certificate to SSL/TLS Encrypt with, for HTTPS
 * private.key : The Private Key of your SSL Public Key Encryption for encrypting

## SSL Cert types:
 * OpenSSL
 * Let's Encrypt

## Using gen_rsa.sh

Included in this folder is my RSA-2048 SSL Digital Certificate generator powered by OpenSSL.

### Documentation

#### Synopsis/Syntax
    sudo ./gen_rsa [key_name] [certificate_name]

#### Parameters
- Positionals
    - key_name : The name of your RSA-2048 X.509 Private key output
    - certificate_name : The name of your RSA-2048 X.509 certificate output

#### Usage
- generate key and certificate
    sudo ./gen_rsa example_1.key example_1.crt

