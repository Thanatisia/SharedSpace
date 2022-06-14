## Rust Documentation : Syntax

## Table of Contents
+ [Keywords](#keywords)
+ [Operators](#operators)
+ [Basics](#basics)

## Keywords

+ fn : To create a new function
+ let : To initialize a new variable
+ mut

## Operators

+ & : Like in C, the address-of operator

## Basics

+ Variables
    + Use the 'let' keyword
    - Declaration
        ```rust
        let variable: [data-type (Optional)] = [declaration];
        ```
    
+ Conditions
    - If-Else 
          ```rust
          if [condition] {
          
          } else {
          
          }
          ```
      
+ Loops
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

+ Libraries
    - Importing Libraries
        + Use the 'use' keyword
        ```rust
        use [library]
        ```
                
+ Functions
    + Use the 'fn' keyword
    - Without Arguments
        ```rust
        fn function_name() {
            // Statement
        }
        ```
    - With Arguments
        ```rust
        fn function_name(variable_name: datatype) {
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
            
+ Command Line Arguments
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
