# Start Android emulator headlessly via VNC server

## Setup
### Dependencies
- Android SDK
     - cmdline-tools
         + avdmanager
     + emulator
- VNC server
- WebSocket server
     + websockify
- Web/Browser-based VNC client
     + NoVNC

### Pre-Requisites

### Table of Contents
+ [Prepare Environment Variables](#prepare-environment-variables)
+ [Create the Emulator/Android Virtual Device (AVD)](#create-avd)
+ [Start VNC Server](#start-vnc-server)
+ [Startup](#startup)

## Steps

### Prepare Environment Variables
- Use the environmental variable 'DISPLAY' to make emulator-headless render the graphics into virtual display that one will create with some another VNC server
    ```console
    export DISPLAY=:[display-monitor-number]
    ```

### Create AVD
```console
echo 'no' | avdmanager create avd --force --name android-28-x86 --abi google_apis_playstore/x86 --package 'system-images;android-28;google_apis_playstore;x86'
```

### Headless
- In a Virtual Framebuffer
    - Using Xvfb
        ```console
        Xvfb :[display-monitor-number] -screen [screen] [resolution ([width]x[height]x[color-depth/bitrate])] &
        ```

### Start VNC server
- Using Xtigervnc
    ```console
    vncserver :[display-monitor-number] -geometry 1080x1920 -depth 24
    ```

- Using x11vnc
    ```console
    x11vnc -display :[display-monitor-number] -rfbport [custom-remote-vnc-server-port-number] -nopw -xkb -forever -bg
    ```

### Startup
- Startup Emulator without display
    - Explanation
        - Parameters
            - Positionals
                + avd-name : Name of emulator device/Android Virtual Device
            - Optionals
                - With Arguments
                    - `-gpu [renderer]` : Specify the GPU/display rendering method
                        - GPU
                            + swiftshader_indirect : Disables VNC
                    + `-memory [RAM]` : Specify memory/RAM (in MB) to provide
                    - `-skin [resolution]` : Specify Skin specifications (i.e. resolution) of the emulated device
                        - Formats: 
                            + resolution : The screen size; [width]x[height]
                - Flags
                    + -no-audio : No Audio
                    + -no-boot-anim : Disables Boot Animation
                    + -no-snapshot : No Snapshots; Basically wipes the emulator in clean slate on exit 
                    + -no-window : Shuts down the display of the emulator
                    + -verbose : Display more information
                    + -wipe-data : Deletes all data on exit
        - The important components are
            + Setting the 'DISPLAY' environment variable to the virtual display/monitor to display the VNC server
            + vnc-server : This allows you to access and display the application in the 'DISPLAY' environment variable
        - Optional components
            + -no-window : You can remove this if you are using Xvfb; This disables the displaying of the emulator, enabling the headless startup
    ```console
    emulator @[avd-name] -verbose -memory 2048 -no-audio -no-snapshot -wipe-data -no-boot-anim -skin 768x1280
    ```

## Wiki

## Troubleshooting
### Errors
- When starting up with Xvfb
    - Error: Emulator is running using nested virtualization
        - Cause: You are running the Android SDK emulator within a Virtual Environment which would affect the graphical rendering capabilities of the application
        - Solutions
            + Run Xvfb and the application from a host machine

## Resources

## References
+ [StackOverflow - Questions - 57082659 - Connect to Android Emulator in a Docker Container through VNC (error with API 28)](https://stackoverflow.com/questions/57082769/connect-to-android-emulator-in-a-docker-container-through-vnc-error-with-api-28/57651203#57651203)
+ [StackOverflow - Questions - 12992289 - How to use Android emulator via VNC](https://stackoverflow.com/questions/12992289/how-to-use-android-emulator-via-vnc)

## Remarks

