## Rust Documentation : Syntax

## Table of Contents
+ [Keywords](#keywords)
+ [Operators](#operators)

### Operators
+ `!` : Macro operator; Set this to a function/method to execute it as a macro
+ `=` : Set operator; Set the value of the Left-hand Side (LHS) to the value on the Right-hand Side (RHS)
+ `::` : Pointer/Reference to a memory address in a variable
+ `//` : Comments
+ `/* */` : Multi-line block comments
+ `&` : Address/Reference-of Operator; assigning this to a variable basically returns the memory address of the pointer pointing to the variable, essentially 'referencing' and accessing the data of the variable without needing to copy that data into memory multiple times.

### Keywords
- `fn function_name([parameter-signature/headers]:[data-type], ...)` : To create a new function
    - Format
        ```rust
        fn function_name(parameters:data-type, ...) {

        }
        ```
- `match <expression> { case_value => function(), ... }` : Match-case (aka switch-case) in rust
    - Synopsis/Syntax layout structure
        ```rust
        match <expression> {
            "result-case-1" => function_to_execute(arguments, ...),
            "result-case-2" => function_to_execute(arguments, ...),
            "result-case-3" => function_to_execute(arguments, ...),
            "result-case-4" => function_to_execute(arguments, ...),
        }
        ```
- `use [library]` : Import the specified library/class/function/attributes
    ```rust
    use [library]
    ```
- `let variable_name:[data-type] = value;` : Declare and Initialize a new variable (variables on declaration are immutable by default in Rust)
    - Declaration
        ```rust
        let variable: [data-type (Optional)] = [declaration];
        ```
+ `mut` : Set/Define a variable as mutable

### Rust Data Typings
+ i32 : 32-bit Integer/Number (Default by Rust)
+ i64 : 64-bit Integer/Number
+ u32 : Unsigned 32-bit Integer/Number

### Snippet Syntax/Structure
+ Importing libraries/modules: `use package::class::function|attribute;`
+ Format string: `{variable_here}`
- Initializing a new variable
    + Default (Immutable): `let variable_name{:data-type} = value;`
    + Default a mutable variable: `let mut variable_name{:data-type} = value;`
    + Initializing a new String object: `let mut variable_name:u32 = String::new();`
- Creating a new function
    - Without Arguments
        ```rust
        fn function_name() {
            // Statement
        }
        ```
    - With Arguments
        ```rust
        fn function_name(parameters:data-type, ...) {
            // Statement
        }
        ```
    - With Return Value
        ```rust
        fn function_name(variable_name: datatype) -> [return_type] {
            // Statement
            let variable: [return_type] = value;
            return variable
        }
        ```
+ Executing functions: `library::class|function().function();`
+ Throw exception catching: `library::function().functions().expect("your-exception-message-here");`

### Concept
- If-Else 
  ```rust
  if [condition] {

  } else {

  }
  ```

- Loops
    - FOR Loops
        - String
            ```rust
            let mut strvar: [String; n] = Default::default();
            for line in &strvar {
                // Statement
            }
            ```
        - Vector
            - List
                ```rust
                let vec: Vec<String> = Vec::new();
                
                for element in vec {
                    // Process
                }
                ```
            - Loop with Key-Value
                ```rust
                let vec: Vec<String> = Vec::new();
                for (k, v) in vec.iter().enumerate() { 
                    // .iter() : Iterate through vector
                }
                ```

- Match-case (Switch-case)
    ```rust
    match <expression> {
        "result-case-1" => function_to_execute(arguments, ...),
        "result-case-2" => function_to_execute(arguments, ...),
        "result-case-3" => function_to_execute(arguments, ...),
        "result-case-4" => function_to_execute(arguments, ...),
    }
    ```

- Command Line Arguments
    - To get Command Line Arguments
        ```rust
        let matches = App::new("program-name")
            .version("application-version")
            .author("author-name")
            .about("progra description")
            /* 
                New Argument Definition Here
                - you can put multiple .arg() here
            */
            .arg(
                Arg::with_name("positional-argument")       // Positional Argument option text
                    .value_name("value-of-arg")             // The value of the argument)
                    .help("Help text")                      // Help text
                    .short("short-form-optional-argument")  // Short form optional argument ('-h', '-o')
                    .long("long-form-optional-argument")    // Long form optional argument ('--help', '--open')
                    .min_values(x)                          // Minimum number of arguments to parse for this option
                    .takes_value({true|false})              // If it requires to take in an input argument
            )
            .get_matches()
        ```
    - Process Command Line Arguments
        - Check is present
            ```rust
            if matches.is_present("argument-name")
            {
                // If is present
            }
            ```

### Snippet Example and Usages
- `use std::io` : Import the library 'io' from the package 'std' which refers to the Rust standard library package, and io is a library/module within the standard library that handles Input-Output operations
    + Similar to C++'s `#include <iostream>` or C's `#include <cstdio.h>`
+ `println!(str)` : Print a new line as a macro
- `let mut str_variable = String::new();` : Initialize a new string object and make it mutable 
    + in rust, variables are immutable (unmodifiable/constants) by default
+ `io::stdin()` : This function returns an instance of `std::io::Stdin`, which is a type that represents a handle to the standard input for your terminal 
- `.read_line(&mut guess).expect("Failed to read line");` : Calls the `.read_line()` method on the standard input handle to get input from the user and 
    + store/append the value into the memory address pointing to the mutable variable 'guess', without overwriting its contents
+ `println!("You guessed: {guess}");` : Format string print the result variable

