# Rust Libraries - built-in : std

## Information
### Description
+ This is the rust standard library

## Documentations
### Packages
+ std : Rust standard library

### Libraries/Modules
- std
    - `::cmp` : Standard comparison library
    - `::env` : Standard system environment library
    - `::fs`  : Standard Filesystem library
    - `::io` : Standard Input-Output operations library
    - `::path` : Standard file(path) library
    - `::process` : Standard (sub)process pipe/system command execution functions library

### Classes
- std::io
    - `::stdin()` : Receive standard input (stdin) from the user via the stdin stream
        - Return
            - stdin : The standard input handle object which will allow us to handle user input
                + Type: std::io::Stdin

### Data Types/Structures
- `enum` : Enumeration; A type that can be in one of multiple possible states, and each possible state is called a 'variant'
    - `.Result` : A Exception handling enumeration that holds the result status of functions and to encode error-handling information
        - Variants
            - Ok : Indicates that the operation was successful
                + Value: The successfully generated value
            - Err : Indicates that the operation failed
                + Value: Contains information about how or why the operation failed
+ `String` : String type
- `std::cmp::Ordering` : Enum that has the 3 outcomes that are possible when you compare 2 values - Less, Greater, Equal
    + Type: enum
    - Variants
        + Less
        + Greater
        + Equal
+ `std::io::Stdin` : Data type that represents a handle to the standard input for your terminal
+ `std::path::Path` : Structure containing attributes and functions related to filepaths
- `std::process`
    - `::Command` : Process builder that when initialized, will return a `std::process:Command` structure that contains information relating to system command/(sub)process that you wish to execute as well as the arguments
        + Type: Result

### Functions
- std
    - `println(str)` : Print a new line
        - Parameter Signature/Header
            + str : Print the specified message to the standard output
    - `.to_string()` : Convert an object to String
        - Return
            - res : Return the converted string object
                + Type: str
- std::fs
    - `::read_to_string(filename)` : Read the contents of the specified file to string and store in the contents variable (buffer)
        - Parameter Signature/Header
            - filename : Specify the name of the target file you wish to read
                + Type: String
        - Return
            - f_contents : The string contents of the specified file
                + Type: io::Result<String>
- std::io::stdin()
    - `.read_line(buffer)` : Read the line received by the standard input stream and store the result in the specified buffer (memory container - i.e. the memory address pointing to a String variable)
        + Type: Bytes
        + Format: `&mut str_variable`
        - Return
            - Result : besides storing the value into the String container, the function will also return a Results enumeration (enum) value
                + Type: enum.Result
- std::path::Path
    - `::new(filename)` : Initializes a new Path class object containing the specified filepath's properties/information/attributes
        - Parameter Signature/Headers
            - filename : Specify the filepath you wish to query about
                + Type: String
        - Return
            - path : the initialized Path class object for the provided file
                + Type: std::path::Path
    - `::exists()` : Checks if the Path entity exists
        - Return
            - flag : Returns true if the path points at an existing entity and false if it doesnt (Doesnt exist)
                + Type: Boolean
- std::process::Stdio
    - `::piped()` : Initializes a new pipe when used in a standard stream to connect the parent and child processes (used with 'std::process::Command')
        - Return
            - pipe : The pipe object used to stream the results from the stream source to a destination buffer
                + Type: std::process::Stdio
