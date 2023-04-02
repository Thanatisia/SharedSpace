# Security: Self-Signing Certificate for TLS/SSL

```
When using the TLS/SSL protocols used for encrypting and "keypad"-locking your connections when browsing the web via HTTPS,
    you require a Signed Certificate and a Private-Public Key Pair used to authenticate and authorise the message transfer.

Most people would rely on Certificate services like 
    - Let's Encrypt
    - CertBot 

These services helps to simplify the provision of SSL Certificate and Keys when signing for (D)DNS Hosting services like Cloudflare, DuckDNS, NoIP etc

However, it is also possible to self-sign your own Certificates
```

## Utilities
+ OpenSSL : A Free and Open Source SSL Certificate generator used to self-sign certificates for use with TLS/SSL protocol.
+ certutil : Used to communicate with the Certificate Authority (CA) database as well as update the system's certificate database.

## Steps
1. Generate SSL Certificate
    - Using OpenSSL
2. Add the SSL Certificate to the trusted Certificate Authority (CA) store
    - Using certutil
