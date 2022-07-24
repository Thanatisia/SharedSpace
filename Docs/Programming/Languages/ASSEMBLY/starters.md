# Starter Kit

## Fundamentals

### Instruction Sets
- Different Architectures will have different ASSEMBLY Instruction Sets based off 
    + Bigger Architectures (like x86_64) will have bigger Instruction Sets than others (i.e. MSP430)
    
### Skeleton of an ASSEMBLY code
- Components
    ```
    An ASSEMBLY program is divided into 3 sections
    ```
    - *data* section : Used for declaring initialized data or constants; The data placed here does not change at runtime
        + Declaration : *section.data*
    - bss section : Used for declaring variables
        + Declaration : section.bss
    - text section : Used for keeping the actual code body. This section must begin with the declaration [*global _start*], which tells the kernel where the program excecution begins
        - Declaration : 
            ```assembly
            section.txt
            global _start
            _start:
            ```

- Comments
    + Comments begin with a semicolon
    - Single Line Comments
        ```assembly
        ; Comments Here
        ```

> This section is a WIP, TBC

- General Syntax
    

## References
+ [TutorialsPoint - ASSEMBLY : Basic Syntax](https://www.tutorialspoint.com/assembly_programming/assembly_basic_syntax.htm)

## Resources
+ "Endianess" - look up 'Big Endian and Little Endian'