- std::process::Command
    - `::new(command_string)` : Initialize a new 'Command' structure object with the specified command to be executed
        - Parameter Signature/Header
            - command_string : Specify the command string you would like to execute in the subprocess pipe
                + Type: String
        - Return
            - command : The Command process builder structure containing the command string to be executed
                + Type: Command
    - `.args(argument_list)` : Specify list of arguments you wish to pass into the structure to be executed with the command
        - Parameter Signature/Header
            - argument_list : Specify an array/arraylist/list of arguments to be passed into the Command structure to be executed by the process
                + Type: Array/ArrayList/List
                - Notes
                    + Please place all your arguments as a new element in the list
        - Return
            - command : The modified Command process builder structure with the appended arguments
                + Type: Command
    - `.arg(argument_string)` : Specify an argument string you wish to pass into the structure to be executed with the command; Append this behind the Command process object to add to the command
        - Parameter Signature/Header
            - argument_string : Specify an argument string containing all the arguments and values you wish to be passed into the Command structure to be executed by the process
                + Type: String
        - Return
            - command : The modified Command process builder structure with the appended argument
                + Type: Command
    - `.current_dir(new_path)` : Specify and sets the new path you want to change the current subprocess execution context/path to. The process will execute the command and arguments in this new path
        - Parameter Signature/Header
            - new_path : Specify the new path you wish to change to and execute the command in
                + Type: String
        - Return
            - command : The modified Command process builder structure with the new path
                + Type: Command
    - `.get_current_dir()` : Returns the working directory for the child process
        - Return
            - curr_dir : The returned working directory of the current child process; This returns None if the working directory will not be changes
                + Type: Option<&Path> | None
    - `.stdin(cfg)` : Specifies the configuration for the child process's standard input (stdin) handle
        - Parameter Signature/Header
            - cfg : The process handle configuration used to connect the parent process to the child process
                + Type: std::process::Stdio
        - Return
            - stdout : Returns the standard output process handle
                + Type: std::process::Command
        - Notes
            + Set the stream handle as `process::Stdio::piped()` to PIPE into the standard input from the process's standard output
            - Set the stream handle as `process::Stdio::from(proc_stdout.unwrap())` to PIPE the standard output of the specified process into the current process as a standard input
                - Where
                    - proc_stdout : The standard output of a previously-specified process handle that exists and you wish to pipe the data from standard output into the new process as a standard input
                        + Type: Vec<u8>
    - `.stdout(cfg)` : Specifies the configuration for the child process's standard output (stdout) handle
        - Parameter Signature/Header
            - cfg : The process handle configuration used to connect the parent process to the child process
                + Type: std::process::Stdio
        - Return
            - stdout : Returns the standard output process handle
                + Type: std::process::Command
        - Notes
            + Set the stream handle as `process::Stdio::piped()` to PIPE the standard output of the (sub)process command execution to the variable for display and retrieval
    - `.stderr(cfg)` : Specifies the configuration for the child process's standard error (stderr) handle
        - Parameter Signature/Header
            - cfg : The process handle configuration used to connect the parent process to the child process
                + Type: std::process::Stdio
        - Return
            - stdout : Returns the standard output process handle
                + Type: std::process::Command
        - Notes
            + Set the stream handle as `process::Stdio::piped()` to PIPE the standard error of the (sub)process command execution to the variable for display and retrieval
    - `.status()` : Executes a command as a child process, wait for it to finish then collecting its status code (aka return code, retcode or result code)
        - Return
            - status_code : The returned status code after the process has been completed (Polling has stopped and a status code has been returned)
                + Type: Result<ExitStatus>
    - `.output()` : Executes the command as a child process, wait for it to finish then returns all of its output
        - Return
            - proc_out : Returned process output
                + Type: Result<Output>
    - `.spawn()` : Executes the command as a child process, wait for it to finish then returns a handle to it
        - Return
            - proc_out : Returned process output
                + Type: Result<Child>

- enum.Result
    - `.expect(error_message)` : Function used for Exception handling (try catch) where when an exception is triggered, the program will crash and an error message will be printed
        - Parameter Signature/Header
            - error_message : Specify the error message to print when error has been caught
                + Type: String
        - Notes
            - If you dont call `.expect(error_message)` after calling a function that returns an `enum.Result` type object
                + The program will compile but you'll get a warning
                - Rust warns that you havent used the `enum.Result` value returned from the function, 
                    + indicating that the program has not handled a possible error
    - `.unwrap()` : Unwrap the result object to obtain the string result
        - Return
            - res_str : The obtained string in the Result
                + Type: String
- String
    - `::new()` : Initialize a new String variable/object
        - Return
            - str_variable : Return the initialized String object instance
                + Type: String
    - `::from_utf8(vec)` : Converts a vector of bytes into a String, returning as a Result<String, FromUtf8Error> object to be unwrapped for use
        - Parameter Signature/Headers
            - vec : Pass the target vector of type bytes (u8 etc) that you wish to convert into a string
                + Type: Vec<u8>
        - Return
            - res : The converted vector of bytes packed into a string to be unwrapped
                + Type: Result<String, FromUtf8Error>
    - `.cmp(&variable)` : Compare the string value with another string value
        - Return
            - cmp_result: The comparison result - Less if the string is less than the target, More if the string is more than the target, Equal if the string is equals to the target
                + Type: `std::cmp::Ordering`
    - `.parse()` : Parse the string object to the defined type of the variable/object
        - Return
            - parsed_object : The String object parsed to the defined type of the variable
                + Type: <variable-type>
    - `.trim()` : Trim the string by removing all whitespaces from both sides of the string (at the start and at the end)
        - Return
            - trimmed : The trimmed string
                + Type: String

