# Rust - Syntax and structure formatting

## Syntaxes

### Variables

- Declare and Initialize variables
    ```rust
    let var_name:type = value;
    ```

- Patterns - Variable Binding
    ```rust
    let (var_1, var_2) = (value_1, value_2);
    ```

- Declare and Initialize a mutable variable
    - Explanation
        + By default, variables are immutable
    ```rust
    let mut var_name:type = value;
    ```

### Data Structures
- Arrays (Indexed-based Ordered Lists)
    - Initialize a simple array
        ```rust
        let variable_name = [your, values, here];
        ```
    - Declare and statically Initialize array with properties
        ```rust
        let variable_name:[Type; array-size] = [your, values, here];
        ```
    - Declare and statically dynamic arraylist
        ```rust
        let variable_name:[Type; array-size] = [your, default, values, here;array-size];
        ```
    - Obtain the length/size of the array
        ```rust
        let arr_len = variable_name.len();
        ```
    - Get/Obtain the value of an index in the array
        ```rust
        let arr_val = variable_name[i];
        ```
    - Set a new value into an index of the array
        - Notes
            + Ensure that the array is assigned the "mut" property so that the variable is mutable/editable
        ```rust
        variable_name[i] = new_value;
        ```

- Vectors (Dynamically-sized Arrays, aka Lists/ArrayLists - similar to C++)
    -  Declare and statically Initialize array with properties
        ```rust
        let args: Vec<String> = ["your", "values", "here"]
        ```

### Conditional statements

- if-else condition
    ```rust
    if <condition-expression> {

    } else {

    }
    ```

- if-else-if-else condition
    ```rust
    if <condition-expression> {

    } else if <alternate-condition-expression> {

    } else {

    }
    ```

- Match-case
    ```rust
    match variable {
        case => "single option",
        case1 | case2 => "OR statement",
        min..max => "From min to max",
        _ => "Default value"
    }
    ```

### Null

> Introduction

- Explanation
    + also known as None, nil, null
    - null is basically an empty object, it is not even intiialized
        + Hence, you should do data validations such as a Null-value check to ensure a memory container is in a safe state to be used

- There's no built-in empty value keywords in rust (and no Null-pointer exceptions, as Rust is designed for safety)
    - Alternatives
        1. Use an Option (`std::option`)

> Using Option

- The type `Option` represents an optional value: Some (contains a value) or None (does not contains a value)
    - Uses
        + Initial values
        + Return values for functions that are not defined over their entire input range (partial functions)
        + Return value for otherwise reporting simple errors, where None is returned on error
        + Optional struct fields
        + Struct fields that can be loaned or “taken”
        + Optional function arguments
        + Nullable pointers
        + Swapping things out of difficult situations
    - Use Cases
        + Commonly paired with pattern matching to query the presence of a value and take action, and always accounting for the None case

- Using `std::option`
    - Documentations
        - Attributes
            - Option<PointerHandle<T>>
                - `Some(value)` : Checks if the Pointer Handle contains the specified `value`
                - None : If the pointer handle does not contain the specified value

    - Syntax and Synopsis
        - Declaring and Initialization
            ```rust
            let optional: Option<PointerHandle<T>> = SomePointer_of_type_T;
            ```
        - Usage
            ```rust
            match optional {
                Some(p) => println!("has value {p}"),
                None => println("has no value"),
            }
            ```

> Question Mark Operator

- Purpose
    - Similar to the `Result` type, when writing code that calls many functions that return the `Option` type, handling `Some/None` can be tedious
        - The question mark operator (`?` ) hides some of the boilerplate of propagating values up the call stack

- Syntax/Structure
    + `?` is like the ternary operator, where it checks if the passed value(s) (which the operator have been appended to) exists
    ```rust
    fn function_name(parameter_signature) -> Option<T> {
        Some(value?)
    }
    ```

- Example
    - Add last numbers to the stack
        - Without question mark operator
            ```rust
            fn add_last_numbers(stack: &mut Vec<i32>) -> Option<i32> {
                let a = stack.pop();
                let b = stack.pop();

                match (a,b) {
                    (Some(x), Some(y)) => Some(x+y),
                    _ => None,
                }
            }
            ```
        - With question mark operator
            ```rust
            fn add_last_numbers(stack: &mut Vec<i32>) -> Option<i32> {
                Some(stack.pop()? + stack.pop()?)
            }
            ```

### Enumeration
- Define a new Enumeration object
    - Ordered List without any discriminator values
        - Explanation
            + Because there are no integer discriminator values assigned to the variables, the first element will be defaulted to 0
            + Every subsequent element will be ordered according to an indexed-based structure (like an array/list) and incrementing by 1 for every element, Index = N-1
            - For example
                + Option1 = 0th-element
                + Option2 = 1st-element
                + Option3 = 2nd-element
                + OptionN = (N-1)th-element
        ```rust
        enum EnumerationSet { 
            Option1,
            Option2,
            Option3,
            /// ...
            OptionN
        }
        ```
    - With mapped constants
        ```rust
        enum EnumerationSet { 
            Option1 = value1,
            Option2 = value2,
            Option3 = value3,
            /// ...
            OptionN = valueN
        }
        ```

