# Rust Snippet - CLI Argument Parser using the Built-in Standard Library environment (env) module

## Steps
1. Import the crate/package/library
    ```rust
    use std::env;
    ```

2. Get the CLI arguments parsed into the system environment and collect the arguments in a string vector
    ```rust
    let args: Vec<String> = env::args().collect();
    ```

3. Process the argument parser and parse the arguments
    - Explanation
        - Iterate through the indexes of the CLI argument parser, starting from 1
            + Index '0' contains the executable/binary
        - Access the argument vector's memory address values using the '&' operator and 
            + Get the argument in the current index using `&args[i]`
        + Use the obtained argument value
    ```rust
    for i in 1..args.len() {
        // Access the argument vector's memory address values and Get current argument
        let arg = &args[i];

        // Print argument
        print!("{}\n", arg);
    }
    ```

## Snippet
```rust
use std::env;

fn main() {
    // Get the CLI arguments parsed into the system environment and collect the arguments 
    // in a string vector
    let args: Vec<String> = env::args().collect();

    for i in 1..args.len() {
        // Access the argument vector's memory address values and Get current argument
        let arg = &args[i];

        // Print argument
        print!("{}\n", arg);
    }
}
```

