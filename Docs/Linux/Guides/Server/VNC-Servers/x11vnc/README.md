# Linux VNC server - x11vnc

## Information
### Package
- Package Author(s):
    + Default: Karl Runge
    + Current: LibVNC
+ Package Name: x11vnc
+ Repository URL: https://github.com/LibVNC/x11vnc

### Project filesystem structure
- Folders
    + /etc/X11/

### Background
```
Similar to TigerVNC, x11vnc is a VNC server.

It allows one to view remotely and interact with real X displays (i.e. a display corresponding to a physical monitor, keyboard and mouse using the X11 display server) with any VNC viewers

Currently, LibVNC and the GitHub community have taken over the development.
```

## Basics
### Remote Desktop Protocol
```
The Remote Desktop Protocol created by Microsoft to allow usage of a target computer's graphical environment on another device through the network. 
The Linux-equivalent of the RDP is VNC
```

## Setup
### Dependencies
- Build/Make/Development Essentials
    - Using package managers
        + apt-based
            ```console
            sudo apt install build-essential
            ```
        + pacman-based
            ```console
            sudo pacman -Sy base-devel
            ```
+ make
+ git
+ autoreconf
+ automake
+ autotool

### Pre-Requisites
- Prepare and configuration your '~/.xinitrc' file
    - Refer to [Customization and Configuration](#customization-and-configuration) for examples

- Startup X server using either
    - startx
        ```console
        startx ~/.xinitrc
        ```

- (OPTIONAL) Enable firewall and allow INCOMING destination port 5900
    ```console
    sudo iptables -I INPUT -p tcp --dport 5900 -j ACCEPT
    sudo iptables -I INPUT -p udp --dport 5900 -j ACCEPT
    ```

### Installation
- install the x11vnc package 
    - using Package Manager
        - apt-based
            ```console
            sudo apt install x11vnc
            ```
        - pacman-based
            ```console
            sudo pacman -S x11vnc
            ```

### Build from Source
- Clone project repository
    ```console
    git clone https://github.com/LibVNC/x11vnc
    ```

- Change directory into repository
    ```console
    cd x11vnc
    ```

- Generate the build system
    ```console
    autoreconf -fiv
    ```

- Configure build
    + You can take a look at the different configuration options provided by `configure --help` to build without X11 or adapt the build to your needs in other ways
    ```console
    ./configure {CONFIGURE_OPTIONS}
    ```

- Make/Build/Compile source codes
    ```console
    make
    ```

- Clean up temporary files generated during compilation
    ```console
    make clean
    ```

- Install/Copy compiled files to system
    ```console
    sudo make install
    ```

- Uninstall/Remove installed files from system
    ```console
    sudo make uninstall
    ```

### Connection and Accessing
- Accessing VNC server
    - Get a VNC client
        + Type in the IP address of the server
        + Type in the port number of the VNC display port (i.e. 5900=:0, 5901=:1,...,590N=:N)
        + Hit Connect

## Documentations
### Synopsis/Syntax
```console
x11vnc {options} <values>
```

### Parameters
- Optionals
    - With Arguments
        + -auth [.Xauthority-file-path]  : Explicitly specify the filepath to the target .Xauthority file to use
        + -display [display-port-number] : Specify your $DISPLAY port number (i.e. :n); This display number defines what VNC port number it is mapped to (5900 + display-port-number); Default= :0 = 5900
        + -passwd [your-password]        : Explicitly specify the password to authenticate the port number connection
        + -o [output-log-file-path]      : Specify x11vnc logfile output filepath (i.e. /var/log/x11vnc.log)
        + -wait [seconds]                : Wait for the specified number of seconds before allowing connections
    - Flags
        + -bg        : Run in the background
        + -forever   : Keep the VNC server port instance running even after connected VNC client disconnects; Similar to '-many'
        + -localhost : Bind to the local interface
        + -loop      : Restart the server once the session is finished (client connection is closed)
        + -many      : Allow many uses to the current instance; Keep the VNC server port instance running even after connected VNC client disconnects; Similar to '-forever'
        + -noxdamage : Do not use the X DAMAGE extension to detect framebuffer changes even if it is available; Use '-xdamage' to enable it
        + -usepw     : Similar to vncpasswd in tigervnc; Uses the password found in '~/.vnc/passwd' or '~/.vnc/passwdfile'; If the files cannot be located, it will prompt the user for a password and it will save into '~/.vnc/passwd' and is used straight away

### Usage
- Just start X
    ```console
    x11vnc -display :0 -auth ~/.Xauthority
    ```

- SSH Tunnel
    - Pre-Requisites
        + Installed 'ssh' and configured
    - Notes
        + Use the '-localhost' flag with x11vnc for it to bind to the local interface
    - SSH Tunneling
        + Connect to VNC through SSH
    ```console
    ssh -t -L 5900:localhost:5900 [remote_host] 'x11vnc -localhost -display :0'
    ```

## Wiki
### Snippets and Examples
- To start up x11vnc in the background 
    - with explicitly-specified password
        ```console
        x11vnc --wait 50 --noxdamage -display :[display-port-number (default: 0)] -forever -o /var/log/x11vnc.log -passwd [your-password] -bg
        ```
    - with Xauthority
        ```console
        x11vnc --wait 50 --noxdamage -display :[display-port-number (default: 0)] -forever -o /var/log/x11vnc.log -auth ~/.Xauthority -bg
        ```

## Customization and Configuration
- Files
    - xinitrc : This is the X server initialization resource control (rc) file
        - Locations
            + Home   Directory: ~/.xinitrc
            + Global Directory: /etc/X11/xinitrc
        - Syntax/Synopsis Format
            ```console
            #!/bin/env bash

            ## x-related one-time startup statements here
            ```
        - Examples
            - Check if TTY $DISPLAY is 1 (to avoid duplicate)
                ```console
                if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
                    exec startx
                fi
                ```
            - Session Management
                ```console
                #!/bin/env bash

                # Graphical Rendering (X-related operations)
                xrandr -s [width]x[height]

                # Session Management
                session=${1:-[default de/wm session]}
                case "$session" in
                    ## Window Manager Example
                    "bspwm")
                        exec bspwm
                        ;;
                    ## Desktop Environment Example
                    "kde")
                        exec startkde
                        ;;
                    *)
                        # No known sessions, try to run it as a command
                        exec $1
                        ;;
                esac
                ```

## Resources
+ [Karl Runge - x11vnc - Tunneling](http://www.karlrunge.com/x11vnc/index.html#tunnelling)
+ [ArchBBS - startx over SSH? (not VNC!)](https://bbs.archlinux.org/viewtopic.php?id=241097)

## References
+ [ArchWiki - x11vnc](https://wiki.archlinux.org/title/x11vnc)

## Remarks