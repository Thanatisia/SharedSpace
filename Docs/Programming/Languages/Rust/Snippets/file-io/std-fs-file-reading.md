# Rust Snippet - Reading a file using the Built-in Standard filesystem (fs) and path module

## Steps
1. Import the crate/package/library
    ```rust
    use std::{env,fs};
    use std::path::Path;
    ```

2. Initialize Variables
    - Explanation
        - `format!("{}", variables, ...);` is a macro that will create a string with formatters and its a values mapped to the formatters
            + To store the results into a variable, prepend/attach the '&' value-of memory address operator to the macro
    ```rust
    let f_name = "src.txt";
    let err_msg = &format!("Error reading file {}", f_name);
    ```

2. Check if the file exists
    ```rust
    // Check if file exists
    if Path::new(f_name).exists() {
        // File exists
    } else {
        print!("File '{f_name}' does not exist.\n");
    }
    ```

3. Read the contents of the specified file to string and store in the contents variable (buffer)
    ```rust
    let f_contents = fs::read_to_string(f_name).expect(err_msg);

4. Print file contents
    ```rust
    print!("{}", f_contents);
    ```

## Snippet

```rust
// Import crates/packages/dependencies
use std::{env,fs};
use std::path::Path;

fn main() {
    // Initialize Variables
    let f_name = "src.txt";

    // Check if file exists
    if Path::new(f_name).exists() {
        // File exists
        // Read the specified file to string and store in the contents variable (buffer)
        let err_msg = &format!("Error reading file {}", f_name);
        let f_contents = fs::read_to_string(f_name).expect(err_msg);

        // Print file contents
        print!("{}", f_contents);
    } else {
        print!("File '{f_name}' does not exist.\n");
    }
}
```

