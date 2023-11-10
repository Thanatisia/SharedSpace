# X Virtual Framebuffer

## Information

## Setup
### Dependencies
+ Xorg : Display Server

### Pre-Requisites
- Export 'DISPLAY' environment variable to the virtual framebuffer display
    + This environment variable is important as 'DISPLAY' is used by display servers (Xorg, wayland etc) to specify what display to view on
    + By setting the $DISPLAY to the Xvfb display number, you can effectively switch between displays
    ```console
    export DISPLAY=":[display]"
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
    - With Arguments
        + `-fbdir [directory]` : Explicitly specify the Framebuffer directory to output the framebuffer screen file into; You can visualize the framebuffer file with 'xwud -in [framebuffer-directory]/Xvfb_screen0'
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
    - Flags

### Usage
- Startup a X virtual framebuffer instance in the background
    ```console
    Xvfb [display-number] -screen {screen-number (default: 0)} {resolution} &
    ```

- Basic Xorg Display Server headless startup
    - Startup Virtual Framebuffer
        ```console
        Xvfb :[display-number] &
        ```
    - Export DISPLAY environment variable to the display number
        ```console
        export DISPLAY=:[display-number]
        ```
    - Post-Setup
        - Ideas
            + Running in a VNC server for display
            + Running GUI applications headlessly for testing

- Obtaining custom X11 window dump file
    - Pre-Requisites and Dependencies
        + xwd
        - Create directory to store framebuffer directory
            ```console
            mkdir -p [framebuffer-directory]
            ```
    - Dump X11 Window framebuffer file
        - By running Xvfb with '-fbdir' option
            + This will output the framebuffer in file (i.e. '[framebuffer-directory]/Xvfb_screen0')
            ```console
            Xvfb -fbdir [framebuffer-directory]
            ```
        - By using xwd (Do not need to start Xvfb with '-fbdir')
            ```console
            xwd -root > [framebuffer-directory]/output_screen_file
            ```
    - Visualize X11 Window file
        ```console
        xwud -in directory/screen_output_file
        ```

## Wiki
### Related
+ [xwd](https://www.commandlinux.com/man-page/man1/xwd.1.html) : X Window Dumping utility; Allows X Display Server users to store window images in a specifically formatted dump file
+ [xwud](https://linux.die.net/man/1/xwud) : X Window Undumping utility; Allows X Display Server users to display in a window an image saved in a specifically formatted dump file (i.e. produced by wd)

## Resources

## References
+ [scivision - Xvfb (non-visible/virtual X11) on Headless Linux](https://www.scivision.dev/xvfb-on-windows-subsystem-for-linux/)

## Remarks

