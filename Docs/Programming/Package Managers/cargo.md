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
            - `install {options} <arguments>` : Install a package
                - Options
                    + `--git [git-remote-repository-server]` : Install from the specified git (remote) repository server instead
- Optionals
    - With Arguments

    - Flags

### Usage
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

## Remarks
