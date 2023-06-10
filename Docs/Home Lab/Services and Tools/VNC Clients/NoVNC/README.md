# NoVNC VNC Client

## Table of Contents
+ [Information](#information)
- [Contents](#contents)
    + [Guides](#guides)
+ [Documentations](#documentations)
+ [Wiki](#wiki)
+ [Remarks](#remarks)

## Information
### Background
- NoVNC
    ```
    NoVNC - also known as "Not anOther VNC client" - is a VNC client that is powered by websockify to allow the accessing of VNC servers through the browser via a WebUI.

    In short, NoVNC is a browser VNC client project.
    ```

- Websockify
    ```
    Formerly named wsproxy and was part of the NoVNC project, Websockify is a WebSocket to TCP proxy/bridge. This allows a browser to connect to any application/server/service
    ```

### Project
- Project File Structure
    + NoVNC WebUI path: /usr/share/novnc

- Dependencies
    + websockify : Required to startup NoVNC WebUI as a webapp on a browser

- Repositories
    + [Github - NoVNC](https://github.com/novnc/noVNC)
    + [Github - websockify](https://github.com/novnc/websockify)

- URLs
    + [novnc](novnc.com)


## Contents
### Guides
+ [setup.md](Guides/setup.md)


## Documentations
### Notes
```
because NoVNC uses websockify as a entry point to startup as a WebApp/Web service, the documentation will be using websockify as the primary command

However, documentations will be using NoVNC as a context.

Instructions will be modified when NoVNC is usable as a standalone application.
```

### Synopsis/Syntax
```console
websockify {options} [novnc-webui-port-number] [vnc-server-port-number (example: localhost:5901)]
```

### Parameters
- Positionals
    + novnc-webui-port-number : Specify the websockify server port number to access the WebUI on the browser
    + vnc-server-port-number  : Specify the URL (domain:port) of the VNC server you want the instance to be mapped/pointed to
- Optionals
    + -D : Start as a daemon/background service/process
    + --cert=[path-to-certificate] : Specify SSL Certificate path to startup as encrypted/HTTPS
    + --web=[path-to-webapp-files] : Explicitly specify path of the browser application/VNC Client to startup as a server

### Usage
- Starting up without HTTPS (SSL/TLS Encryption)
    - Start up NoVNC WebUI with HTTP on port 6080 pointing to the VNC Server display ':1'
        ```console
        websockify -D --web=/usr/share/novnc 6080 localhost:5901
        ```
    - To access:
        + Type into your browser: 'http://[server-ip-address]:6080/vnc.html'

- Starting up with HTTPS (SSL/TLS Encryption)
    - Start up NoVNC WebUI with HTTPS on port 6080 pointing to the VNC Server display ':1'
        ```console
        websockify -D --web=/usr/share/novnc --cert=/path/to/novnc.pem 6080 localhost:5901
        ```
    - To access:
        + Type into your browser: 'https://[server-ip-address]:6080/vnc.html'

## Wiki
### Snippets

### Resources
+ [server-world - Configure VNC Server](https://www.server-world.info/en/note?os=Ubuntu_22.04&p=desktop&f=6)

### References
+ [server-world - VNC Client: NoVNC](https://www.server-world.info/en/note?os=Ubuntu_22.04&p=desktop&f=8)

## Remarks