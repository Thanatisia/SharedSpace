# Dotnet - Installation and setup

## Information
### Project
+ Dotnet website: https://dotnet.microsoft.com/en-us/download
- Repositories
    - GitHub:
        + [dotnet/dotnet - Dotnet source code](https://github.com/dotnet/dotnet)
        + [dotnet/source-build - Build dotnet from source](https://github.com/dotnet/source-build)

## Platforms

### Linux

#### Manual Installation

> Install multiple versions through manual installation

- Notes
    + [dotnet-install.sh Documentation](https://docs.microsoft.com/en-us/dotnet/core/tools/dotnet-install-script)

- Using the '[dotnet-install.sh](https://dot.net/v1/dotnet-install.sh)' file
    - Download 'dotnet-install.sh'
        ```bash
        wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh
        ```
    - Change permission of script to be executable
        ```bash
        chmod u+x ./dotnet-install.sh
        ```
    - Install the version
        - Synopsis/Syntax
            ```bash
            ./dotnet-install.sh --install-dir [installation-directory (default: /usr/share/dotnet)] --channel [install-channel] --version [target-version (default: latest)]
            ```
        - Parameters
            - `--install-dir [installation-directory]` : Specify the custom installation directory path
                + Type: String
                + Default: /usr/share/dotnet
            - `--channel [installation-channel]` : Specify the target installation channel to install from
                + Type: String
                + Default: LTS (Long Term Support)
                - Supported Channels
                    + LTS : Long Term Support (Default)
                    + STS : Standard Term Support
            - `--version [target-sdk-version]` : Specify the target SDK version to install
                + Type: String
                - Special Version Keywords
                    + latest : Install the latest
            - `--runtime [runtime-type]` : Explicitly specify the runtime to install
                + Type: String
                - Runtime Variants
                    + default: SDK
                    + aspnetcore : Installs .NET Runtime
        - Usage
            - Install the latest version found in the "STS (Standard term Support)" channel in `/usr/share/dotnet`
                ```bash
                ./dotnet-install.sh --install-dir /usr/share/dotnet --channel STS --version latest
                ```

- Using manual downloading
    - Notes
        + You can install more than one version of .NET in the same folder.
    + Download the dotnet SDK tarball archive from `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-<version>-linux-x64-binaries`
    - Set Environment Variables
        - DOTNET_ROOT : Set to Dotnet's installation/root path; Makes the .NET CLI commands available in the terminal
            - Explanation
                + This folder, similar to Android's `ANDROID_SDK_ROOT | ANDROID_HOME` directory, contains the root of the dotnet SDK
            ```bash
            export DOTNET_ROOT="$HOME/.dotnet"
            ```
        - DOTNET_FILE : Set this to the filename of the .NET binary tarball archive you downloaded
            + This file is extracted to the `DOTNET_ROOT` directory
            ```bash
            export DOTNET_FILE=dotnet-sdk-<version>-linux-<architecture>.tar.gz
            ```
    - Create working directory
        ```bash
        mkdir -pv "$DOTNET_ROOT"
        ```
    - Extract the tarball archive into 'DOTNET_ROOT'
        ```bash
        tar -xvzf "$DOTNET_FILE" -C "$DOTNET_ROOT"
        ```
    - (Optional) Install Dotnet to the home directory by setting to the 'DOTNET_ROOT' environment variable
        ```bash
        export DOTNET_ROOT=$HOME/.dotnet
        ```

- Verify the SDKs are available
    ```bash
    dotnet --list-sdks
    ```

> Uninstall manually installed versions

- List all installed SDKs
    ```bash
    dotnet --list-sdks
    ```

- Set environment variables of the SDK you want to uninstall
    - Set the target SDK version you want to uninstall
        ```bash
        SDK_VERSION="<target-version>"
        ```
    - Set the installation path containing the Dotnet SDK you want to uninstall
        ```bash
        DOTNET_UNINSTALL_PATH="<target-sdk-path>"
        ```

- Remove/Delete installation folder
    ```bash
    rm -rf $DOTNET_UNINSTALL_PATH/sdk/$SDK_VERSION
    ```

> Completely uninstall Dotnet

- Notes
    - This includes
        + SDK
        + Host
        + Shared

- Set environment variables of the SDK you want to uninstall
    - Set the target SDK version you want to uninstall
        ```bash
        SDK_VERSION="<target-dotnet-sdk-version>"
        ```
    - Set the target dotnet version you want to uninstall
        ```bash
        DOTNET_VERSION="<target-dotnet-version>"
        ```
    - Set the installation path containing the Dotnet SDK you want to uninstall
        ```bash
        DOTNET_UNINSTALL_PATH="<target-dotnet-installation-path (i.e. /usr/share/dotnet)>"
        ```

- Remove/Delete installation folder
    ```bash
    rm -rf $DOTNET_UNINSTALL_PATH/sdk/$SDK_VERSION
    rm -rf $DOTNET_UNINSTALL_PATH/shared/Microsoft.NETCore.App/$DOTNET_VERSION
    rm -rf $DOTNET_UNINSTALL_PATH/shared/Microsoft.AspNetCore.All/$DOTNET_VERSION
    rm -rf $DOTNET_UNINSTALL_PATH/shared/Microsoft.AspNetCore.App/$DOTNET_VERSION
    rm -rf $DOTNET_UNINSTALL_PATH/host/fxr/$DOTNET_VERSION
    ```

#### ArchLinux

> Update the package manager's repositories list and Upgrade all installed packages

```bash
pacman -Syu
```

> Install dotnet sdk

- Explanation
    + To build applications with Dotnet/C# applications

```bash
pacman -S dotnet-sdk
```

> (Optional) Install the dotnet Dotnet core runtime

- Explanation
    + If you only want to run .NET managed applications,

```bash
pacman -S dotnet-runtime
```

> (Optional) Install the dotnet ASP.NET core runtime

- Explanation
    + To build dynamic web sites, applications, and services using ASP.NET Core

```bash
pacman -S aspnet-runtime
```

#### Debian

> Install microsoft's production key for the dpkg package manager

```bash
wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
```

> Update the apt package manager's repositories list and Upgrade all installed packages

```bash
sudo apt update && sudo apt upgrade
```

> Install Dependencies and dotnet sdk

- Explanation
    + The .NET SDK allows you to develop apps with .NET. 
    + If you install the .NET SDK, you don't need to install the corresponding runtime

```bash
sudo apt install git dotnet-sdk-[version]
```

> (Optional) Install the dotnet ASP.NET core runtime

- Explanation
    + The ASP.NET Core Runtime allows you to run apps that were made with .NET that didn't provide the runtime. 
    + This is used for ASP.NET web development or anything requiring ASP.NET/ASPX

```bash
sudo apt install aspnetcore-runtime
```

### Windows

> Install Dotnet SDK

- Using wget
    + Go to [Microsoft DotNet](https://dotnet.microsoft.com/en-us/download/dotnet)
    - Installer
        - Download the latest SDK 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-<version>-windows-<platform|architecture>-installer`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-<version>-windows-x64-installer`
    - Binaries
        - Download the latest SDK 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-<version>-windows-x64-binaries`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/sdk-<version>-windows-x64-binaries`

- Using winget
    ```bash
    winget install Microsoft.DotNet.SDK.8
    ```

> Install Dotnet Desktop Runtime

- Using wget
    - Installer
        - Download the latest release 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-<version>-windows-x64-installer`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from: https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-desktop-<version>-windows-x64-installer

- Using winget
    ```bash
    winget install Microsoft.DotNet.DesktopRuntime.8
    ```

> Install Dotnet Runtime

- Using wget
    - Installer
        - Download the latest release 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-<version>-windows-x64-installer`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from: https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-<version>-windows-x64-installer
    - Binaries
        - Download the latest release 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-<version>-windows-x64-binaries`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from: https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-<version>-windows-x64-binaries

- Using winget
    ```bash
    winget install Microsoft.DotNet.Runtime.8
    ```

> Install ASP.NET Core Runtime

- Using wget
    - Installer
        - Download the latest release 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-<version>-windows-x64-installer`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from: https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-<version>-windows-x64-installer
    - Binaries
        - Download the latest release 
            + URL: `https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-<version>-windows-x64-binaries`
            - Architectures
                + x86
                + x64
                + Arm64
            + Download from: https://dotnet.microsoft.com/en-us/download/dotnet/thank-you/runtime-aspnetcore-<version>-windows-x64-binaries

- Using winget
    ```bash
    winget install Microsoft.DotNet.AspNetCore.8
    ```

## Post-Installation Setup
### System Environment

> Set Environment Variables

- DOTNET_ROOT : Set to Dotnet's installation/root path; Makes the .NET CLI commands available in the terminal
    - Explanation
        + This folder, similar to Android's `ANDROID_SDK_ROOT | ANDROID_HOME` directory, contains the root of the dotnet SDK
    ```bash
    export DOTNET_ROOT="$HOME/.dotnet"
    ```

- PATH
    + Add the '~/.dotnet/tools' (your DOTNET_ROOT) folder
    ```bash
    export PATH+=":$DOTNET_ROOT/tools"
    ```

## Resources

## References 
+ [ArchWiki - .NET](https://wiki.archlinux.org/title/.NET)
+ [GitHub - dotnet/docs - core installation - debian](https://github.com/dotnet/docs/blob/main/docs/core/install/linux-debian.md)
+ [GitHub - dotnet/docs - core installation - debian post installation](https://github.com/dotnet/docs/blob/main/docs/core/install/includes/linux-install-80-apt.md)
+ [GitHub - dotnet/docs - core installation - linux scripted installation](https://github.com/dotnet/docs/blob/main/docs/core/install/linux-scripted-manual.md#scripted-install)
+ [GitHub - dotnet/docs - core installation - tutorials - Create a .NET console application using Visual Studio Code](https://github.com/dotnet/docs/blob/main/docs/core/tutorials/with-visual-studio-code.md)
+ [GitHub - dotnet/source-build - Build dotnet from source](https://github.com/dotnet/source-build)

## Remarks

