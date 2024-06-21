# Rust Snippet - Using Option - Creating a divide function with pattern matching

## Steps
1. Define function
    - Explanation
        - In the function `divide`
            - Take in the parameter signature of
                + `numerator<f64>`: The numerator (top half of the division) of type 64-bit float
                + `denominator<f64>` : The denominator (bottom half of the division) of type 64-bit float
            - Return
                - the division in an Option<f64> object: optional of type 64-bit float
                    + If denominator is 0.0: Return None (cannot divide by 0)
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

2. Invoke/Call the function
    ```rust
    // The return value of the function is an option
    let result = divide(2.0, 3.0);
    ```

3. Pattern match to retrieve the value
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

## Snippet

```rust
fn divide(numerator: f64, denominator: f64) -> Option<f64> {
    if denominator == 0.0 {
        // Return a None option if denominator is 0 (cannot divide by 0)
        None
    } else {
        // Return the division
        Some(numerator/denominator)
    }
}

fn main() {
    // Invoke/Call the function and option the Option<f64> object
    let result = divide(2.0, 3.0);

    // Pattern match to retrieve the value
    match result {
        // The division was valid
        Some(x) => println!("Result: {x}"),
        // The division was invalid
        None => println!("Cannot divide by 0"),
    }
}
```

