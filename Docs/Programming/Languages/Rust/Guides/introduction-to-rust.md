# Rust - Documentations

## Information

### Description
+ This is a complete (as much as possible) write-up documentation of the rust programming language for beginners to learn from scratch

## Table of Contents
- [Basics](#basics)
    + [Operators](#operators)
    + [Keywords](#keywords)
    + [Variables](#variables)
    + [Syntaxes](#basic-syntax)
    + [Conditional Statements](#conditional-statements)
- [Data Types](#data-types)
    + [Floats](#floats)
    + [Integers](#integers)
    + [String](#string)
    + [null](#null)
- [Standard Streams](#standard-streams)
    + [Standard Output (stdout)](#standard-output)
- [Data Structures](#data-structures)
    + [Arrays](#arrays)
    + [Vectors](#vectors)
    + [Structure](#structure)
- [Iterative](#iterations)
    - [For Loop](#for-loop)
        + [Indexed-based](#indexed-based)
        + [Key-Value Mappings](#key-value-mappings)
    - [While Loop](#while-loop)
+ [Enumeration](#enumeration)
+ [Attributes](#attributes)
+ [Crates](#crates)
- [Functions](#functions)
- [Command Line Arguments](#command-line-arguments)
- [External Files](#external-files)
    + [Importing External Libraries and packages](#importing)
    + [File I/O Processing](#file-io-processing)
- [System Process Calls](#system-process-calls)
    + [System Command Execution](#system-command-execution)
    + [Subprocess pipes](#subprocess-pipes)
- [Asynchronous Programming](#asynchronous-programming)
- [Concurrency](#concurrency)
    + [Threads](#threads)

## Basics

### Operators
+ `=` : Substitution; Set the values on the Right-Hand Side (RHS) to the variable on the Left-Hand Side (LHS)
+ `==` : Equals-to
+ `!=` : Not Equals to
+ `+` : Addition; Mathematical operator
+ `-` : Subtraction; Mathematical operator
+ `*` : Multiplication; Mathematical operator
+ `/` : Division; Mathematical operator
+ `%` : Modulus; Mathematical operator - used to find the remainder of (x % n) where X is the numerator and n is the denominator, and (x%n) => the remainder after x//n and n = 1
+ ! : Macro
- ? : An analog of the "try!" macro which . 
	- The "try!" Macro will perform a try-catch on the attached function. 
	- "try!" also extends to the "Option" class object/type which is used to unwrap a value or return None from the function
	+ `function_name(arguments, ...)? = try!(function_name(arguments, ...))`
- as : cast operator 
    - Used to convert/cast the value on the LHS as the data type specified on the RHS
       + Similar to using `(data-type)Value;` in the C-family

### Keywords
- enum : Create an enumeration (Array/Mapping of values that can be selected from)
    ```rust
    enum EnumName {
        variable = value,
        variable = value,
        /// ...
    }
    ```
- fn : Declare and initialize a new function
    ```rust
    fn func_name(parameter_signature/header) -> return_type {
        /*
         * Statements
         */
    }
    ```
- impl : Implement some functionality/a specific trait for a given type/object/struct
    - Particular Type
        ```rust
        impl <type> {
            // Define functions available only for this type/structure
            fn func_name(parameter_sig/header) -> <return_type> {
                // Statements
            }

            // Define function with a global implementation variable
            fn func_name(&mut self) -> <return_type> {
                self.var = value;
            }
        }
        ```
    - Trait (Prototype Function Definition)
        ```rust
        impl <trait_name> for <type> {
            // Define functions available only for this type/structure
            fn func_name(parameter_sig/header) -> <return_type> {
                // Statements
            }

            // Define function with a global implementation variable
            fn func_name(&mut self) -> <return_type> {
                self.var = value;
            }
        }
        ```
    - Structure (Implementing functions in a struc)
        - Declare the public struct object
            ```rust
            pub struct StructName;
            ```
        - Implement your struct function attribute and logics
            ```rust
            impl StructName {
                pub fn func_name(parameter-signature/header:<data-type>) {
                    // Function statements
                }
            }
            ```
        - Calling the function from a struct
            ```rust
            StructName::func_name(arguments, ...);
            ```
- let : Declare a new variable (Immutable by default)
    ```rust
    let var_name:<data-type> = "value";
    ```
- mod : Declare and define a new module (Similar to a function with different properties)
    ```rust
    mod module_name {
        /*
         * Module function
         */
    }
    ```
- mut : Define a variable as mutable (In Rust - All variables are immutable/read-only by default)
    ```rust
    let mut var_name:<data-type> = "value";
    ```
- pub : Define the assigned object as a publicly-accessible object
    ```rust
    pub <object> {

    }
    ```
- struct : Declare and initialize a new structure that will be used as a "Class", namespaces or data structure to hold common attributes
    ```rust
    struct struct_name {
        attribute: type,
        /// ...
    }
    ```
    - Usages
        - Create a new instance of a struct
            ```rust
            fn main() {
                let struct_obj = struct_name {
                    attribute: new-value,
                    /// ... 
                };
            }
            ```

        - Accessing an attribute from a struct  
            ```rust  
            let struct_attr = struct_obj.attribute  
            ```

        - Modify a value from a struct  
            ```rust  
            struct_obj.attribute = String::from("new-value");  
            ```

        - Implementing functions in a struct  
            - Declare the public struct object  
                ```rust  
                pub struct StructName;  
                ```  
            - Implement your struct function attribute and logics  
                ```rust  
                impl StructName {  
                    pub fn func_name(parameter-signature/header:<data-type>) {  
                        // Function statements  
                    }  
                }  
                ```  
            - Calling the function from a struct  
                ```rust  
                StructName::func_name(arguments, ...);  
                ```
- trait : Define the prototype functions within the trait that will be initialized by an impl (Implementation) of a type and provided with the function's statements  
    ```rust  
    trait <trait-name> {  
        fn function_name(parameter_signature);  
    }
    ```  
- type : Create a new Type alias to be used as a mirror of the original type. The variable declared with this type will inherit the properties and attributes assigned/defined in this Type  
    ```rust  
    type alias_type = target_type;  
    ```

### Variables
> Declaration and Initialization

- Declaring a variable
    - Explanation
        - To declare a variable in rust,
            + using the 'let' keyword will declare/generate a local variable only usable within the local scope (aka within the block in which you defined the object/variable)
            + You can explicitly specify the data type using the `:<data-type>` operator
    ```rust
    let var:<data-type>
    ```

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

- Perform a grouped local declaration
    ```rust
    {
        let previous_var;
        let new_var = "Hello World";

        previous_var = new_var;
    }
    ```

### Basic Syntax
- Commenting
    - Single Line Comment
        - Explanation
            + Use the '//' operator.
            + Use at least 2 '//', more is also allowed
            + This is similar to the C-family syntax
        ```rust
        // comment here
        ```
    - Multiline block comments
        - Explanation
            + Use the '/*'
            + Close the multiline block with '*/'
        ```rust
        /*
         * Multiline
         * Coments
         * Here
         */
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
        function-case => {
            // Statements

            // Result/Output
        },
        case1 | case2 => "OR statement",
        min..max => "From min to max",
        _ => "Default value"
    }
    ```

## Data Types
### Floats  
+ f8 : 8-bit Signed Float

### Integers  
+ i8 : 8-bit Signed Integer  
+ i16 : 16-bit Signed Integer  
+ i32 : 32-bit Signed Integer  
+ i64 : 64-bit Signed Integer  
+ u8 : 8-bit unsigned integer  
+ u16 : 16-bit unsigned integer  
+ u32 : 32-bit unsigned integer  
+ u64 : 64-bit unsigned integer

### String

#### String formatting
- In-line string formatting using variables
    ```rust
    let msg = "Hello World";
    print!("{msg}");
    ```

#### Functions
- To convert a Vec<u8> UTF-8 vector container into a string (by unwrapping it)
    - Explanation
        + Pass the Vec<u8> object into the `String::from_utf8(vec_object)` function to format it into a 'Result<String, FromUTF8Error>' object
        + Execute `.unwrap()` to obtain the String value from the vector of Bytes
    ```rust
    let unwrapped = String::from_utf8(vec_object).unwrap();
    ```

### NULL

#### Introduction
- Explanation
    + also known as None, nil, null
    - null is basically an empty object, it is not even intiialized
        + Hence, you should do data validations such as a Null-value check to ensure a memory container is in a safe state to be used

- There's no built-in empty value keywords in rust (and no Null-pointer exceptions, as Rust is designed for safety)
    - Alternatives
        1. Use an Option (`std::option`)

#### Using Option
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

    - Examples
        - Division
            - Define function
                - Explanation
                    - In the function `divide`
                        - Take in the parameter signature of
                            + `numerator<f64>`: The numerator (top half of the division) of type 64-bit float
                            + `denominator<f64>` : The denominator (bottom half of the division) of type 64-bit float
                        - Return
                            - the division in an Option<f64> object: optional of type 64-bit float
                                + If denominator is 0.0: Return None (Cannot divide by 0)
                                + Else: Return the division of `numerator/denominator`
                ```rust
                fn divide(numerator: f64, denominator: f64) -> Option<f64> {
                    if denominator == 0.0 {
                        None
                    } else {
                        Some(numerator / denominator)
                    }
                }
                ```

            - Invoke/Call the function
                ```rust
                // The return value of the function is an option
                let result = divide(2.0, 3.0);
                ```

            - Pattern match to retrieve the value
                - Explanation
                    - `Some(x)` will initialize the variable passed in the local scope, check if the `Some` result was found,
                        + and return the value into the local variable
                ```rust
                // Pattern match to retrieve the value
                match result {
                    // The division was valid
                    Some(x) => println!("Result: {x}"),
                    // The division was invalid
                    None    => println!("Cannot divide by 0"),
                }
                ```

#### Options and Pointers
+ aka "Nullable" pointers

- In Rust, there are no "null" pointer references
    + pointer types *must* always point to a valid location
    + Instead, Rust has *optional* pointers, essentially Option for the specified pointer reference's type (`Option<PointerHandle<T>`)

- Examples
    - Using an Option to create an optional Box of type i32 (Box<i32>)
        - Notes
            - In order to access the inner i32 value, the function `check_optional()` first needs to use pattern matching to determine whether the box has a value
                + `Some(...)`
                + `!None`
        ```rust
        let optional = None;
        check_optional(optional);

        let optional = Some(Box::new(9000));
        check_optional(optional);

        fn check_optional(optional: Option<Box<i32>>) {
            match optional {
                Some(p) => println!("has value {p}"),
                None => println!("has no value"),
            }
        }
        ```

#### Question Mark Operator
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

## Standard Streams
### Standard Output
- To print something the standard output
    - Explanation
        + Use the `print()` command
    ```rust
    print("{}", "your message");
    ```

## Data Structures

### Arrays
#### Information
- Introduction
    - Rust, like most programming languages is 0-based
        + This means that the index position is counted up from 0 when accessing the index position of an array
    + Arrays are Indexed, Ordered containers based on positions
    - Arrays in Rust are statically-sized (similar to C) where you need to define the size of the container for effective memory management
        + Rust uses vectors for dynamically-sized lists, also known as ArrayLists, Lists

#### Syntax and Structure
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
        + Use the `arr[index] = value;` syntax to set the value into the specified index position within the array
        + Ensure that the array is assigned the "mut" property so that the variable is mutable/editable
    ```rust
    variable_name[i] = new_value;
    ```

### Vectors 
- Information 
    - Vectors in Rust are dynamically-sized Arrays similar to C++, aka Lists/ArrayLists
        + whereby the arraylists are automatically adjusted according to new entries added into the vector

#### Syntax and Structure
- Declare and statically Initialize array with properties
    ```rust
    let args: Vec<String> = ["your", "values", "here"]
    ```

#### Functions and Usages

> Inserting an entry into a vector

```rust
let vec: Vec<String> = []

// Append/push an entry to the back of the vector/arraylist
vec.push("new-entry")
```

### Structure

#### Synopsis/Syntax
- struct : Declare and initialize a new structure that will be used as a "Class", namespaces or data structure to hold common attributes  
    ```rust  
    struct struct_name {  
        attribute: type,  
        /// ...  
    }  
    ```  

#### Usages
- Create a new instance of a struct
    ```rust
    fn main() {  
        let struct_obj = struct_name {  
            attribute: new-value,  
            /// ...  
        };  
    }  
    ```

- Accessing an attribute from a struct  
    ```rust  
    let struct_attr = struct_obj.attribute  
    ```

- Modify a value from a struct  
    ```rust  
    struct_obj.attribute = String::from("new-value");  
    ```

- Implementing functions in a struct  
    - Declare the public struct object  
        ```rust  
        pub struct StructName;  
        ```  
    - Implement your struct function attribute and logics  
        ```rust  
        impl StructName {  
            pub fn func_name(parameter-signature/header:<data-type>) {  
                // Function statements  
            }  
        }
        ```  
    - Calling the function from a struct  
        ```rust  
        StructName::func_name(arguments, ...);  
        ```

- Prototype function declaration and definition  
    - Declare your prototype functions in a trait  
        ```rust  
        trait YourTrait {  
            fn function_name(&mut self);  
        }  
        ```

    - Implement this trait for a specific type  
        ```rust  
        impl YourTrait for <target-type> {  
            fn function_name(&mut self) {  
                self.var = value;  
            }  
        }  
        ```

## Iterations

### For Loop

#### Indexed-based

> Iterate through an array

- Notes
    + This works similar to Python
        ```python
        arr:list = []

        for element in arr:
            print("Current Element: {}".format(element))
        ```

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

#### Key-Value Mappings

### While-Loop
- While loop until a break condition is met
    ```rust
    let mut count = 0; 
    while count < 10 { 
        println!("count is {}", count); 
        count += 1; 
    }
    ```

## Enumeration
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

## Attributes

### Synopsis/Syntax  
- Apply a general metadata Attribute to the whole module  
    ```rust  
    #![attribute = "value"]  
    ```

- Apply attribute to a function  
    ```rust  
    #[attribute_key]  
    fn func_name() {

    }  
    ```

### Usage

> General metadata applied to the enclosing module or crate.  
```rust  
#![crate_type = "lib"]  
```

> A function marked as a unit test  
```rust  
#[test]  
fn test_foo() {  
    /* ... */  
}  
```

> A conditionally-compiled module  
```rust  
#[cfg(target_os = "linux")]  
mod bar {  
    /* ... */  
}  
```

> A lint attribute used to suppress a warning/error  
```rust  
#[allow(non_camel_case_types)]  
type int8_t = i8;  
```

> Inner attribute applies to the entire function.  
```rust  
fn some_unused_variables() {  
    #![allow(unused_variables)]  
    let x = ();  
    let y = ();  
    let z = ();  
}  
```

### Wiki

#### Attribute Options  
- #[opt(val)] : Set the attribute option and values  
    - Options  
        - repr(data-types) : Specify that the assigned object (variable/function) is represented/using the provided data type  
            - Data Types/Classes  
                + u8 : 8-bit unsigned integer

## Crates

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

## Functions

### Synopsis/Syntax
- Declaring and initializing a function
    - Explanation
        + Define a function using the `fn` keyword, and specify the function's parameter signature/headers
        + Open the function definition block with a `{` bracket
        + End the function definitions using the `}` bracket
    ```rust
    fn function_name(param:<param-type>) {
        // Statements in here
    }
    ```

- Declaring and initializing a function that returns a value
    - Notes
        - Function return
            - In Rust, returning of values is done through implicit returns instead of explicit returns
                + This means that the result that will be returned to the caller is not defined with a "return" keyword, but whatever variable/value at the last line will be returned to the caller 
    ```rust
    // Define and initialize function for usage
    fn function_name(param:<param-type>) -> (<return-type>,...) {
        // Initialize Variables
        let res:type = "new-value";

        // Statements in here

        // Perform modification here

        // Return result
        res
    }
    ```

- Calling a function
    - Notes
        - When calling a function that is not returning a value
            + The returned object will be 'NULL'
    ```rust
    let result:<data-type> = function_name(parameters, ...);
    ```

- Implementing functions in a struct  
    - Declare the public struct object  
        ```rust  
        pub struct StructName;  
        ```  
    - Implement your struct function attribute and logics  
        ```rust  
        impl StructName {  
            pub fn func_name(parameter-signature/header:<data-type>) {  
                // Function statements  
            }  
        }  
        ```  
    - Calling the function from a struct  
        ```rust  
        StructName::func_name(arguments, ...);  
        ```

### Prototype function declaration and definition  
- Declare your prototype functions in a trait  
    ```rust  
    trait YourTrait {  
        fn function_name(&mut self);  
    }  
    ```

- Implement this trait for a specific type  
    ```rust  
    impl YourTrait for <target-type> {  
        fn function_name(&mut self) {  
            self.var = value;  
        }  
    }  
    ```

## Command Line Arguments

### Obtaining Command Line Arguments
- To obtain the CLI arguments passed in rust (aka 'argv')
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

## External Files
### Importing
- Import an external library/module or package
    - Explanation
        + Use the `use <package|crate>::<module>` keyword to import/source an external library into the local variable as an object
    ```rust
    use <package|crate>::<module>;
    ```

- Importing multiple functions in an external crate, module or library
    ```rust
    use <package|crate>::<module>::{Functions, ...};
    ```

### File IO Processing

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

## System process calls 
- also known as system command execution
    + process calls is used to execute system commands

### Import the crate/package/library
- Modules
    - std::process
        + self
        + Command
```rust
use std::process::{self, Command};
```

### For Cross-Platform Compatibility: Check if the Operating System is for Windows or *NIX and return the command output to the variable 'output'
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

### System Command Execution
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

### Subprocess pipes
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

## Asynchronous Programming

## Concurrency
### Threads
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

## Resources

## References
+ [brson - A Guide to Rust Syntax](https://gist.github.com/brson/9dec4195a88066fa42e6)
+ [GeeksForGeeks - Rust - Array](https://www.geeksforgeeks.org/rust-array/)
+ [RustLang Documentations - Async Book - Getting Started - 02. Why Async](https://rust-lang.github.io/async-book/01_getting_started/02_why_async.html)
+ [RustLang Documentations - Rust By Example - Flow Control - For loop](https://doc.rust-lang.org/rust-by-example/flow_control/for.html)
+ [RustLang Documentations - std - option](https://doc.rust-lang.org/std/option/)
+ [RustLang Documentations - std - process - Handling I/O](https://doc.rust-lang.org/std/process/index.html#handling-io)
+ [StackOverflow - Questions - 57962168 - How to set a field in a struct with an empty value](https://stackoverflow.com/questions/57962168/how-to-set-a-field-in-a-struct-with-an-empty-value)

## Remarks

