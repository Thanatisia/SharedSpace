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

## Wiki


## Resources

## References

## Remarks

