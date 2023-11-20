# Android SDK - command line tools : avdmanager

```
avdmanager is the Android Virtual Device (AVD) manager CLI utility. Part of the Android SDK, avdmanager is used to manage AVD (emulators) devices such as
- Creating devices
- Listing devices
```

## Setup
### Dependencies
- android-sdk
    + cmdline-tools

### Pre-Requisites
+ Installed Android SDK (Please refer to 'setup.md' in 'Android-SDK' folder or 'README.md' in 'Docs/Programming/Mobile-App-Development/Android/Project')
+ Expected Location: '[android-sdk]/cmdline-tools/latest'

## Documentations

### Synopsis/Syntax
```console
avdmanager [action] {options} <arguments>
```

### Parameters
- Positionals
    - actions : Actions to be executed by the AVD manager
        - `create [type] {options} <arguments>` : Create a new Android Virtual Device (AVD)
            - Types
                + avd : List available Android Virtual Devices
            - Options
                - `-n [avd-name]` : Specify name of the AVD to be created
                - `--device [device-model]` : The model of the device of your choice
                    - Device Models
                        + pixel : Google Pixel
                - `-k [system-image-package]` : Specify the target system image to use to generate the Android Virtual Device (AVD)
                    - Example
                        + "system-images;[image-platform-version];[image-repository];[architecture]"
        - `list [type]` : List virtual devices
            - Types
                + avd : List available Android Virtual Devices
- Optionals
    - With Arguments
    - Flags

### Usage
- Create the Android Virtual Device (AVD)
    ```console
    avdmanager create avd -n [avd-name] --device [device-model] -k "[system-image-package]"
    ```

- List available Virtual Devices
    ```console
    avdmanager list avd
    ```

## Wiki
### Terminologies
+ AVD : Android Virtual Device; aka Android Emulators

## Resources

## References

## Remarks
