# Cargo.toml Configuration File

## Information
### Project file structure/layout
- root/ : This is the project root working directory
    + Cargo.lock : Created when `cargo build` is ran for the first time; This contains the package list and is equivalent to `npm.lock`
    + Cargo.toml : The Cargo TOML configuration file
    - src/
        + main.rs

## Setup
### Pre-Requisites
- Creating a new cargo project
    - Cargo will create a new directory, and within the directory
        - Initialize a new git repository, along with a `.gitignore` file which contains all the files/folders you want git to ignore
        - Generate 2 files and 1 directory
            + `Cargo.toml` file : this is the primary cargo project TOML configuration file
            - `src/` directory : For holding all your source codes
                + `main.rs` : The main entry point rust source file
    ```bash
    cargo new [project-name]
    ```

### Configuration File structure/layout
```toml
[section]
key = value
```

## Cargo configuration and customization settings key-values
### Sections
+ package : This section configures the project's package specifications
+ dependencies : This section configures the project's dependencies and required packages (also known as 'crates' in rust)

### Section Key-Value Settings
- package
    - key-value settings
        - name : Specify the name of the package; (Recommended) name this the same thing as your project workspace root directory for clarity
            + Type: String
        - version : Specify the version of the package; Update this every time you change version (similar to pyproject.toml)
            + Type: String
        - edition : Specify the edition of rust to use
            + Type: String

- dependencies
    - key-value mappings
        - crate-name : Specify the name of the crate (aka dependency packages) you wish to install
            + Type: String
            - Value: the version of the crate
                + Type: String

## Example Configurations
- Package
    ```toml
    [package]
    name = "package-name"
    version = "v0.1.0"
    edition = "2021"
    ```

- Dependencies
    ```toml
    [dependencies]
    <name-of-package|crate> = "version-number"
    ```

## Resources

## References
+ [Rust Book - Chapter 1.1 - Installation](https://doc.rust-lang.org/book/ch01-01-installation.html)
+ [Rust Book - Chapter 1.3 - Hello, Cargo!](https://doc.rust-lang.org/book/ch01-03-hello-cargo.html)
+ [Rust Book - Chapter 2.0 - Programming a Guessing Game](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html)
+ [Rustlang - Tools - Installation](https://www.rust-lang.org/tools/install)
+ [Rustlang - Documentations - Cargo](https://doc.rust-lang.org/cargo/)
+ [Rustlang - Documentations - cargo - reference - manifest](https://doc.rust-lang.org/cargo/reference/manifest.html) for more keys and their definitions

## Remarks

