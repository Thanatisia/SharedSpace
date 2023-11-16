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
        + `-auth [.Xauthority-file-path]`    : Explicitly specify the filepath to the target .Xauthority file to use
        + `-display [display-port-number]`   : Specify your $DISPLAY port number (i.e. :n); This display number defines what VNC port number it is mapped to (5900 + display-port-number); Default= :0 = 5900
        + `-env [env-variable-name]=[value]` : Explicitly invoke/specify environment variables to parse into the environment on startup; Repeat for every environment variable to parse into the session
        + `-gone [command-to-execute]`       : Explicitly specify the command to execute after x11vnc is closed.
        + `-listen [platform]`               : Enable listening of the specified platform
            - Platforms 
                + localhost: This option ensures that the VNC server only listens on the localhost interface for added security
        + `-o [output-log-file-path]`        : Specify x11vnc logfile output filepath (i.e. /var/log/x11vnc.log)
        + `-passwd [your-password]`          : Explicitly specify the password to authenticate the port number connection
        + `-rfbport [vnc-port-number]`       : This option is used to explicitly specify the VNC port you wish to point to; This allows you to match the display number to the VNC port you wish to use (i.e. :1 => 5901, :2 => 5902)
        + `-wait [seconds]`                  : Wait for the specified number of seconds before allowing connections
    - Flags
        + -bg        : Run in the background
        + -create    : Makes x11vnc automatically start an X Virtual Framebuffer instance
        + -forever   : Keep the VNC server port instance running even after connected VNC client disconnects; Similar to '-many'
        + -localhost : Bind to the local interface
        + -loop      : Restart the server once the session is finished (client connection is closed)
        + -many      : Allow many uses to the current instance; Keep the VNC server port instance running even after connected VNC client disconnects; Similar to '-forever'
        + -nopw      : This flag specifies that no password is required for VNC access for simplicity; You can add security as required
        + -noxdamage : Do not use the X DAMAGE extension to detect framebuffer changes even if it is available; Use '-xdamage' to enable it
        + -once      : Exit after the first successfully connected viewer disconnects, opposite of -forever. This is the Default.
        + -shared    : VNC  display is shared, i.e. more than one viewer can connect at the same time (default off).
        + -usepw     : Similar to vncpasswd in tigervnc; Uses the password found in '~/.vnc/passwd' or '~/.vnc/passwdfile'; If the files cannot be located, it will prompt the user for a password and it will save into '~/.vnc/passwd' and is used straight away
        + -xkb       : This flag ensures that the XKB extension is used

### Usage
- Just start X
    ```console
    x11vnc -display :0 -auth ~/.Xauthority
    ```

- Start VNC using a custom VNC port number
    ```console
    x11vnc -display :6 -rfbport 5906 -nopw -xkb -forever -bg
    ```

- Automatically start VNC server with X Virtual Framebuffer (Xvfb) using a one-liner for Headless Graphical Environment
    - Explanations
        + `-display :[display-number]`                : Explicitly specify display number to map to
        + -create                                     : Makes the VNC server start the X Virtual Framebuffer (Xvfb) automatically on startup
        + `-env FD_PROG=/usr/bin/[application]`       : Set the Environment Variable value 'FD_PROG=/usr/bin/[application]' which will make the VNC server startup the specified application
        + `-env X11VNC_FINDDISPLAY_ALWAYS_FAIL=1`     : Set the Environment Variable value 'X11VNC_FINDDISPLAY_ALWAYS_FAIL=1' which will make the VNC server go to the created Xvfb session (i.e. Display ':1' instead of ':0' which will be the normal desktop)
        + `-env X11VNC_CREATE_GEOM=${1:-1024x768x16}` : Set the Environment Variable value 'X11VNC_CREATE_GEOM=${1:-[resolution]}' which will set the screen to the resolution and color density in the following format ([width]x[height]x[color-density-bitrate])
        + `-gone 'killall Xvfb'`                      : Cleans up when it exits; To be used with '-create' as otherwise, Xvfb is left behind (killing Xvfb will kill all graphical applications as well)
        - Optionals
            + -nopw 
            + -xkb 
            + -forever 
            + -bg
    ```console
    x11vnc -display :[display-number] -create -env FD_PROG=/usr/bin/[application] -env X11VNC_FINDDISPLAY_ALWAYS_FAIL=1 -env X11VNC_CREATE_GEOM=${1:-1024x768x16} -gone 'killall Xvfb' -nopw -xkb -forever -bg
    ```

- Start VNC server with password input support
    - Note
        + Websocket servers (like Websockify) and Web/Browser-based VNC clients will communicate with the VNC server to check if password input is necessary
    ```console
    x11vnc -display :[display-number] {other-options} -usepw -xkb -forever -bg
    ```

- Invoke and parse environment variables on startup
    ```console
    x11vnc -display :[display-number] {other-options} -env [ENVIRONMENT_VARIABLE_NAME]=[ENVIRONMENT_VARIABLE_VALUE]
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
### Environment Variables
+ `FD_PROG=/usr/bin/[application]`   : File Director program; Set this to be the full parth of the session/window manager program to startup if starting up with X Virtual Framebuffer (Xvfb)
+ `X11VNC_FINDDISPLAY_ALWAYS_FAIL=1` : Make the VNC server go to the created Xvfb session (i.e. Display ':1' instead of ':0' which will be the normal desktop)
+ `X11VNC_CREATE_GEOM=${1:-[resolution]}` : Set the screen to the resolution and color density in the following format ([width]x[height]x[color-density-bitrate])

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
+ [linux man - x11vnc](https://linux.die.net/man/1/x11vnc)
+ [StackOverflow - Questions - 12050021 - How to make Xvfb display visible](https://stackoverflow.com/questions/12050021/how-to-make-xvfb-display-visible)
+ [AskUbuntu - Questions - 817970 - How to setup multiple simultaneous access to x11vnc session](https://askubuntu.com/questions/817970/how-to-setup-multiple-simultaneous-access-to-x11vnc-session)

## Remarks
