# NoVNC layering and implementation within a system

```
Documentation and details on the format/structure of a NoVNC Web client implementation within a network system
```

## Components
- Generally, when you want to work with any VNC server-client infrastructure, you have 2 common components
    1. VNC server : The VNC server that you want to run and display GUI environments on; 
        - Generally, this will be ran a target host device (typically a server) that is 
            - mapped to a display port in the following syntax: `5900 + display port number`, 
                + and users will connect to the VNC server mapped to that display port that was assigned
            - For Example
                + 5901 : Display client 1
                + 5902 : Display client 1
                + 5903 : Display client 1
                + 590N : Display client N
    2. VNC Client : The client you want to connect to the VNC server (i.e. PuTTY)

- However, when you are working with a Browser/Web-based VNC client, you have 3 components, the difference between an extra network implementation
    1. The VNC server
    2. NoVNC VNC client : The browser/web-based VNC client; as the name suggests, this is a browser WebUI that will be used by websockify to sniff out the VNC server and redirected to display on a browser
    3. Websockify : A Websocket framework used to sniff out the VNC server and redirect to display on a Web-based VNC client like NoVNC at a websocket server port number

## Structure
- In any given VNC server-client infrastructure layout
    - Classic
        ```
        [server]
        - VNC server (i.e. tigervnc)
            - Started, running the following configurations
                + VNC Server Display: 1
                + VNC Server Port Number: 5901
                + Display Server: xorg (for example)

        [client]
        - Host-based VNC client 1 (i.e. putty)
            + VNC server host IP/domain    : `localhost:5901`

        - Host-based VNC client 2 (i.e. putty)
            + VNC server host IP/domain    : `localhost:5902`

        - Host-based VNC client N (i.e. putty)
            + VNC server host IP/domain    : `localhost:590{N}`
        ```

    - Using NoVNC
        ```
        [server]
        - VNC server (i.e. tigervnc)
            - Started, running the following configurations
                + VNC Server Display: 1
                + VNC Server Host IP/domain: localhost
                + VNC Server Port Number: 5901
                + Display Server: xorg (for example)

        [client]
        - Websockify
            - Uses
                - VNC web/browser-based client (NoVNC): Points and redirects the VNC server display traffic to display on
                    + Default Path: /usr/share/novnc
            - Displays
                - Display 1
                    + VNC server host IP/domain    : `localhost:5901`
                    + Websockify server port number: 6800
                ...
                - Display n
                    + VNC server host IP/domain    : `localhost:590N`
                    + Websockify server port number: 68XX
        ```


