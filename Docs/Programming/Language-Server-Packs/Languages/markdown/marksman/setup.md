# Markdown LSP server - marksman setup guide

## Information
### Project
+ Project Author: artempyanykh
+ Project Name: marksman
- Repositories
    + GitHub: https://github.com/artempyanykh/marksman.git

## Setup

### Dependencies
+ git
+ make
- Build Essentials
    + alpine-sdk (For pkg-based)
    + base-devel (For pacman-based)
    + build-essential (For apt-based)

### Pre-Requisites
- Install dotnet
    + Please follow [dotnet setup guide](Docs/Programming/Languages/C#/Guides/Compiler/dotnet/setup.md) for more information on how to install dotnet for your system

- Clone repository
    ```bash
    git clone https://github.com/artempyanykh/marksman.git
    ```

- Change directory into local repository
    ```bash
    cd marksman
    ```

### Build
- Build using make
    ```bash
    make build
    ```

### Installation
- Run make install
    - Explanation
        + The binary will be installed under $HOME/.local/bin (make sure this folder is in your PATH).
    ```bash
    make install
    ```

## Resources

## References 
+ [GitHub - dotnet/docs - core installation - debian](https://github.com/dotnet/docs/blob/main/docs/core/install/linux-debian.md)
+ [GitHub - dotnet/docs - core installation - debian post installation](https://github.com/dotnet/docs/blob/main/docs/core/install/includes/linux-install-80-apt.md)
+ [GitHub - dotnet/source-build - Build dotnet from source](https://github.com/dotnet/source-build)
+ [GitHub - artempyanykh/marksman - installation guide](https://github.com/artempyanykh/marksman/blob/main/docs/install.md)

## Remarks
