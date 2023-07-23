# X Display Server - .xinitrc file

## Information
### Background
```
xinitrc : This is the X server initialization resource control (rc) file

Commonly seen as the '~/.xinitrc' file, this file is referenced when you want to startup a new xorg session using startx
    - i.e.
        startx ~/.xinitrc

The .xinitrc file is generally used alongside the '~/.xstartup' file and '~/.Xresources' file to handle/manage Resources on behalf of the x initialization file itself
```

### Project filesystem structure
- Locations
    + Home   Directory: ~/.xinitrc
    + Global Directory: /etc/X11/xinitrc

## Setup
### Dependencies
+ xorg-xinit

## Documentation
### Syntax/Synopsis Format
```console
#!/bin/env bash

## x-related one-time startup statements here
```

## Wiki
### Snippets and Examples
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

## Customization and Configuration

## Resources
+ [Karl Runge - x11vnc - Tunneling](http://www.karlrunge.com/x11vnc/index.html#tunnelling)
+ [ArchBBS - startx over SSH? (not VNC!)](https://bbs.archlinux.org/viewtopic.php?id=241097)

## References
+ [ArchWiki - x11vnc](https://wiki.archlinux.org/title/x11vnc)

## Remarks