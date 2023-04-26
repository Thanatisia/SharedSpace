# TigerVNC VNC server setup guide

## Information
- packages
    + tigervnc
- commands
    + vncpasswd : Change your VNC server's password
    + vncserver : Setup/connect a VNC instance
- repository and URLs
    + https://github.com/tigervnc/tigervnc
- Networking
    + Default Port Number (VNC): 5900
- Notes
    + With a VNC server, each display environment number used (i.e. DISPLAY=:1) corresponds to the port number used
    - i.e.
        > :n = 590(n)
        + :1 = 5901
        + :2 = 5902

## Setup
### Pre-Requisites

### Dependencies
- ArchLinux
    + tigervnc
- Debian
    + tigervnc-standalone-server
    + tigervnc-common

### Best Practices and TODO
```
Best practices and things to do after initial installation
```
+ Change VNC server password

### Post-Installation setup
1. Create [configuration directories and files](#configurations)
2. Create a VNC server password
    ```console
    vncpasswd
    ```
3. Edit '/etc/tigervnc/vnserver.users' to define the mapping of the user to a port number starting from '5900'
    + Please refer to [configurations](#configurations) for more information
    ```
    :1=[name]
    ```
4. Create '~/.vnc/config' to specify configurations to be used with the VNC server
    + Please refer to [configurations](#configurations) for more information
    - Minimum requirements
        + 'session=[display-environment]' to define the type of session to startup

## Documentations
### Synopsis/Syntax
- vncserver
    ```console
    vncserver {options} [$DISPLAY]
    ```

- vncpasswd
    ```console
    vncpasswd {options} <arguments>
    ```

### Parameters

### Usage
- Change Password
    ```console
    vncpasswd
    ```

- Basic startup
    + Using DISPLAY port 1, connect using vnc port 5901
    ```console
    vncserver :1
    ```

## Wiki

### Configurations
- User/Home Configurations
    - configuration directory: ~/.vnc
    - configuration files:
        - ~/.vnc
            + config : The VNC server primary configuration file; Place your vnc settings here
                - Key-Value Mappings
                    - session : Specify the Graphical Environment (aka 'Session') that you wish to execute on VNC connection startup
                        - Syntax
                            ```
                            session=[de/wm]
                            ```
                    - geometry : Specify the resolution/size of the VNC window
                        - Syntax
                            ```
                            geometry=[width]x[height]
                            ```
                - Options
                    + localhost
                    + alwaysshared
            + passwd : The hashed password created using 'vncpasswd' will be stored here
            + xstartup : The X server startup script used to startup the VNC server with

- Global Configurations
    - configuration directory: /etc/tigervnc
    - configuration files:
        - /etc/tigervnc
            + vncserver.users : Specify and map all port numbers to their respective users

### Init Systems/Startups
- systemd
	+ Service: x0vncserver.service

## Resources

## References
+ [ArchWiki - TigerVNC](https://wiki.archlinux.org/title/TigerVNC)
+ [YouTube - Kyle GP - TigerVNC Server in Manjaro (Arch Linux) - Headless Guide 2021](https://www.youtube.com/watch?v=w1HS_xVnFFo)

## Remarks

