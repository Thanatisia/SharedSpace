# Build from Source - rust-lang/rust

## Information
### Description
- The Rust Programming Language project
    - This package will install the complete rust toolkit including
        + rustc : Rust Compiler
        + rustdoc : Rust Documentations
        + cargo : Rust Package Manager

### Project
+ Author: rust-lang
+ Project: rust
- Code Repositories and Mirrors
    + GitHub  : https://github.com/rust-lang/rust
- Rust Toolkit
    + rustc : Rust Compiler
    + rustdoc : Rust Documentations
    + cargo : Rust Package Manager
    + rustup : Rust Updater

## Setup
### Dependencies
- Building/Development Essentials
    + alpine-sdk      : For apk/alpine-based
    + base-devel      : For pacman-based
    + build-essential : For apt-based
+ python3
+ make
+ git
+ gcc
+ cc
+ pkg-config
+ libiconv
- Linux-only
    + curl : Not needed on Windows (i.e. libcurl4-openssl-dev)
- For Cargo
    + libssl-dev/openssl-devel
- If you are building LLVM from Source
    + g++
    + ninja
    + cmake
    + libstdc++-static

### Pre-Requisites
#### Storage Management
- Notes:
    - building will require a relatively large amount of storage space. 
        + You may want to have upwards of 10 or 15 gigabytes available to build the compiler.

#### Cloning Repository
- Clone Repository
    + Only the master branch
    ```console
    git clone https://github.com/rust-lang/rust
    ```

- Change directory into folder
    ```console 
    cd rust
    ```

#### Configurations
- Configure with options required to be executed during build/compilation 
    - Configure and setup build configurations before starting the build process
        - config.toml Configuration Options
            + `--set install.prefix=[target-installation-path]` : Specify the custom install root directory/path
            + `--set build.extended=false` : Disable the default behaviour of including cargo in the build process
            - `--set build.build=[build-ABI-triple]` : Specify the target Build ABI triple of your environment
                - GNU ABI (using GCC)
                    + i686-pc-windows-gnu
                    + x86_64-pc-windows-gnu
                - The MSVC ABI
                    + i686-pc-windows-msvc
                    + x86_64-pc-windows-msvc
        - Set Installation path PREFIX
            ```console
            ./configure --set install.prefix=/usr/local
            ```
        - Set custom build ABI
            - Windows GNU
                ```console
                ./configure --set build.build=x86_64-pc-windows-gnu
                ```

#### Build/Compile
- Build/Compile source code 
    - using x.py (Recommendd)
        - Explanation
            + x.py is rust's primary build system
            + rust has make as well, but it is a wrapper that executes x.py
        - Rules/Targets
            + build : Build all source files to binary/executable
            + doc : Build all documentations
        - Build binaries
            - Explanation
                - This will build several programs
                    + rustc : The Rust Compiler
                    + rustdoc : The Rust API documentation tool
                    + cargo : Rust's Package Manager
            ```console
            ./x.py build
            ```
        - Build documentations
            - Explanation
                - The generated documentation will appear under the 'doc/' folder in the 'build/' directory for the ABI used
                    + ABI directory: 'build/[architecture]-[platform]-[operating-system]-[build-process]'
                    - i.e.
                        - if the ABI was 'x86_64-pc-windows-msvc/'
                            + The directory will be 'build\x86_64-pc-windows-msvc\doc'
            ```console
            ./x.py doc
            ```
    - Using make
        - Explanation
            + x.py is rust's primary build system
            + rust has make as well, but it is a wrapper that executes x.py
        ```bash
        make
        ```

