# DIY - Creating your own Rust project workspace/development environment from scratch

## Information

### Project Workspace Structure/Layout
- Typical layout
    - root/ : This is the project root working directory
        + README.md : Contains an introduction to your project
        + BUILD.md : Contains your build steps and instructions on how to compile/build from source
        + CHANGELOGS.md : Contains your changelogs
        + CONTRIBUTING.md : Contains your instructions to contributors on the rules and regulations to follow
        + Cargo.lock : Created when `cargo build` is ran for the first time; This contains the package list and is equivalent to `npm.lock`
        + Cargo.toml : The Cargo TOML configuration file
        - src/ : This is the main source code directory containing all your source files
            + main.rs : This is the main entry point that the compiler will look for first when compiling/building the project

## Setup

### Dependencies
+ curl: For installing rustup
+ cargo : Rust compiler
+ rustc : Rust compiler
+ rustdoc : Rust documentations
+ rustup : Rust updater

### Pre-Requisites
- Setup rustup and cargo
    - Notes
        - for a full write-up to setup rustup, cargo, rustc and rustdoc
            + Please refer to [rustup installation documentations](https://github.com/Thanatisia/SharedSpace/blob/main/Docs/Programming/Languages/Rust/Guides/Rust%20Compiler/installation-methods.md)
    - Linux
        - Using the rustup shellscript
            - Download the rustup install script
                ```bash
                curl --proto '=https' --tlsv1.2 https://sh.rustup.rs >> rustup.sh
                ```
            - (Optional - Recommended) Read the source code
                ```bash
                cat rustup.sh
                ```
            - Change permission modifier of the script to executable
                ```bash
                chmod u+x rustup.sh
                ```
            - Execute installation script
                + Make changes if necessary
                ```bash
                sh rustup.sh
                ```
    - Windows
        - Install the rust installer 'rustup-init.exe'
            + Go to https://www.rust-lang.org/tools/install
            - Download the installer 'rustup-init.exe'
                - 32-bit
                    ```bash
                    wget https://static.rust-lang.org/rustup/dist/i686-pc-windows-msvc/rustup-init.exe
                    ```
                - 64-bit
                    ```bash
                    wget https://static.rust-lang.org/rustup/dist/x86_64-pc-windows-msvc/rustup-init.exe
                    ```
            + Begin Installation

- Verify rust is installed
    ```bash
    rustc --version
    ```

- Verify that cargo is installed
    ```bash
    cargo --version
    ```

- Optionals
    - Update Rust
        - Using rustup
            ```bash
            rustup update
            ```

    - Uninstall Rust
        - Using rustup
            ```bash
            rustup self uninstall
            ```

    - Open a local copy of the rust documentation in your browser
        - Explanation
            + The installation of Rust also includes a local copy of the documentation so that you can read it offline.
        ```bash
        rustup doc
        ```

- Install essential utilities
    - rust-analyzer : Rust LSP
        - Notes
            + For more information, please refer to '[rust-analyzer Setup Guide](Docs/Programming/Languages/Rust/Guides/rust-analyzer/setup.md)'
        - Using rustup
            ```bash
            rustup component add rust-analyzer
            ```
        - Using cargo
            - Clone git repository
                ```bash
                git clone https://github.com/rust-lang/rust-analyzer
                ```
            - Change directory into local repository
                ```bash
                cd rust-analyzer
                ```
            - Build and Install LSP server only manually from source
                ```bash
                cargo xtask install --server
                ```

### Initialize a Rust project workspace
- Using cargo
    - Create a project directory using cargo
        - Explanation
            - Cargo will create a new directory, and within the directory
                - Initialize a new git repository, along with a `.gitignore` file which contains all the files/folders you want git to ignore
                - Generate 2 files and 1 directory
                    + `Cargo.toml` file : this is the primary cargo project TOML configuration file
                    - `src/` directory : For holding all your source codes
                        + `main.rs` : The main entry point rust source file
        - Notes
            - Git files wont be generated if you run `cargo new` within an existing Git repository
                + You can override this behavior by using `cargo new --vcs=[version-control-system (i.e. git)]`, which will let you specify a custom version control system to use
        ```bash
        cargo new [project-name]
        ```

- Change directory into project directory
    ```bash
    cd [project-name]
    ```

### Post-Initialization setup
- Prepare and Create your project workspace structure/layout
    - Create directories
        ```bash
        mkdir -pv [project-root-directory]/docs/
        ```
    - Create files
        ```bash
        touch [project-root-directory]/{README,BUILD,CHANGELOGS,CONTRIBUTING}.md
        ```

### Running the application
- Using cargo (Recommended)
    - Build cargo project
        - Explanation
            - Cargo will create an executable file in 'target/debug/[project-name]' (Linux) or 'target\debug\[project-name]' (Windows) instead of your current working directory.
                - Because the default build is a debug build, Cargo puts the binary in a directory named 'debug' 
                    + Structure Layout: `target/[build-type]/[project-name]`
        - Notes
            - Running `cargo build` for the first time also causes Cargo to create a new file at the top level: Cargo.lock
                + This file keeps track of the exact versions of dependencies in your project
        ```bash
        cargo build
        ```

    - Build cargo project for release
        - Explanation
            - Cargo will compile it with optimizations
                + and create an executable in 'target/release' instead of 'target/debug'
            - The optimizations will make your rust code run faster, 
                + but turning them on lengthens the time it takes for your program to compile
                - That is why there are 2 different profiles
                    + one for development
                    + one for building the final program you'll give to a user that wont be rebuilt repeatedly and that will run as fast as possible
        - Notes
            + If you are benchmarking your code's running time, use `cargo build --release` and benchmark with the executable in 'target/release'
        ```bash
        cargo build --release
        ```

    - Run the executable
        - Linux
            ```bash
            ./target/[build-type]/[executable-name]
            ```
        - Windows
            ```bash
            .\target\[build-type]\[executable-name].exe
            ```

    - Compile and run
        - Explanation
            + This will compile the code and then run the resulting executable all in one command
            - Cargo will figure out if the files had changes
                + If the files had not been changed, it doesnt rebuild the source code and just runs the binary
        - Notes
            + Using `cargo run` is more convenient than having to run `cargo build` and then use the whole path to the binary
        ```bash
        cargo run
        ```

    - Check the code to make sure it compiles but dont compile
        - Explanation
            - This command will quickly check your code to make sure it compiles
                + But this will not produce an executable
        - Notes
            + This is useful as it skips the step of producing an executable
        ```bash
        cargo check
        ```

- Using rustc (compiler)
    - Build source files into binary/executable
        ```bash
        rustc main.rs
        ```
    - Run the executable
        - Linux
            ```bash
            ./target/[build-type]/[executable-name]
            ```
        - Windows
            ```bash
            .\target\[build-type]\[executable-name].exe
            ```

## Wiki

### Tools
+ rustfmt : Automatic rust formatter/linter tool

### Tutorials
+ [Rust Book - Chapter 1.1 - Installation](https://doc.rust-lang.org/book/ch01-01-installation.html)
+ [Rust Book - Chapter 1.3 - Hello, Cargo!](https://doc.rust-lang.org/book/ch01-03-hello-cargo.html)

## Resources

## References 
+ [Rustlang - Tools - Installation](https://www.rust-lang.org/tools/install)
+ [Rustlang - Documentations - Cargo](https://doc.rust-lang.org/cargo/)
+ [Rustlang - Documentations - cargo - reference - manifest](https://doc.rust-lang.org/cargo/reference/manifest.html) for more keys and their definitions

## Remarks
