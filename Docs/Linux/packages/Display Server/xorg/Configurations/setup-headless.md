# Xorg - Headless Configuration

```
To prepare and setup Xorg display server to work in a headless environment like RDP, VNC
```

## Information
### Purpose
```
When accessing a display server like xorg through a headless system (monitor-less), 
you may need to setup X to run headless
```

### Project filesystem structure
- Folders
    - /etc/X11/ : The X11 display server general directory
        + xorg.conf.d : The xorg configurations directory
- Files
    + /etc/X11/xorg.conf.d/10-headless.conf : Headless configuration file

## Setup
### Dependencies
+ xf86-video-dummy

### Pre-Requisites
- Create configuration file in '/etc/X11/xorg.conf.d/10-headless.conf'
    ```
    Section "Monitor"
        Identifier "dummy_monitor"
        HorizSync 28.0-80.0
        VertRefresh 48.0-75.0
        Modeline "1920x1080" 172.80 1920 2040 2248 2576 1080 1081 1084 1118
    EndSection

    Section "Device"
        Identifier "dummy_card"
        VideoRam 256000
        Driver "dummy"
    EndSection

    Section "Screen"
        Identifier "dummy_screen"
        Device "dummy_card"
        Monitor "dummy_monitor"
        SubSection "Display"
        EndSubSection
    EndSection
    ```

## Documentations

## Wiki
### Snippets and Examples

## Configurations and Customization
- Sections
    + Monitor : This section describes your monitor settings (i.e resolution, framerate)
    + Device  : This section describes your device video settings (i.e. video ram, driver)
    + Screen  : This section describes your screens within the monitor (i.e. screen-1, screen-2 etc)

## Resources

## References
+ [ArchWiki - x11vnc](https://wiki.archlinux.org/title/x11vnc)
+ [ArchWiki - Xorg - Monitor Settings](https://wiki.archlinux.org/title/Xorg#Monitor_settings)

## Remarks