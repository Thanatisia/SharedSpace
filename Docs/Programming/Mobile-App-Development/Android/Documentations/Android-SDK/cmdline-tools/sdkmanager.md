# Android SDK - command line tools : sdkmanager

```
sdkmanager is the primary package manager for the Android SDK. This CLI utility is used to handle the installation, uninstallation and management of Android SDK packages, modules and related components.
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
sdkmanager {options}=<arguments> ["installables" ...]
```

### Parameters
- Positionals
    - installables : Specify all packages/modules/systems/etc to be installed; Please separate all specifications with a space delimiter
        - Packages
            + cmdline-tools : Android SDK Command Line Tools
            + platform-tools : Android SDK Platform/System Tools
            + tools : Android SDK tools
            + emulator : Android Emulators
            + `build-tools;[version]` : The Android SDK build tools for the particular version/platform version
            + `system-images;[platform-version];[repository];[architecture]` : Install Android System Images for the AVD/Emulators
- Optionals
    - With Arguments
        + `--sdk_root=[android-sdk-path]` : Explicitly specify the path of the Android SDK directory to set as the Android SDK root/home directory
    - Flags
        + --list : List all packages available in the repository
        + --list_installed : List all packages installed

### Usage
- To set the path of the Android SDK directory
    ```console
    sdkmanager --sdk_root=[android-sdk-path]
    ```

- To list all packages in the repository
    ```console
    sdkmanager --list
    ```

- To list all packages installed
    ```console
    sdkmanager --list_installed
    ```

- To install system images
    ```console
    sdkmanager system-images;[platform-version];[repository];[architecture]
    ```

- To install build tools
    ```console
    sdkmanager build-tools;[platform-version]
    ```

## Wiki

### Troubleshooting
#### sdkmanager
- Error: Could not determine SDK root
    - Possible Issues
        + the 'ANDROID_HOME' or 'ANDROID_SDK_ROOT' (Deprecated) environment variable is not set as the SDK root
    - Solutions
        - Use '--sdk_root=[android-sdk-root-directory]' to explicitly specify the Android SDK root directory
            ```console
            sdkmanager --sdk_root=[android-sdk-root-directory] [action]
            ```

- Error: Cannot launch AVD in emulator: QT library not found
    - Possible Issues
        + QEMU emulator/QT library cannot be found
    - Solutions
        - Ensure that the following 3 locations are in the system path (PATH)
            + ANDROID_HOME/emulator
            + ANDROID_HOME/tools
            + ANDROID_HOME/platform-tools 
            + ANDROID_HOME/cmdline-tools/latest/bin"
        - Temporary Solution: Startup the emulator from the 'ANDROID_HOME/tools' directory directly
            - Windows
                ```console
                cd %ANDROID_HOME%\tools && \
                emulator @[avd_device_name]
                ```
            - Linux
                ```bash
                cd $ANDROID_HOME/tools && \
                emulator @[avd_device_name]
                ```

## Resources

## References

## Remarks
