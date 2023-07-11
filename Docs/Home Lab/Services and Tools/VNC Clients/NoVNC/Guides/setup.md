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
- If building from source with python
    - python3
    - python3
    - python{3}-setuptools
- novnc
    - Obtain repository
        ```console
        git clone https://github.com/novnc/novnc
        ```
    - Install
        - Using package manager
            - apt-based (Debian)
                ```console
                sudo apt install novnc
                ```
        - (Optional) Manual build from source
            + NoVNC is just a webUI application that you can just run from the main runner file
            + hence, just copy it to your '/usr/share/novnc' folder
            + However, websockify allows you to specify the path to the novnc folder, so you dont have to do this
            ```console
            sudo cp -r /folder/to/novnc /usr/share/novnc
            ```
- websockify
    - Obtain repository
        ```console
        git clone https://github.com/websockify/websockify
        ```
    - (Recommended) Creating Virtual Environment
        + Good for testing installation before committing to bare metal
        - Generate Virtual Environment
            ```console
            python3 -m venv env
            ```
        - chroot/source into Virtual Environment
            ```console
            . env/bin/activate
            ```
    - Installing
        - Using package manager
            - apt-based (Debian)
                ```console
                sudo apt install websockify
                ```
        - Using Python PyPi
            + websockify is a Websocket written in python
            ```console
            python{3} -m pip install websockify
            ```
        - Using Python setup.py (Manual Installation/Build from Source)
            + websockify is a Websocket written in python
            ```console
            sudo python{3} setup.py install
            ```
    - Uninstallation/Removal
        - Using package manager
            - apt-based (Debian)
                ```console
                sudo apt remove websockify
                ```
        - Using Python PyPi
            + websockify is a Websocket written in python
            ```console
            python{3} -m pip uninstall websockify
            ```

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