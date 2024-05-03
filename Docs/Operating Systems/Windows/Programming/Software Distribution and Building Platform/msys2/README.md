# Software Distribution and Building Platforms for Windows: msys2

## Information
### Description
+ msys2 is a collection of tools and
- MSYS2 is a collection of tools and libraries providing you with an easy-to-use environment for building, installing and running native Windows software.
- It consists of
    + a command line terminal called mintty,
    + bash shell,
    + version control systems like git and subversion,
    + tools like tar and awk and
    + even build systems like autotools,
    + all based on a modified version of Cygwin.

- Despite some of these central parts being based on Cygwin, 
    + the main focus of MSYS2 is to provide a build environment for native Windows software and the Cygwin-using parts are kept at a minimum. 
    + MSYS2 provides up-to-date native builds for GCC, mingw-w64, CPython, CMake, Meson, OpenSSL, FFmpeg, Rust, Ruby, just to name a few.

+ Msys2 also has mingw-w64 as part of the stack, which means that on top of cygwin support, msys2 also contains Mingw-w64 native linux support

- To provide easy installation of packages and a way to keep them updated it features a package management system called Pacman, which should be familiar to Arch Linux users. 
    + Effectively, msys2 contains a package repository mirror for holding various cygwin, mingw-w64 packages
    + It brings many powerful features such as dependency resolution and simple complete system upgrades, as well as straight-forward and reproducible package building. 
    + Our package repository contains more than 3000 pre-built packages ready to install.

### Project
+ Author: msys2
+ Project Name: msys2
- Repositories
    - GitHub
        + [msys2/msys2-installer](https://github.com/msys2/msys2-installer)

## Setup
### Dependencies

### Pre-Requisites
- Ensure that msys2 is located in a directory with no spaces
    - i.e.
        + `C:\msys2` (recommended)

- Download the latest version of the msys2 installer
    - from [GitHub - msys2/msys2-installer - Releases](https://github.com/msys2/msys2-installer/releases)
        ```bash
        wget https://github.com/msys2/msys2-installer/releases/download/<release-tag>/msys2-x86_64-<release-version>.exe
        ```

- (Optional) Verify SHA256 hex digest of the file 
    - Download the SHA256 hash hexdigest for validation
        ```bash
        wget https://github.com/msys2/msys2-installer/releases/download/<release-tag>/msys2-x86_64-<release-version>.exe.sha256
        ```
    - Hash the file using SHA256 hashing algorithm
        ```bash
        (Get-FileHash -Algorithm SHA256 -Path .\msys2-x86_64-<release-version>.exe).Hash.toLower()
        ```
    + Compare and verify the file hash

### Installation
- GUI installer
    - via GUI
        + Startup `.\msys2-x86_64-<release-version>.exe`
        + Select Installation path

    - via CLI
        - Explanation
            - Parameters
                + `--confirm-command` : Confirm the command
                + `--accept-messages` : Accept all terms and conditions and default options
                + `--root [root-installation-directory]` : Explicitly specify the installation root directory you wish to install msys2 to (i.e. C:/msys64)
        ```bash
        .\msys2-x86_64-<release-version>.exe in --confirm-command --accept-messages --root [root-installation-directory]
        ```

- Self-extracting archive
    ```bash
    .\msys2-base-x86_64-latest.sfx.exe -y -o[root-installation-directory]
    ```

### Post-Installation
- Set the root directory of msys2 into the system PATH environment variable
    - Notes
        + The binaries for starting up each of the development environment and shells are in the root directory
        - The packages installed via pacman are in the directories
            - Cygwin
                + clang32 : For 32-bit clang packages/libraries
                + clang64 : For 64-bit clang packages/libraries
                + clangarm64 : For 64-bit ARM clang packages/libraries
            - Native
                + mingw32 : For 32-bit MinGW native packages/libraries
                + mingw64 : For 64-bit MinGW (aka mingw-w64) native packages/libraries
            - UCRT
                + ucrt64  : For 64-bit UCRT packages/libraries
        - Each of the build environments directories are isolated directories following a classic Linux installation environment layout/structure
            - {clang32|clang64|clangarm64|mingw32|mingw64|ucrt64}/
                - bin/ : Binaries/executables will be installed here
                - etc/ : All miscellenous resource files (i.e. configuration files) will be installed here
                - include/ : All includes (i.e. DLL and include libraries) will be installed here
                - lib/ : All API libraries and modules will be installed here
                - libexec/ : All executable API library and modules will be installed here
                - share/ : All shared resources (i.e. fonts, icons) will be installed here
    - Assumptions
        + The installation path is 'C:\msys2'
    ```bash
    SET PATH=%PATH%;C:\msys2
    ```

+ Startup the terminal of your choice

- Update the package manager's repository database and upgrade all installed packages
    ```bash
    pacman -Syu
    ```

- Install some essential packages to start things off
    - UCRT64
        ```bash
        pacman -S mingw-w64-ucrt-x86_64-gcc
        ```

### Uninstallation
- via GUI
    + Startup `[msys2-installation-root-directory]\uninstall.exe`

- via CLI
    - Explanation
        - Parameters
            + pr : Permanent Remove
            + `--confirm-command` : Confirm the command
    ```bash
    [msys2-installation-root-directory]\uninstall.exe pr --confirm-command
    ```

## Documentations
### Synopsis/Syntax
### Parameters
### Usage

## Wiki

## Resources

## References
+ [GitHub - msys2/msys2-installer - Nightly installer build](https://github.com/msys2/msys2-installer/releases/tag/nightly-x86_64)
+ [GitHub - msys2/msys2-installer - Releases](https://github.com/msys2/msys2-installer/releases)
+ [msys2 - documentations - installer](https://www.msys2.org/docs/installer/)
+ [msys2 - documentations - updating](https://www.msys2.org/docs/updating/)
+ [msys2 - installation](https://www.msys2.org/#installation)
+ [msys2 repository server](https://repo.msys2.org/distrib)

## Remarks