- (Optional) Build/Compile the binaries using the stage 0 compiler only
    - Explanation
        - This will 
            + Build std using the stage0 compiler
            - Build rustc using the stage0 compiler
                + This produces the stage1 compiler
            + Build std using the stage1 compiler
        - This final product (stage1 compiler + libs built using that compiler) 
            + is what you need to build other Rust programs (unless you use #![no_std] or #![no_core]).
        ```bash
        ./x.py build library
        ```

- (Optional) Build/Compile stage 2 (the full rustc build) using the stage 1 compiler
    - Explanation
        - This will 
            - Build rustc with the stage1 compiler.
                + The resulting compiler here is called the "stage2" compiler.
            + Build std with stage2 compiler.
            + Build librustdoc and a bunch of other things with the stage2 compiler.
        + You will almost never need to do this
        ```bash
        ./x.py build --stage 2 compiler/rustc
        ```

- (Optional) Build specific components
    - Build the bootstrap compiler only
        ```bash
        ./x.py build --stage 0 library
        ```

- (Optional) Building targets for cross-compilation
    - Explanation
        - To produce a compiler that can cross-compile for other targets,
            + pass any number of `target` flags to `x build`
            + Please separate all targets with a ',' delimiter
    - Targets
        + x86_64-unknown-linux-gnu : Generic Linux x86-64 architecture platform
        + wasm32-wasi : WASM
    ```bash
    ./x.py build --target [target-1,target-2,...]
    ```

#### Creating a rustup toolchain
- Build rustup toolchain
    - Once you have successfully built rustc, you will have created a bunch of files in your build directory. 
        + In order to actually run the resulting rustc, it is recommended to create rustup toolchains. 
        - Explanation
            + The first one will run the stage1 compiler (which we built above). 
            + The second will execute the stage2 compiler (which we did not build, but which you will likely need to build at some point; for example, if you want to run the entire test suite).
        - Build Stage 0 compiler
            ```bash
            rustup toolchain link stage0 build/host/stage0-sysroot # Beta compiler + stage0 standard library (std)
            ```
        - Build Stage 1 compiler
            ```bash
            rustup toolchain link stage1 build/host/stage1
            ```
        - Build Stage 2 compiler
            ```bash
            rustup toolchain link stage2 build/host/stage2
            ```

- Verify rustc version
    - Explanation
        + Now you can run the rustc you built with.
        - If you run with -vV,
            + you should see a version number ending in -dev, indicating a build from your local environment
    ```bash
    rustc +stage1 -vV
    ```

#### Installation
- Install built binary and files to system
    - Using x.py
        - Rules/Targets
            + install : Install all binaries and documentations into the system
        - Explanation
            + x.py is rust's primary build system
            + rust has make as well, but it is a wrapper that executes x.py
            - This will install all the binaries and documentations into the system
                - When the installation is completed, install will place several programs into `$PREFIX/bin`
                    + rustc : The Rust Compiler
                    + rustdoc : The Rust API documentation tool
                    + cargo : You can disable installing this by passing '--set build.extended=false' to './configure'
        ```console
        ./x.py install
        ```
    - Using make
        - Explanation
            + x.py is rust's primary build system
            + rust has make as well, but it is a wrapper that executes x.py
        ```bash
        sudo make install
        ```

#### Removal/Uninstallation
- Uninstall from system
    - Delete executables from system $PREFIX
        ```bash
        sudo rm -r $PREFIX/bin/rustc
        sudo rm -r $PREFIX/bin/rustdoc
        sudo rm -r $PREFIX/bin/cargo
        ```

- Remove any build files from source directory
    - Clean
        + `rm -rf build` works too, but then you have to rebuild LLVM, which can take a long time even on fast computers.
        ```bash
        ./x clean
        ```

## Documentations
### Configurations
- Configuration Options
    + `--set install.prefix=[target-installation-path]` : Specify the custom install root directory/path
    + `--set build.extended=false` : Disable the default behaviour of including cargo in the build process
    - `--set build.build=[build-ABI-triple]` : Specify the target Build ABI triple of your environment
        - GNU ABI (using GCC)
            + i686-pc-windows-gnu
            + x86_64-pc-windows-gnu
        - The MSVC ABI
            + i686-pc-windows-msvc
            + x86_64-pc-windows-msvc

- Usages
    - Set Installation path PREFIX
        ```console
        ./configure --set install.prefix=/usr/local
        ```
    - Set custom build ABI
        - Windows GNU
            ```console
            ./configure --set build.build=x86_64-pc-windows-gnu
            ```

### Build System

> using x.py

- Description
    + x.py is rust's primary build system
    + rust has make as well, but it is a wrapper that executes x.py

- Targets
    - build : Build all source files into binary/executables
        + rustc : The Rust Compiler
        + rustdoc : The Rust API documentation tool
        + cargo : You can disable installing this by passing '--set build.extended=false' to './configure'
    - doc : Build all documentations from source
        - The generated documentation will appear under the 'doc/' folder in the 'build/' directory for the ABI used
            + ABI directory: 'build/[architecture]-[platform]-[operating-system]-[build-process]'
            - i.e.
                - if the ABI was 'x86_64-pc-windows-msvc/'
                    + The directory will be 'build\x86_64-pc-windows-msvc\doc'
    - install : Install all binaries into system
        - This will install all the binaries and documentations into the system
            - When the installation is completed, install will place several programs into `$PREFIX/bin`
                + rustc : The Rust Compiler
                + rustdoc : The Rust API documentation tool
                + cargo : You can disable installing this by passing '--set build.extended=false' to './configure'

## Wiki
### Snippets and Examples

## Resources
+ [GitHub - rust-lang/rustc-dev-guide](https://github.com/rust-lang/rustc-dev-guide)
+ [GitHub - rust-lang/cargo](https://github.com/rust-lang/cargo)
+ [GitHub - rust-lang/rustup](https://github.com/rust-lang/rustup)

## References
+ [GitHub - rust-lang/rust - INSTALL](https://github.com/rust-lang/rust/blob/master/INSTALL.md)
+ [rustc development guide - building - how to build and run](https://rustc-dev-guide.rust-lang.org/building/how-to-build-and-run.html)

## Remarks

