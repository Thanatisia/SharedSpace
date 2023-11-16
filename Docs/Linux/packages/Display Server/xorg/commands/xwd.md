# X Window Dumping utility

## Information
### Background
```
Allows X Display Server users to store window images in a specifically formatted dump file
```

## Setup
### Dependencies
### Pre-Requisites

## Documentations
### Synopsis/Syntax
```console
xwd {options} <arguments>
```
### Parameters
- Positionals
- Optionals
     - With Arguments
        + `-display :[display-number]` : Explicitly specify the display to dump
        + `-out [output-screen-dump-file]` : Explicitly specify the output file name
     - Flags
        + `-root` : Dump the root window
### Usage
- Obtaining custom X11 window dump file
    - Pre-Requisites and Dependencies
        + xwd
        - Create directory to store framebuffer directory
            ```console
            mkdir -p [framebuffer-directory]
            ```
    - Dump X11 Window framebuffer file
        ```console
        xwd -root > [framebuffer-directory]/output_screen_file
        ```
    - Visualize X11 Window file
        ```console
        xwud -in directory/screen_output_file
        ```

## Wiki

## Resources
+ [xwd](https://www.commandlinux.com/man-page/man1/xwd.1.html)
+ [xwud](https://linux.die.net/man/1/xwud)

## References

## Remarks
