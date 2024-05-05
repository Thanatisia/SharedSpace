# Rust crates - rng

## Information
### Description
+ Random Number Generator

## Documentations
### Package
+ rand
### Modules/Libraries
- rand
    + `::Rng`
### Class
- rand
    - `::thread_rng()` : Initialize a Random Number Generator object that is local to the current thread of execution and is seeded by the Operating System
### Data Type/Class
### Functions
- rand::thread_rng()
    - `.gen_range(start..=end)` : Generate a random number from a range of numbers between minimum starting number and a maximum ending number
        - Parameters Signature/Header
            - start : Specify the starting (minimum) number in the range of the random number generator pool
                + Type: Integer
            - end : Specify the ending (maximum) number in the range of the random number generator pool
                + Type: Integer
        - Return
            - random_number : A Random number generated from a range of numbers between minimum starting number and a maximum ending number
                + Type: Integer
### Attributes/Variables

## Resources

## References
+ [Rust Book - Chapter 2.0 - Programming a Guessing Game](https://doc.rust-lang.org/book/ch02-00-guessing-game-tutorial.html)

## Remarks

