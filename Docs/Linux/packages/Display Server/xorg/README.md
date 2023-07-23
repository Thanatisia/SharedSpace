# Display Server: X11

## Information
### Background
```
The X11 (aka Xorg) Display Server <tbc>
```

### Package
+ Package Author: 
+ Package Name: 
+ Repository URL: 

### Project filesystem structure
- Folders
    - /etc/X11/ : The X11 display server general directory
        + xorg.conf.d : The xorg configurations directory
- Files
    + /etc/X11/xorg.conf.d/10-headless.conf : Headless configuration file

## Setup
### Dependencies
- xorg : The xorg X11 display server package
    + xorg-xinit : The X initialization package to start from the tty
+ startx : To start from the tty

### Pre-Requisites
+ Prepare your [.xinitrc file](Configurations/xinitrc.md)
- If you are running an Headless VNC server and/or VM server
    + Prepare [headless](Configurations/setup-headless.md)

## Documentations

## Wiki

## Resources

## References

## Remarks