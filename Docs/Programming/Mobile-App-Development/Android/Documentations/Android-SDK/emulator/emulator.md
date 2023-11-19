# Android SDK - Android Virtual Devices - aka Emulator

```
The emulator package, also used by Android Studio, is the official Android emulator CLI utility that is used to startup android emulators of various models, specifications based on the options provided.

Can be used for Debugging, development, testing, deployment checks, or just using it as a standalone android emulator for fun
```

## Information

### Search paths
- On startup, emulator will search for files in the following path order
    1. ANDROID_AVD_HOME
    2. ANDROID_HOME/avd
    3. HOME/.android/avd

## Setup
### Dependencies
- android-sdk
    + cmdline-tools

### Pre-Requisites
- Set Environment Variables
    - ANDROID_AVD_HOME : Set the Home/root directory of your AVD directory
        - Windows
            ```console
            SET ANDROID_AVD_HOME="path\to\home\.android"
            ```
        - Linux
            ```console
            ANDROID_AVD_HOME="/path/to/home/.android"
            ```
+ Installed Android SDK (Please refer to 'setup.md' in 'Android-SDK' folder or 'README.md' in 'Docs/Programming/Mobile-App-Development/Android/Project')
- Install Android SDK packages
    ```console
    sdkmanager "platforms;android-33" "build-tools;33.0.2"
    sdkmanager "extras;google;m2repository" "extras;android;m2repository"
    sdkmanager "platform-tools" "tools"
    sdkmanager --licenses
    ```
- Search for an AVD system image
    - Linux
        ```console
        sdkmanager --list | grep system-images
        ```
    - Windows
        ```console
        sdkmanager --list | findstr system-images
        ```

- Install the chosen system image
    - Explanation
        - image-platform-version : The target platform version of the image (i.e. android-[version])
    ```console
    sdkmanager "system-images;[image-platform-version];[image-repository];[architecture]"
    ```

- Create the Android Virtual Device (AVD)
    - Explanation
        - `-n device` : Specify AVD type
        - `--device [device-model]` : The model of the device of your choice
            - Device Models
                + pixel : Google Pixel
        - `-k [system-image-package]` : Specify the target system image to use to generate the Android Virtual Device (AVD)
            - Example
                + "system-images;[image-platform-version];[image-repository];[architecture]"
    ```console
    avdmanager create avd -n device --device [device-model] -k "[system-image-package]"
    ```

- List available Virtual Devices
    ```console
    avdmanager list avd
    ```

### Installation
- Using sdkmanager
    ```console
    sdkmanager emulator
    ```

## Documentation
### Synopsis/Syntax
```console
emulator {options} <arguments>
```

### Parameters
- Positionals
- Optionals
    - With Arguments
        + `-avd [your-emulator-name]` : Explicitly specify the name of the Android Virtual Device/Emulator to startup
    - Flags
        + -list-avds : To see a valid list of emulators/avd

### Usage
- Starting up an android emulator
    - Explicitly specifying the avd device name
        - Using '@' operator
            ```console
            emulator @[avd-name]
            ```
        - Using '-avd'
            ```console
            emulator -avd [your-emulator-name]
            ```

## Wiki

### Terminologies
+ AVD : Android Virtual Device; aka Android Emulator

## Resources

## References

## Remarks
