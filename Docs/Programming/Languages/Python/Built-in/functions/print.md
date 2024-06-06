# Python Built-in Standard Library functions: print()

## Information
### Description
+ `print()` in python is used to print a given string to the standard output

## Documentations

### Synopsis/Syntax
```python
print(vargs, opts)
```

### Parameters
- Positionals
    - vargs : Specify the variable length list of target strings to print to the standard output
        + Type: *vargs
- Optionals
    - end : Specify the delimiter/separator to write at the end of the messages
        + Type: String
        - Example Delimiters
            + "\n" : End with a newline
            + "\r" : Bring the cursor pointer back to the start of the buffer and continue writing from the pointer (in this case, the start)

### Usage
- Default print
    ```python
    print("your", "message"
    ```

- Print with a newline
    ```python
    print("your", "message", end="\n")
    ```

- Print on the same line and overwrite
    ```python
    print("your", "message", end="\r")
    ```

## Wiki

### Snippets
- Updating the same line with print
    ```python
    for i in range(0, 1_000_000):
        print(i, end="\r")
    ```

## Resources

## References

## Remarks

