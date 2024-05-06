# rust-lang/rust-analyzer

## Information
### Description
+ rust-analyzer is a modular compiler frontend and Language Server Protocol (LSP) pack for the Rust language.
+ It is a part of a larger rls-2.0 effort to create excellent IDE support for Rust.

### Project
+ Author: rust-lang
+ Project: rust-analyzer
- Code Repositories and Mirrors
    + GitHub  : https://github.com/rust-lang/rust-analyzer

## Setup
### Dependencies
- Rust Toolkit
    + cargo : Rust Package Manager
    + rustup : Rust Updater
- Building/Development Essentials
    + alpine-sdk      : For apk/alpine-based
    + base-devel      : For pacman-based
    + build-essential : For apt-based
+ python3
+ make
+ git

### Pre-Requisites

#### Cloning Repository
- Clone Repository
    + Only the master branch
    ```console
    git clone https://github.com/rust-lang/rust-analyzer
    ```

- Change directory into folder
    ```console 
    cd rust-analyzer
    ```

#### Build/Compile and Installation
- Using cargo
    - Build/Compile executables/binary
        ```bash
        cargo xtask
        ```
    - Install the LSP server only
        - Explanation
        - Notes
            + cargo will install rust-analyzer to '~/.cargo/bin' by default
        ```bash
        cargo xtask install --server
        ```
    - Install both the LSP Server and the VS Code plugin
        - Explanation
        - Notes
            + cargo will install rust-analyzer to '~/.cargo/bin' by default
        ```bash
        cargo xtask install
        ```

- Using rustup
    ```bash
    rustup component add rust-analyzer
    ```

- Using package managers
    - apt-based (Debian)
        ```bash
        apt install rust-analyzer
        ```
    - pacman-based (ArchLinux)
        ```bash
        pacman -S rust-analyzer
        ```
    - pkg-based (Termux)
        ```bash
        pkg {add|install} rust-analyzer
        ```
    - portage-based (Gentoo)
        - When installing 'dev-lang/rust' or 'dev-lang/rust-bin'
            - Pre-Requisites
                + Enable 'rust-analyzer' and 'rust-src' USE flags
            - Installation
                ```bash
                emerge rust-analyzer
                ```

#### Removal/Uninstallation
- Using cargo
    ```bash
    cargo uninstall rust-analyzer
    ```

- Using package managers
    - apt-based (Debian)
        ```bash
        apt remove rust-analyzer
        ```
    - pacman-based (ArchLinux)
        ```bash
        pacman -Rsu rust-analyzer
        ```
    - pkg-based (Termux)
        ```bash
        pkg {remove} rust-analyzer
        ```
    - portage-based (Gentoo)
        - Remove the specified package from the '@world' set (Indicates that the package is no longer wanted)
            ```bash
            emerge {-W|--deselect} rust-analyzer
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

