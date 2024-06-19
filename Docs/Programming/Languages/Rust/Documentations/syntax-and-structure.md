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
        for i in range(min, max) {
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
        for i in range(array.len()) {
            // Get current element
            let curr_element = array[i];

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

## Wiki

## Resources

## References
+ [brson - A Guide to Rust Syntax](https://gist.github.com/brson/9dec4195a88066fa42e6)
+ [GeeksForGeeks - Rust - Array](https://www.geeksforgeeks.org/rust-array/)

## Remarks
