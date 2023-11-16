# Starting GUI applications in a VNC server as a background process/daemon from the tty

## Information
### Description
```
The goal was to - within the tty - start up a GUI application, lets say firefox, in the background as a daemon/process using DISPLAY=:1

then afterwhich, starting up either a VNC server, or a Websocket server (i.e. NoVNC) that will point to that :1 display 
so that when I access the web/browser-based vnc client, it will go straight into firefox
so yeah, like as a background process such that when I run it, I will remain in the tty instead of going into the GUI application

the idea is that with this, I can startup as many GUI applications as I need/want as individual "VNC servers" and access them through the web browser

Of course, with this, theoretically you do not need a websocket server as once you have the VNC, you can just VNC in to that port/display as required
```

### Basics
- Framebuffer: A framebuffer is a portion of random-access memory (RAM) containing a bitmap that drives a video display. Essentially, A framebuffer is a virtual memory container that will hold display data used to well, display - such as Graphical Environments and/or render them
- Virtual: The environment is drawn in the background and stored within memory, and as such - is not "real" because it does not 

## Steps
1. Startup a Xvfb instance
2. Export '$DISPLAY' environment variable
3. Startup VNC server
4. (Optional) Startup Websocket server + Browser/web-based VNC client
5. Startup your GUI applications

## Setup
### Dependencies
+ Xorg : Display server
+ Xvfb : The Xorg Virtual Framebuffer
+ x11vnc : A VNC server; alternatives includes: [tigervnc]
+ websockify : (Optional) A Websocket server; only required if you wish to connect/display the display using a web/browser-based VNC client (i.e. NoVNC)
+ novnc : (Optional) A Web/Browser-based VNC client; only required if you wish to view the VNC server using a websocket interface

### Pre-Requisites

### X Virtual Framebuffer
- Startup a X virtual framebuffer instance in the background
    ```console
    Xvfb [display-number] -screen {screen-number (default: 0)} {resolution} &
    ```

### Export 'DISPLAY' environment variable to the virtual framebuffer display
+ This environment variable is important as 'DISPLAY' is used by display servers (Xorg, wayland etc) to specify what display to view on
+ By setting the $DISPLAY to the Xvfb display number, you can effectively switch between displays

```console
export DISPLAY=":[display]"
```

### Startup VNC server
- x11vnc
    - Explanation
        + `-display [virtual-display]` : This option explicitly specifies the X server display you wish to share
        + `-rfbport [vnc-port-number]` : This option is used to explicitly specify the VNC port you wish to point to; This allows you to match the display number to the VNC port you wish to use (i.e. :1 => 5901, :2 => 5902)
        + `-forever` : This flag basically tells the VNC server to run forever; By default - The VNC server instance will exit and close the first time you enter
        + `-bg` : Run the VNC server as a background process (daemon) instead of the foreground
        - Optionals
            + `-nopw` : This flag specifies that no password is required for VNC access for simplicity; You can add security as required
            + `-xkb`  : This flag ensures that the XKB extension is used
            + `-listen localhost` : This option ensures that the VNC server only listens on the localhost interface for added security
    ```console
    x11vnc -display :6 -rfbport 5906 -nopw -xkb -forever -bg
    ```

### (Optional) Startup Websocket server
- This is used to view the VNC server instance from a Web/Browser-based VNC client
    - i.e.
        + websockify + novnc

- websockify
    - Explanation
        + -D : This flag will run the Websocket server as a daemon/background process
        + `--web=[/path/to/novnc]` : Explicitly specify the Websocket Browser/web-based VNC client to startup with
        + websocket-server-port : The Port number of the websocket server you wish to access with; Format: 6080+[display-number]
        + vnc-server-ip : The host IP/domain of the VNC server you wish to point to; You can use '127.0.0.1' to explicitly point to localhost (useful if you are using a Virtual Machine without bridge interface and unique IP addresses)
        + vnc-server-port : The Port number of the VNC server you wish to point to; Format: 5900+[display-number]
    ```console
    websockify -D --web=[/path/to/novnc] [websocket-server-port] [vnc-server-ip (localhost=127.0.0.1)]:[vnc-server-port]
    ```