### Attributes/Variables
- std::process::Command 
    - Result<Output>
        - `.stdout` : Obtain the standard output from the executed subprocess, or the statements in the block of statements
            + Type: String
        - `.status` : Return the status of the output
            + Type: Integer

### Usage
- Initialize a new string object and make it mutable (in rust, variables are immutable by default)
    ```rust
    let mut variable_name = String::new();
    ```

- Obtain Standard input from the user, read the line and store the value into the memory address pointing to the variable 'guess'
    ```rust
    io::stdin().read_line(&mut variable_name).expect("Failed to read line");
    ```

- Convert a String value into a real number/integer type (Polymorphism)
    - Unsigned 32-bit Integer/Number
        ```rust
        let variable_number: u32 = str.trim().parse().expect("Please type a number!");
        ```
    - Signed 32-bit Integer/Number
        ```rust
        let variable_number: i32 = str.trim().parse().expect("Please type a number!");
        ```
    - Unsigned 64-bit Integer/Number
        ```rust
        let variable_number: u64 = str.trim().parse().expect("Please type a number!");
        ```

- Convert an object into String (Polymorphism)
    - Integer
        ```rust
        // Convert number into string
        let num_as_string = num.to_string();
        ```

- To convert a Vec<u8> UTF-8 vector container into a string (by unwrapping it)
    - Explanation
        + Pass the Vec<u8> object into the `String::from_utf8(vec_object)` function to format it into a 'Result<String, FromUTF8Error>' object
        + Execute `.unwrap()` to obtain the String value from the vector of Bytes
    ```rust
    let unwrapped = String::from_utf8(vec_object).unwrap();
    ```

### Operational Workflow
- Initialize a new string object and make it mutable (in rust, variables are immutable by default)
    ```rust
    let mut variable_name = String::new();
    ```

- Obtain Standard input from the user, read the line and store the value into the memory address pointing to the variable 'guess'
    ```rust
    io::stdin().read_line(&mut variable_name).expect("Failed to read line");
    ```

- Convert the user input string into a real number/integer type
    - Unsigned 32-bit Integer/Number
        ```rust
        let variable_number: u32 = variable_name.trim().parse().expect("Please type a number!");
        ```
    - Signed 32-bit Integer/Number
        ```rust
        let variable_number: i32 = variable_name.trim().parse().expect("Please type a number!");
        ```
    - Unsigned 64-bit Integer/Number
        ```rust
        let variable_number: u64 = variable_name.trim().parse().expect("Please type a number!");
        ```

- Check if Operating System is Windows/UNIX-based
    - Explanation
        - `let output = if cfg!(target_os = "windows")` : Check if the target platform is Windows
            + If it is, Execute windows-based commands
            - If it is not, the operating system is *NIX based (UNIX, Linux, MacOS)
                + Execute *NIX-based commands
        - `let res = output.stdout`
            + The variable 'output' (type <Result>) will contain the result of the statements that are executed within the macro/operation bracket
            + To obtain the standard outputs returned by the statements, access the `Result.stdout` property/attribute/variable
    ```rust
    /* Operating System/Platform-specific checks */

    // Check if Operating System is Windows
    let output = if cfg!(target_os = "windows") {
        // Is Windows
        // ...
    } else {
        // Not Windows
        // ...
    }

    // Obtain the standard output of the result
    let res = output.stdout;
    ```

- Create a new process for system command execution
    - Import dependencies
        ```rust
        // Import Command structure
        use std::process::Command;
        ```
    - Initialize a new Command structure object 
        ```rust
        let mut proc:Result = Command::new("your-cmd-here")
        ```
    - Append arguments to be executed with the command
        - For a command with multiple arguments specified in a list
            ```rust
            proc.args(["place", "your", "arguments", "here"]);
            ```
        - For a command with multiple arguments specified in a string
            ```rust
            proc.arg("option 1").arg("option 2");
            ```
    - Execute the command and return the results
        ```rust
        let proc_res:Result = proc.output().expect("Failed to execute process");
        ```
    - Obtain the standard output from the result
        ```rust
        let stdout = proc_res.stdout;
        ```

