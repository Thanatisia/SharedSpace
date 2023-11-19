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
- Optionals
    - With Arguments
        + `--sdk_root=[android-sdk-path]` : Explicitly specify the path of the Android SDK directory to set as the Android SDK root/home directory
    - Flags

### Usage
- To set the path of the Android SDK directory
    ```console
    sdkmanager --sdk_root=[android-sdk-path]
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

## Resources

## References

## Remarks