### GUI applications
- Now that you are inside the X virtual framebuffer, you can run commands and startup GUI applications from the tty and it would draw on the virtual framebuffer 
    + which is, at this stage, currently drawn in the background that can be viewed from a VNC instance

- To run the GUI applications from the tty and still hold control of the tty
    + Use the '&' keyword
    ```console
    [GUI] &
    ```

## Documentation

### Synopsis/Syntax
- Xvfb
    ```console
    Xvfb [positionals] {optionals} <arguments>
    ``` 

### Parameters
- Positionals
    - display-number : Specify the virtual display you wish to run on so that a VNC server knows what display to use (i.e. ':6')
        - Type: String
        - Example:
            + `:6` : Display 6
- Optionals
    - `-screen {screen-number} {resolution}` : Specify the screen specifications such as the screen number and resolution (screen size)
        - Screen Specifications
            - screen-number : The screen that the Virtual Framebuffer should point at
                + Type: Integer (Number)
                + Default: 0 (Screen 1)
            - resolution : This is the screen size; it comes in the format of [width, height, bit(rate/map)]
                - Format
                    + width: The horizontal length of the screen/display; i.e. (1920, 1024)
                    + height: The vertical height of the screen/display; i.e. (1080, 768)
                    + bitmap/bitrate: The supported color depth/density of the display/fonts to use; i.e. 32 (32-bit), 16 (16-bit)

### After Xvfb is up
- To see the list of background commands (like other Xvfb instances)
    + Use 'jobs'
    ```console
    jobs -l
    ```

- To verify that your processes/ports are running
    - VNC server
        ```console
        netstat -tuln | grep 5900
        ```
    - Websocket server
        ```console
        netstat -tuln | grep 6080
        ```

- To verify process ID
    ```console
    process_ID=$(pgrep [application])
    echo -e "${process_ID}"
    ```

## Wiki
### Related
- Xorg Display Server
    + xinit
    + startx

### Recommendations
+ Run the Xvfb in tmux to allow multi-tty control

### Troubleshooting
- Application process unable to start
    - Possible Issues/Solution
        - Process is still running
            + Validate process ID
                ```console
                process_ID=$(pgrep [application])
                ```
            + Force kill if regular `kill $process_ID` does not work
                ```console
                if [[ ! -z "$process_ID" ]]; then
                    # Force kill
                    kill -9 ${process_ID}
                fi
                ```

- GUI applications are unable to be started
    - Possible Issues/Solution
        + '$DISPLAY' environment variable is not set to the target virtual display
            ```console
            export DISPLAY=:[display-number]
            ```

### Finding and Notes
- Using this, it might actually be possible to use this concept in docker and 
    - run GUI applications and using them via VNC servers within docker containers by 
        + starting them up in a Virtual Framebuffer environemnt (genericized to avoid dependency hell between Xorg and wayland)
        - Environment Setup
            + Setting environment variables as necessary
            + Setup pre-requisites as necessary
            + Startup background tty applications as necessary
            + Startup GUI applications as necessary
        + starting up a VNC server pointing to the Virtual Framebuffer environment
        + starting up a Websocket server pointing to the VNC server
        + Access the websocket URL to view the GUI application

- '$DISPLAY' environment variable 
    - The '$DISPLAY' environment variable is used in Linux to specify the current TTY/Terminal Console it is working on
        + To use a GUI application, you need to set the DISPLAY environment variable to point to the virtual monitor you wish to render the graphical environment on
        + This is also used by 'xinit' and 'startx' to run Graphical environments/applications on a host
    - To switch different Virtual Framebuffers 
        - Switch the Virtual 'DISPLAY' monitors
            ```console
            export DISPLAY=:[your-target-monitor]
            ```
        - This means that you can startup as many Virtual Framebuffers as you require (or indeed, as the system can handle)
            + And you just have to change the virtual display value

## Resources

## References
+ [Wikipedia - Xvfb](https://en.wikipedia.org/wiki/Xvfb)

## Remarks