- subprocess Command execution structure examples
    - Initialize a new Command structure object for a command with multiple arguments
        - Explanation
            - Note that this uses '.args([])' instead of '.arg("")'
                + `.args([])` will take in a list containing all arguments and values you wish to pass to the command
                + `.arg("")` will take in a string containing the arguments and values in 1 string
                + Using `.args([])` basically allows for sanitized standard input arguments instead of raw string which makes formatting/sanitization difficult
            - `Command` can be reused to spawn multiple processes
                + The builder methods change the command without needing to immediately spawn the process.
        ```rust
        // Initialize a new Command structure object for a single command with multiple arguments specified in a list
        let mut proc:Result = Command::new("your-cmd-here")

        // Append arguments to be executed with the command
        proc.args(["place", "your", "arguments", "here"]);

        // Execute the command and return the results
        let proc_res:Result = proc.output().expect("Failed to execute process");

        // Obtain the standard output
        let stdout = proc_res.stdout;
        ```
    - Initialize a new Command structure object for parsing/passing string arguments
        - Explanation
            - Note that this uses '.arg("")' instead of '.args([])'
                + `.args([])` will take in a list containing all arguments and values you wish to pass to the command
                + `.arg("")` will take in a string containing the arguments and values in 1 string
                - Using `.args([])` basically allows for sanitized standard input arguments instead of raw string which makes formatting/sanitization difficult
                    + However, `.arg("")` contains better readability
        ```rust
        // Initialize a new Command structure object for a single command with multiple arguments specified in a list
        let mut proc:Result = Command::new("your-cmd-here")

        // Append arguments to be executed with the command
        proc.arg("option 1").arg("option 2");

        // Execute the command and return the results
        let proc_res:Result = proc.output().expect("Failed to execute process");

        // Obtain the standard output
        let stdout = proc_res.stdout;
        ```
    - Initialize a new Command structure object for a shell executing options and commands
        - Explanation
            - Note that this uses '.arg("")' instead of '.args([])'
                + `.args([])` will take in a list containing all arguments and values you wish to pass to the command
                + `.arg("")` will take in a string containing the arguments and values in 1 string
            - `Command::new("your-cmd-here").arg("sh").arg("echo hello world").output().expect()`
                - This line will perform the following
                    1. Create a new Command subprocess pipe executing the command provided.
                    2. The arguments appended will be passed into the command pipe and appended to the command string to be executed as a whole
                    3. The command with the arguments and values will finally be executed
                    4. If any exceptions were encountered
                        + Print 'Failed to execute process'
            + `let stdout = output.stdout;` : Obtain the standard output from the subprocess pipe
        ```rust
        // Initialize a new Command structure object for a shell executing options and commands
        let mut proc = Command::new("your-cmd-here")

        // Append arguments to be executed with the command
        proc.arg("sh").arg("-c").arg("echo hello world");

        // Execute the command and return the results
        let proc_res:Result = proc.output().expect("Failed to execute process");

        // Obtain the standard output
        let stdout = proc_res.stdout;
        ```

- Subprocess command execution snippets
    - Execute 'ls' in the current working directory
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

- File Reading
    - Import the crate/package/library
        ```rust
        use std::fs;
        use std::path::Path;
        ```

    - Check if the file exists
        - Explanation
            - Use the `Path::new(file_path)` to create a new file path class object that will contain properties/details about the existence of the file
                + The `.exists()` function will contain the status of the file (if it exists - true, or not - false)
        ```rust
        // Initialize Variables
        let f_name = "file-name.txt";

        // Check if file exists
        if Path::new().exists() {
            // File exists
        } else {
            print!("File '{f_name}' does not exist.\n");
        }
        ```

    - Read the contents of the specified file to string and store in the contents variable (buffer)
        - Explanation
            + The `fs::read_to_string(filename)` will read the contents of the file into the string
        ```rust
        let f_contents = fs::read_to_string(f_name).expect(err_msg);
        ```

    - Print file contents
        ```rust
        print!("{}", f_contents);
        ```

## Resources

## References
+ [Rust Book - Chapter 2.0 - Programming a Guessing Game](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html)
+ [Rustjobs - blog - Converting an int to String in Rust](https://rustjobs.dev/blog/convert-int-to-string-in-rust/)
+ [Rustlang Documentations - Library - std - process - struct.Command](https://doc.rust-lang.org/std/process/struct.Command.html)

## Remarks

