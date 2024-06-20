# Rust Snippet - System Command Execution using the Built-in Standard Library process module

## Steps
1. Import the crate/package/library
    - Modules
        - std::process
            + self
            + Command
    ```rust
    use std::process::{self, Command};
    ```

2. For Cross-Platform Compatibility: Check if the Operating System is for Windows or *NIX and return the command output to the variable 'output'
    - Explanation
        - `let output = if cfg!(target_os = "windows")` : Check if the target platform is Windows
            + If it is, Execute windows-based commands
            - If it is not, the operating system is *NIX based (UNIX, Linux, MacOS)
                + Execute *NIX-based commands
        - `let res = output.stdout`
            + The variable 'output' (type <Result>) will contain the result of the statements that are executed within the macro/operation bracket
            + To obtain the standard outputs returned by the statements, access the `Result.stdout` property/attribute/variable
    ```rust
    let output = if cfg!(target_os = "windows") {
        // Windows
    } else {
        // *NIX
    }
    ```

3. Create a new process for system command execution
    - Initialize a new Command structure object 
        - Explanation
            - `Command` can be reused to spawn multiple processes
                + The builder methods change the command without needing to immediately spawn the process.
        ```rust
        let mut proc:Result = Command::new("your-cmd-here")
        ```

4. Append arguments to be executed with the command
    - For a command with multiple arguments specified in a list
        - Explanation
            - Note that this uses '.args([])' instead of '.arg("")'
                + `.args([])` will take in a list containing all arguments and values you wish to pass to the command
                + Using `.args([])` basically allows for sanitized standard input arguments instead of raw string which makes formatting/sanitization difficult
        ```rust
        proc.args(["place", "your", "arguments", "here"]);
        ```
    - For a command with multiple arguments specified in a string
        - Explanation
            - Note that this uses '.arg("")' instead of '.args([])'
                + `.arg("")` will take in a string containing the arguments and values in 1 string
        ```rust
        proc.arg("option 1").arg("option 2");
        ```

5. Execute the command and return the results
    ```rust
    let proc_res:Result = proc.output().expect("Failed to execute process");
    ```

6. Obtain the standard output/error streams from the result
    - Notes
        + The result stdout (`output.stdout`) and stderr (`output.stderr`) are in Vec<u8> vector containers
    ```rust
    let u8_stdout = proc_res.stdout;
    let u8_stderr = proc_res.stderr;
    ```

7. Obtain the status/result/return code containing the result of the process pipe
    - If you are using `.output()`
        - Explanation
            + `.success()` will return the success status in a bool type (true = Success, false = Error)
        ```rust
        let rc = output.status.success();
        ```

8. Pass and unwrap the UTF-8 Vec<u8> objects into strings for usage
    - Explanation
        + Pass the Vec<u8> object into the `String::from_utf8(vec_object)` function to format it into a 'Result<String, FromUTF8Error>' object
        + Execute `.unwrap()` to obtain the String value from the vector of Bytes
    ```rust
    let stdout = String::from_utf8(u8_stdout).unwrap();
    let stderr = String::from_utf8(u8_stderr).unwrap();
    ```

9. Match-case the result code basing off the success status (true/false)
    ```rust
    match rc {
        true => {
            print!("{}\n", "Standard Output:");
            // Print result
            print!("{}\n", stdout);
        }
        false => {
            print!("{}\n", "Standard Error:");
            // Print result
            print!("{}\n", stderr);
        }
    }
    ```

## Snippet

> Default

```rust
use std::process::{self, Command};

fn main() {
    // Design, generate Command object and execute system command
    let output = if cfg!(target_os = "windows") {
        Command::new("cmd")
            .args(["place", "your", "args", "here"])
            .stderr(process::Stdio::piped())
            .stdout(process::Stdio::piped())
            .stdin(process::Stdio::piped())
            .output()
            .expect("Failed to execute process")
    } else {
        Command::new("ping")
            .arg("place")
            .arg("your")
            .arg("args")
            .arg("here")
            .stderr(process::Stdio::piped())
            .stdout(process::Stdio::piped())
            .stdin(process::Stdio::piped())
            .output()
            .expect("Failed to execute process")
    };

    // Get Results
    let u8_stdout = output.stdout;
    let u8_stderr = output.stderr;
    let rc = output.status.success();

    // Pass and unwrap the UTF-8 Vec<u8> object into string
    let stdout = String::from_utf8(u8_stdout).unwrap();
    let stderr = String::from_utf8(u8_stderr).unwrap();

    // Print results
    print!("Result Code: {}\n", rc.to_string());
    match rc {
        true => {
            print!("{}\n", "Standard Output:");
            // Print result
            print!("{}\n", stdout);
        }
        false => {
            print!("{}\n", "Standard Error:");
            // Print result
            print!("{}\n", stderr);
        }
    }
}
```

> Example Commands

- Execute 'ls' in the current working directory
    - All-in-one
        ```rust
        // Initialize a new Command structure object for a shell executing options and commands
        let mut proc = Command::new("ls")

        // Execute 'ls' in the current working directory
        proc.status().expect("Process failed to execute");
        ```
    - Calling builder methods after spawning a process and then spawn a new process with the modified settings
        - Initialize a new Command structure object for a shell executing options and commands
            ```rust
            // Initialize a new Command structure object for a shell executing options and commands
            let mut proc = Command::new("ls")
            ```
        - Execute 'ls' in the current working directory
            ```rust
            proc.status().expect("Process failed to execute");
            ```
        - Modify settings of the Command process
            ```rust
            // Change `ls` to execute in the root directory.
            proc.current_dir("/");
            ```
        - Execute `ls` again but in the root directory.
            ```rust
            proc.status().expect("Process failed to execute");
            ```


