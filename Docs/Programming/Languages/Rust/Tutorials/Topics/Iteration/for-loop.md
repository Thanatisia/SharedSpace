# Rust - Tutorial - Topics: Iteration - For Loops

## Information

### Description
- Performing iterations over iterable/iterative objects
    - such as
        + Arrays (Index-based ordered containers; aka ArrayLists, Vectors, Lists) and
        + Dictionaries (Key-Value mappings; aka maps, HashMap, Associative Arrays)

### Theory/Concept
- A for loop is equivalent to a loop expression containing a match expression
    - For Loop
        ```rust
        'label: for PATTERN in iter_expr {
            /* Loop Body */
        }
        ```
    - Match-case expression
        ```rust
        // Initialize a Switch/Match-case comparison expression,
        // the result of the block statements will be returned to the variable 'result'
        let result = match IntoIterator::into_iter(iter_expr) {
            // Define your case
            mut iter => 'label: loop {
                // Initialize a mutable variable for the next value/element
                let mut next;

                // Match the next array element
                match Iterator::next(&mut iter) {
                    // Case: If the value of 'val' is not empty, store 'val' into the variable 'next'
                    Option::Some(val) => next = val,
                    // Case: If there are no values, break the loop
                    Option::None => break,
                };

                // Set the PATTERN to the next element
                let PATTERN = next;

                // Initialize a new loop
                let () = {
                    // Loop Body
                };
            },
        };

        // Use the 'result' variable
        ```

## Documentations

### Keywords
+ for : For iterating through iterable containers using a pattern

### Synopsis/Syntax
- For loop
    - Explanation
        + PATTERN refers to the variable that will store the current element during the looping of an iterable (i.e. array/arraylist/list/vector etc etc) matching the specified expression
        - EXPRESSION refers to a set of conditions that the for loop will follow while looping
            - There are various types of expressions
                + array : Using the array/iterable container object directly. The for loop will loop through every element in the array, with each element being placed into 'PATTERN' when the cursor is back at the top of the loop
                + range : Use the structure/format 'min..max' to invoke a range for loop. This is used to iterate through a defined set of numbers between a given minimum value and a maximum value
    - Default
        ```rust
        for PATTERN in EXPRESSION {
            // Statements
        }
        ```
    - Array/Iterable
        - Variable
            ```rust
            for element in arr {
                // Statements
            }
            ```
        - In-line definition
            ```rust
            for element in ["elements", "here"] {
                // Statements
            }
            ```
    - Range
        - Notes
            - Before rustc-1.0.0-nightly
                + `for n in min..max` was the same as `for n in range(min, max)`
        ```rust
        for n in min..max {
            // Statements
        }
        ```
    - Pointer iterable
        ```rust
        for ptr in arr.iter() {
            // Statements
        }
        ```
    - Index-Element mapping
        - Explanation
            - This will return a tuple containing the following of the current elment
                1. Current element index
                2. Element value
        ```rust
        for (i, element) in arr.iter().enumerate() {
            // Statements
        }
        ```

### Usage

> using For Loop

- Initialize an array(s)
    ```rust
    let arr = &["your", "elements", "here"];
    ```

- Loop/Iterate through the array using the elements directly (no index)
    ```rust
    for element in arr {
        // Print the current element
        println!("{}", element);
    }
    ```

- Loop/Iterate through an array containing a range/series of integers
    ```rust
    // Iterate through the range of numbers between min and max
    for n in min..max {
        // Statements dealing with current number 'n'
    }
    ```

- Loop/Iterate through an array using the pointer of the iterable
    - Notes
        - The loop items are borrowed references to the iteratee elements. 
            - In this case, 
                + the elements of strs have type &'static str - they are borrowed pointers to static strings. 
                + This means sptr has type &&'static str, so we dereference it as *sptr. 
            - An alternative form is
                ```rust
                for &element in arr.iter() {
                    println!("{}", element);
                }
                ```
    ```rust
    for ptr in arr.iter() {
        // Statements
        println!("{}", ptr);
    }
    ```

- Loop/Iterate through an array and return a tuple containing an Index-Element mapping
    - Explanation
        - This will return a tuple containing the following of the current elment
            1. Current element index
            2. Element value
    ```rust
    for (i, element) in arr.iter().enumerate() {
        // Statements
        println!("String #{} is {}", i, s);
    }
    ```

### Snippets

- Initialize an array(s)
    ```rust
    let str_list = &["apples", "cake", "coffee"];
    let int_list = &[1, 2, 3, 4];
    ```

- Loop/Iterate through the array using the elements directly (no index)
    ```rust
    for element in str_list {
        // Print the current element
        println!("{}", element);
    }
    ```

- Loop/Iterate through an array containing a range/series of integers and sum them
    ```rust
    // Initialize variables
    let mut sum:uint32 = 0;
    let min:uint32 = 1;
    let max:uint32 = 11;

    // Iterate through the range of numbers between min and max
    for n in min..max {
        // Accumulate/increment the sum by n
        sum += n;
    }
    ```

## Wiki

## Resources
+ [Rustlang Documentations - std - iter](http://doc.rust-lang.org/std/iter/index.html)
+ [Rustlang Documentations - std - iter - trait.Iterator](https://doc.rust-lang.org/std/iter/trait.Iterator.html#method.enumerate)

## References
+ [Rustlang Documentations - Reference - Expressions - Loop](https://doc.rust-lang.org/reference/expressions/loop-expr.html)
+ [StackOverflow - Questions - 9271970 - How do you make a range in Rust](https://stackoverflow.com/questions/9271970/how-do-you-make-a-range-in-rust)

## Remarks

