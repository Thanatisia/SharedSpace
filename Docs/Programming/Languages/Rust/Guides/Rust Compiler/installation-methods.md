# Rust - Installation Methods

> Using rustup (Recommended)

- Setup
    - Dependencies
        + curl

- Curl the rustup script
    ```bash
    curl --proto '=https' --tlsv1.2 https://sh.rustup.rs | tee -a rustup-installer.sh
    ```

- Read the source code
    ```bash
    cat rustup-installer.sh
    ```

- Execute the command to install rustup and the rust toolchain
    + Configure accordingly
    + After completion, the compiler and toolchain executables will be installed to '$HOME/.cargo/bin'
        + rustc    : Rust Compiler
        + cargo    : Rust Package Manager
        + rustdoc  : Rust Documentation and
        + rustup   : Rust Updater
    ```bash
    ./rustup-installer.sh
    ```

- (Optional) Append '$HOME/.cargo/bin' into your system PATH environment variable
    ```bash
    PATH+=:$HOME/.cargo/bin:
    ```

- (Optional) Chroot into the cargo virtual environment 'env' in '$HOME/.cargo' to use the binaries
    ```bash
    . $HOME/.cargo/env
    ```

- (Optional) Backup and Archive
    - Backup/Compress/Archive the '$HOME/.cargo' folder into a tarball for reuse
        ```bash
        tar -cvzf rust-[version-number].tar.gz $HOME/.cargo
        ```
    - Recover/Extract the '$HOME/.cargo' to the home directory
        ```bash
        tar -xvzf rust-[version-number].tar.gz
        mv rust-[version-number] $HOME
        ```

+ [Building from Source (Minimum 10GB storage - Not Recommended)](build-from-source.md)


