# NoVNC server setup guide

## Pre-Requisites
- Prepare VNC Server
    + Install VNC Server of your choice
    + Setup VNC Password
        ```console
        vncpasswd
        ```
    + Setup VNC Server configurations
    + Startup VNC Server

## Dependencies
+ novnc
+ websockify

## Preparation
### (Optional) Creating self-signed SSL certificate for TLS/SSL Encryption
```console
openssl req -x509 -nodes -newkey rsa:2048 -keyout [primary-key.pem] -out [self-signed-certificate.cert] -days [days-to-expiry (TTL))
```

## Starting up
- Startup NoVNC with websockify
    ```console
    websockify -D --web=/usr/share/novnc {options} [novnc-webui-port-number] [vnc-server-port-number (example: localhost:5901)]
    ```

## Usage
- Starting up with HTTPS (SSL/TLS Encryption)
    - Start up NoVNC WebUI with HTTPS on port 6080 pointing to the VNC Server display ':1'
        ```console
        websockify -D --web=/usr/share/novnc --cert=/path/to/novnc.pem 6080 localhost:5901
        ```
    - To access:
        + Type into your browser: 'https://[server-ip-address]:6080/vnc.html'

## Snippets


## Wiki
### Resources
+ [server-world - Configure VNC Server](https://www.server-world.info/en/note?os=Ubuntu_22.04&p=desktop&f=6)

### References
+ [server-world - VNC Client: NoVNC](https://www.server-world.info/en/note?os=Ubuntu_22.04&p=desktop&f=8)

## Remarks