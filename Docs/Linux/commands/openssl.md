# Documentation - Command : openssl

## Table of Contents
+ [Information](#information)
+ [Setup](#setup)
+ [Documentation](#documentation)
+ [Resources](#resources)
+ [References](#references)
+ [Remarks](#remarks)

## Information
### DESCRIPTION
```
Used to generate a SSL certificate using OpenSSL
```

## Setup

### Pre-Requisites
- Prepare a directory to store the certificate
    - Examples
        - folder "SSL" in home folder
            ```console
            cd ~
            mkdir -p SSL
            ```

### Dependencies

### Obtaining

### Installing
+ Is installed by default in most linux distributions

## Documentation

### Synopsis/Syntax
```console
openssl [actions] {options} [arguments]
```

### Parameters
#### Positional Arguments
- Actions
    + general
        + -text : Enable flag to output in text
        + -noout : Disable standard output
        
    + genrsa : Generate RSA Key-Pair
        - Options
            + -out [output-key-file] [size] : Specify output RSA Key file and the size (in bits)
            
    + rsa : Use RSA key
        - Options
            + -in [input-key-file] : Specify input RSA Key file
            
    + req : Certificate Signing Request (CSR)
        - Options
            + -days [days-to-live] : Specify number of days for it to live until timeout (TTL)
            + -new : Create new Certificate Signing Request 
            + -key [RSA key] : Specify server key to request with
            + -in [input-csr-file] : Specify input Certificate Signing Request (CSR) file
            + -out [output-certificate-signing-request-file] : Specify output Certificate Signing Request (CSR) output file
            + -x509 : Create a new CSR using x509
           
    + s_server : OpenSSL Server-side Handling; Only usable within an internal network
        - Options
            + -key [server-RSA key] : Specify server key to request with
            + -cert [server-cert-file] : Specify Server's Certificate file
            + -CAfile [ca-crt-file] : Certificate Authority's Certificate file
            + -accept [accept-port-number] : Specify the port number to accept
    + s_client : OpenSSL Client-side Handling; Only usable within an internal network
            + -connect [host-ip-address]:[port-to-accept] : Connect s_server using s_client by the accepted port
    + x509 : Sign a certificate using X.509 CSR
        - Options
            + -CA [CA CRT file] : Specify Certificate Authority's certificate file
            + -CAKey [CA-RSA-key-file] : Specify Certificate Authority's Private Key
            + -days [days-to-live] : Specify number of days for it to live until timeout (TTL)
            + -req : Sign using Certificate Signing Request (CSR) file
            + -set_serial [serial_number] : Set a serial number for the certificate
            + -in [input-csr-file] : Specify input Certificate Signing Request (CSR) file
            + -out [output-certificate-signing-request-file] : Specify output Certificate Signing Request (CSR) output file 


### Usage
#### RSA Key
- Create RSA Key and check the contents
    - Generate RSA Key
        ```console
        openssl genrsa -out server.key 2048
        ```
    - Check RSA Key contents
        ```console
        openssl rsa -in server.key -text -noout
        ```
        
#### Certificate Signing Request (CSR)
- Create Certificate Signing Request (CSR) using the key generated
    ```console
    openssl req -new -key server.key -out server.csr
    ```
    - Provide information for CSR
        ```console
        Country Name (2 letter code) []:
        State or Province Name (full name) [Some-State]:
        Locality Name (eg, city) []
        Organization Name (eg, company) [Internet Widgits Pty Ltd]:
        Organizational Unit Name (eg, section) []:
        Common Name (.g. server FQDN or YOUR name) []:
        Email Address []:
        ```
        
- Check the contents of the created CSR file
    ```console
    openssl req -in server.csr -text -noout
    ```

#### Root Certificate Authority
- Create root Certificate Authority's key
        ```console
        cd ~/SSL
        openssl genrsa -out CA.key 2048
        ```
        
- Create root CA's certificate using the information given
    ```console
    openssl req -new -x509 -days 365 -key CA.key -out CA.crt
    ```
    - Information
        ```
        Country Name (2 letter code) []:
        State or Province Name (full name) [Some-State]:
        Locality Name (eg, city) []:
        Organization Name (eg, company) []:
        Organizational Unit Name (eg, section) []:
        Common Name (e.g. server FQDN or YOUR name) []:
        Email Address []: 
        ```
    
- Sign your certificate using root CA's certificate you generated
    ```console
    openssl x509 -req -days 365 -CA CA.crt -CAkey CA.key -set_serial 01 -in server.csr -out server.crt
    ```

#### Setup TLS Connection
 - Start *socket server* in a new terminal
        ```console
        cd ~/SSL
        openssl s_server -key server.key -cert server.crt -CAfile CA.crt -accept 44300
        ```
        
- Connect to 'socket server' running in the internal network using 'socket client'
    ```console
    openssl s_client -connect localhost:44300
    ```
    

    
## Wiki
- Certificate Signing Request (CSR)
    - Information Required
        ```console
        Country Name (2 letter code) []: [country-name]
        State or Province Name (full name) [Some-State]: [country/state/region]
        Locality Name (eg, city) []: [city]
        Organization Name (eg, company) []: [organization name]
        Organizational Unit Name (eg, section) []: [organization section]
        Common Name (e.g. server FQDN or YOUR name) []: [domain]
        Email Address []: [your email address]
        ```

## Resources

## References

## Remarks

