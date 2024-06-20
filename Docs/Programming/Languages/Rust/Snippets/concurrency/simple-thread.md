# Rust Snippet - Concurrent Programming - Simple Multi-threading

## Steps
1. Import the 'std::thread' threads built-in standard library/crate 
    ```rust
    use std::thread;
    ```

2. Spawn threads for each task/job (the function you want the thread to execute concurrently/asynchronously)
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

3. Wait for all your threads to complete
    - Notes
        + Specify this for all threads you spawned
    ```rust
    thread.join().expect("Thread N panicked");
    ```

## Snippet

```rust
use std::thread;

fn get_two_sites() {
    // Spawn two threads to do work.
    let thread_one = thread::spawn(|| print!("Hello World 1!"));
    let thread_two = thread::spawn(|| print!("Hello World 2!"));

    // Wait for both threads to complete.
    thread_one.join().expect("thread one panicked");
    thread_two.join().expect("thread two panicked");
}

fn main() {
    get_two_sites()
}
```

