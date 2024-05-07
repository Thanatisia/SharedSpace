# sharkdp/bat

## Information
### Description
+ bat is a cat clone with wings made in Rust

### Project
+ Author: sharkdp
+ Project: bat
- Code Repositories and Mirrors
    + GitHub  : https://github.com/sharkdp/bat

## Setup
### Dependencies
- Rust Toolkit
    + cargo : Rust Package Manager
    + rustc : Rust Compiler
    + rustup : Rust Updater
- Building/Development Essentials
    + alpine-sdk      : For apk/alpine-based
    + base-devel      : For pacman-based
    + build-essential : For apt-based
+ make
+ git
+ gcc
+ glibc

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    + Only the master branch
    ```console
    git clone https://github.com/sharkdp/bat
    ```

- Change directory into folder
    ```console 
    cd bat
    ```

#### Build/Compile from Source
- Using cargo
    - Build/Compile executables/binary
        ```bash
        cargo build
        ```

#### Installation
- Using cargo
    ```bash
    cargo install --locked bat
    ```

- Using package managers
    - apt-based (Debian)
        ```bash
        apt install bat
        ```
    - pacman-based (ArchLinux)
        ```bash
        pacman -S bat
        ```
    - pkg-based (Termux)
        ```bash
        pkg {add|install} bat
        ```
    - portage-based (Gentoo)
        - When installing 'dev-lang/rust' or 'dev-lang/rust-bin'
            - Pre-Requisites
                + Enable 'rust-analyzer' and 'rust-src' USE flags
            - Installation
                ```bash
                emerge sys-apps/bat
                ```

#### Removal/Uninstallation
- Using cargo
    ```bash
    cargo uninstall bat
    ```

- Using package managers
    - apt-based (Debian)
        ```bash
        apt remove bat
        ```
    - pacman-based (ArchLinux)
        ```bash
        pacman -Rsu bat
        ```
    - pkg-based (Termux)
        ```bash
        pkg {remove} bat
        ```
    - portage-based (Gentoo)
        - Remove the specified package from the '@world' set (Indicates that the package is no longer wanted)
            ```bash
            emerge {-W|--deselect} bat
            ```
        - Pretend to clean dependencies from the removed package (Review to make sure no required packages would be removed)
            ```bash
            emerge --pretend --depclean
            ```
        - Begin the dependencies cleaning
            ```bash
            emerge --ask --depclean
            ```

## Documentations
### Configurations
- Configuration Options

- Usages

## Wiki
### Snippets and Examples

## Resources
+ [GitHub - rust-lang/rustc-dev-guide](https://github.com/rust-lang/rustc-dev-guide)
+ [GitHub - rust-lang/cargo](https://github.com/rust-lang/cargo)
+ [GitHub - rust-lang/rustup](https://github.com/rust-lang/rustup)

## References
+ [GitHub - rust-lang/rust - INSTALL](https://github.com/rust-lang/rust/blob/master/INSTALL.md)
+ [rustc development guide - building - how to build and run](https://rustc-dev-guide.rust-lang.org/building/how-to-build-and-run.html)
+ [rust-lang/rust-analyzer Installation Steps](https://rust-analyzer.github.io/manual.html#installation)

## Remarks

