# Rust - cargo package manager

## Setup
### Dependencies
+ rust
+ rustc
+ cargo

## Documentations
### Synopsis/Syntax
```console
cargo [action] {options} <arguments>
```

### Parameters
- Positionals
    - action : Specify the action to perform by the package manager
        - Actions
            - `build {options} <arguments>`: Build the source files in a package
                - Options
                    + --release : Build the project in RELEASE mode (default: debug)
            + `check` : Check the code to make sure it compiles but dont generate an executable; This command will quickly check your code to make sure it compiles, but this will not produce an executable
            - `install {options} <arguments>` : Install a package
                - Options
                    + `--git [git-remote-repository-server]` : Install from the specified git (remote) repository server instead
            + `run` : Compile the code and run the resulting executable all in one command
- Optionals
    - With Arguments

    - Flags

### Usage
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

- Install from a git (remote) repository server
    - Explanation
        - This will 
            + download the source code
            + build the binary
            + install in the home directory wherever defined     
    ```bash
    cargo install --git [git-remote-repository-server]
    ```

## Resources

## References
+ [Rust Book - Chapter 1.1 - Installation](https://doc.rust-lang.org/book/ch01-01-installation.html)
+ [Rust Book - Chapter 1.3 - Hello, Cargo!](https://doc.rust-lang.org/book/ch01-03-hello-cargo.html)
+ [Rustlang - Tools - Installation](https://www.rust-lang.org/tools/install)
+ [Rustlang - Documentations - Cargo](https://doc.rust-lang.org/cargo/)
+ [Rustlang - Documentations - cargo - reference - manifest](https://doc.rust-lang.org/cargo/reference/manifest.html) for more keys and their definitions

## Remarks