- Access an option in the enumerator
    - Explanation
        - as : cast operator 
            - Used to convert/cast the value on the LHS as the data type specified on the RHS
                 + Similar to using `(data-type)Value;`
    ```rust
    println!( "{:?} => {}", OptionN, OptionN as <data-type> );
    ```

### Loops

- for-loops
    - Iterate over a range of numbers
        ```rust
        for i in min..max {
            // statements
        }
        ```
    - Iterate over the elements of an array
        - Notes
            + Use the '&' value-of operator to access the values found in the memory address of the array variable
        ```rust
        for x in &array {
            print!("{} ", x);
        }
        ```
    - Iterate over the index of an array
        ```rust
        for i in 0..array.len() {
            // print
            print!("{}", i);
        }
        ```
    - Iterate over the index of an array and obtaining the array values
        ```rust
        for i in 0..array.len() {
            // Access the values in the array's memory address and Get the current element
            let curr_element = &array[i];

            // print
            print!("{} : {}", i, curr_element);
        }
        ```

- while-loops
    - While loop until a break condition is met
        ```rust
        let mut count = 0; 
        while count < 10 { 
            println!("count is {}", count); 
            count += 1; 
        }
        ```

### Crates

- `extern crate` : Specify a dependency on an external library (or crate in Rust terms).
    - Notes
        + The dependency is resolved at compile time.
    ```rust
    extern crate std; // equivalent to: extern crate std = "std"; 
    ```

- `extern crate` as : Link to the specified crate but under an alias (different name)
    ```rust
    extern crate std as ruststd; // linking to 'std' under another name
    ```

### Functions
- Define a new function
    - Notes
        - Function return
            - In Rust, returning of values is done through implicit returns instead of explicit returns
                + This means that the result that will be returned to the caller is not defined with a "return" keyword, but whatever variable/value at the last line will be returned to the caller 
    ```rust
    fn func_name(param:<param-type>) -> (return-types,...) { 
        // Statements
        res:<data-type> = value

        // Output/Returns
        res
    }
    ```

- Call the function
    ```rust
    fn main() { 
        let var_name:<data-type> = func_name(params);
    }
    ```

### Command Line Arguments

- Obtaining Command Line Arguments
    - Explanation
        + Import the 'std::env' System Environment built-in standard library/crate 
        - Obtain the CLI arguments parsed into the system environment and collect the arguments in a string vector
            - The 'env::args()' function contains all arguments passed into the application 
                + `.collect()` will store the results in an array (Ordered/Positional/Indexed-based container) (aka ArrayList, List, Vector)
    ```rust
    use std::env;

    // Get the CLI arguments parsed into the system environment and collect the arguments 
    // in a string vector
    let args: Vec<String> = env::args().collect();
    ```

- To obtain the number of arguments passed (aka 'argc')
    - Using the '.len()' function from the array/vector built-in functions
        - Explanation
            + `arr.len()` will return the length/size of the array(list)
        ```rust
        let argc:uint8 = argv.len();
        ```

- Iterate through the CLI arguments list for usage
    - Notes
        - Index 0 (The first argument) in the CLI argument parser is always the binary/executable
            + Hence, all CLI arguments parsed will start from index 1 (The second argument)
    ```rust
    // Check if CLI arguments are provided
    if argc > 0 {
        for i in 1..args.len() {
            // Access the argument vector's memory address values and Get current argument
            let arg = &args[i];

            // Print argument
            print!("{}\n", arg);
        }
    } else {
        print!("{}", "No arguments provided.");
    }
    ```

### External Files
- Import an external library/module or package
    - Explanation
        + Use the `use <package|crate>::<module>` keyword to import/source an external library into the local variable as an object
    ```rust
    use <package|crate>::<module>
    ```

### Reading files
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

### System process calls 
- also known as system command execution
    + process calls is used to execute system commands

> Import the crate/package/library

- Modules
    - std::process
        + self
        + Command
```rust
use std::process::{self, Command};
```

> For Cross-Platform Compatibility: Check if the Operating System is for Windows or *NIX and return the command output to the variable 'output'

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

> System Command Execution

- Create a new process for system command execution
    - Initialize a new Command structure object 
        - Explanation
            - `Command` can be reused to spawn multiple processes
                + The builder methods change the command without needing to immediately spawn the process.
        ```rust
        let mut proc:Result = Command::new("your-cmd-here")
        ```

