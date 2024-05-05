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
    - `::io` : Standard Input-Output operations library

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

### Functions
- std
    - `println(str)` : Print a new line
        - Parameter Signature/Header
            + str : Print the specified message to the standard output
- std::io::stdin()
    - `.read_line(buffer)` : Read the line received by the standard input stream and store the result in the specified buffer (memory container - i.e. the memory address pointing to a String variable)
        + Type: Bytes
        + Format: `&mut str_variable`
        - Return
            - Result : besides storing the value into the String container, the function will also return a Results enumeration (enum) value
                + Type: enum.Result
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
- String
    - `::new()` : Initialize a new String variable/object
        - Return
            - str_variable : Return the initialized String object instance
                + Type: String
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

## Resources

## References
+ [Rust Book - Chapter 2.0 - Programming a Guessing Game](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html)

## Remarks

