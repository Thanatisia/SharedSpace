# Rust - Attributes

## Information

### Description

## Documentations

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

## Wiki

### Attribute Options  
- #[opt(val)] : Set the attribute option and values  
    - Options  
        - repr(data-types) : Specify that the assigned object (variable/function) is represented/using the provided data type  
            - Data Types/Classes  
                + u8 : 8-bit unsigned integer

## Resources

## References

## Remarks