- Append arguments to be executed with the command
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

- Execute the command and return the results
    ```rust
    let proc_res:Result = proc.output().expect("Failed to execute process");
    ```

- Obtain the standard output/error streams from the result
    - Notes
        + The result stdout (`output.stdout`) and stderr (`output.stderr`) are in Vec<u8> vector containers
    ```rust
    let u8_stdout = proc_res.stdout;
    let u8_stderr = proc_res.stderr;
    ```

- Obtain the status/result/return code containing the result of the process pipe
    - If you are using `.output()`
        - Explanation
            + `.success()` will return the success status in a bool type (true = Success, false = Error)
        ```rust
        let rc = output.status.success();
        ```

- Pass and unwrap the UTF-8 Vec<u8> objects into strings for usage
    - Explanation
        + Pass the Vec<u8> object into the `String::from_utf8(vec_object)` function to format it into a 'Result<String, FromUTF8Error>' object
        + Execute `.unwrap()` to obtain the String value from the vector of Bytes
    ```rust
    let stdout = String::from_utf8(u8_stdout).unwrap();
    let stderr = String::from_utf8(u8_stderr).unwrap();
    ```

- Match-case the result code basing off the success status (true/false)
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

> Subprocess pipes

- Introduction
    - Subprocess pipes are essentially dedicated pathways setup specifically for commands (and its parameters/arguments) called processes (or proc for short)
        + These processes have specific IDs known as Process IDs (or PIDs) that can be used to track the status of each process.
        - By using subprocess pipes, you can create processes for multiple commands and track all of them for easier synchronous (and even asynchronous) command execution
            + As well as obtaining the standard streams (standard output and standard error) from the process result output

- This is similar to `subprocess.Popen()` in python
    ```python
    from subprocess import Popen, PIPE, DEVNULL

    with Popen(["command", "arguments", "here"], stdin=PIPE, stdout=PIPE, stderr=PIPE) as proc:
        # Execute process using `.communicate()` for synchronous command execution
        stdout, stderr = proc.communicate()

        # Obtain status code on completion
        rc = proc.returncode
    ```

- To execute the command and arguments as a (sub)process pipe and return the standard output and the status/return/result code
    - Set Standard Input stream
        - Explanation
            + Set the stream handle as `process::Stdio::piped()` to PIPE into the standard input from the process's standard output
            - Set the stream handle as `process::Stdio::from(proc_stdout.unwrap())` to PIPE the standard output of the specified process into the current process as a standard input
                - Where
                    - proc_stdout : The standard output of a previously-specified process handle that exists and you wish to pipe the data from standard output into the new process as a standard input
                        + Type: Vec<u8>
        ```rust
        let proc = Command::new("cmd")
            .args(["place", "your", "arguments", "here"])
            .stdin(process::Stdio::piped())
            .output()
            .expect("Failed to execute process")
        ```
    - Set Standard Output stream
        - Explanation
            + Set the stream handle as `process::Stdio::piped()` to PIPE the result of the (sub)process command execution to the standard output
        ```rust
        let proc = Command::new("cmd")
            .args(["place", "your", "arguments", "here"])
            .stdout(process::Stdio::piped())
            .output()
            .expect("Failed to execute process")
        ```
    - Set Standard Error stream
        - Explanation
            + Set the stream handle as `process::Stdio::piped()` to PIPE the result of the (sub)process command execution to the standard error
        ```rust
        let proc = Command::new("cmd")
            .args(["place", "your", "arguments", "here"])
            .stderr(process::Stdio::piped())
            .output()
            .expect("Failed to execute process")
        ```

### Concurrency

> Threads

- Import the 'std::thread' threads built-in standard library/crate 
    ```rust
    use std::thread;
    ```
- Spawn threads for each task/job (the function you want the thread to execute concurrently/asynchronously)
    - Explanation
        - `thread::spawn(action || thread_stmt)` will initialize a new thread mapped to the function you provided and return the thread object
            - Parameter Signature/Header
                - action : Specify a spawn action (leave empty to not execute a purpose)
                    - Values
                        + move
                - thread_stmt : Pass the function you wish to execute
                    + Type: `&dyn Fn()`
                    - Format
                        ```rust
                        {
                            // Your statement here
                        }
                        ```
            - Return
                + The thread object is of type JoinHandle<T>
    ```rust
    let thread = thread::spawn(|| function(parameter_signature));
    ```

- Wait for all your threads to complete
    - Notes
        + Specify this for all threads you spawned
    ```rust
    thread.join().expect("Thread N panicked");
    ```

## Wiki

## Resources

## References
+ [brson - A Guide to Rust Syntax](https://gist.github.com/brson/9dec4195a88066fa42e6)
+ [GeeksForGeeks - Rust - Array](https://www.geeksforgeeks.org/rust-array/)

## Remarks

