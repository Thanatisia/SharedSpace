# C programming Concept : Memory and Systems Architecture

## Computer Systems Architecture
### Stack and Heap
### Endianess
- Little Endian
    - Bits are arranged and read from smallest to biggest (bottom to top)
        - In horizontal memory maps, from right to left
    - Examples
        + x64 CPU chips

- Big Endian
    - Bits are arranged and read from biggest to smallest (top to bottom)
        - In horizontal memory maps, from left to right

## Memory Map

### Pointers and Memory Addresses
#### pointer
- Imagine a pointer as your mouse cursor
    - The cursor will 'point' to somewhere on the screen
        + That object it is touching (i.e. hyperlink, file, directory) is essentially a memory address within the stack
        + Instead of files and folders, it is jumping up and down (or left and right) between memory addresses

##### Synopsis/Syntax
- To initialize and create a pointer that points to a value in the stack 
    - Use the '*' operator
        + '*' is the address-of operator
        ```c
        int main() {
            // Initialize numerical value of 0
            int num = 0;

            // Initialize a pointer to obtain the memory address of the number
            int pointer = *num;

            // Print pointer object holding the memory address of 'num' within the stack
            printf("%d", pointer);
        }
        ```

- To reference and access value of a memory address pointer
    - Use the '&' operator
        + '&' is the reference operator
        ```c
        int main() {
            // ... Continue from the previous example

            // Initialize an reference-of ('&') operator to obtain the value of the memory address held by the pointer
            int num = &pointer;

            // Print the value of 'num' obtained from the memory address in the stack that was held by the pointer
            printf("%d", num);
        }
        ```

## Wiki

## Resources

## References

## Remarks

