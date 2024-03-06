# C programming - Memory Allocation 

## Information
### Basics
- Memory Allocation in System Programming is necessary to ensure that you have full control over the allocation, and 
   + accessing of memory addresses and memory usage within the system

- Malloc is also used for dynamic memory allocation and 
    + is useful when you don’t know the amount of memory needed during compile time.

+ Allocating memory allows objects to exist beyond the scope of the current block.

- C passes by value instead of reference. 
    - Using malloc to assign memory, and then pass the pointer to another function, 
        + is more efficient than having the function recreate the structure.

- Things to take note of
    - Whenever you use malloc, you must **always** free the dynamically-allocated memory
        + Using the 'free()' function

### Important Functions
+ malloc() : Used to dynamically allocate memory from the heap
+ free() : Used to free any memory addresses that were dynamically-allocated so that the memory address can be reused for other data or purposes

## Documentations
### malloc()
#### Introduction
- Purpose of malloc
    - malloc - aka Memory Allocate - is a library function that allows you to dynamically allocate memory from the heap
        + malloc is part of the 'stdlib.h' library
        - The heap is an area of memory where soemthing is stored
            - Related:
                + stack

- Usage Flow
    1. Initialize pointer variable
    2. Dynamically allocate memory and return the pointer to the array pointer variable using 'malloc()' with the array size based on the size of your target data type

#### Setup
- Library
    + stdlib.h

- Import
    ```c
    #include <stdlib.h>
    ```

#### Synopsis/Syntax
- Explanation
    - malloc() will return a pointer to the dynamically-allocated set of memory addresses with the size of the array based on the size of your target data type.
        + The array contents will be populated in the allocated set of memory addresses
        + you will need to cast the pointer to a pointer pointing to your target array's data type
```c
<your-object-data-type> *pointer = (<your-object-data-type> *)malloc(10 * sizeof(<your-object-data-type>));
```

#### Usage Flow
- Create a pointer variable
    + malloc() allocates memory of a requested size and returns a pointer to the beginning of the allocated block. 
    + To hold this returned pointer, we must first create a pointer variable. 
    + The pointer should be of same type used in the malloc statement
    ```c
    int *arrayPtr;
    ```

- Dynamically allocate memory and return the pointer to the array pointer variable using 'malloc()' 
    + with the size of the array based on the size of your target data type.
    + You can get the size of the target data type using 'sizeof'
    ```c
    arrayPtr = (<your-data-type> *)malloc(10 * sizeof(<your-data-type>));
    ```

- Summary
    + This statement used malloc to set aside memory for an array of 10 integers. 
    - As sizes can change between computers, 
        + it’s important to use the sizeof() function to calculate the size on the current computer.

#### Usage Examples

### free()
#### Introduction
- free() is necessary whenever you use 'malloc' because whenever you allocate memory dynamically into the stack, that memory address will be used and will remain in there until you free that memory address
    - If the memory is not freed, memory faults may occur such as
        + Memory/Buffer overflow/overload
        + Segmentation Faults due to memory addresses that should be free, but are not freed and therefore still has data occupying that slot within the memory address stack
        + Memory Leaks

#### Setup
- Library
    + stdlib.h

- Import
    ```c
    #include <stdlib.h>
    ```

#### Synopsis/Syntax
```c
free(pointer);
```

#### Usage Flow
- Free the memory allocated during the program's execution before the program closes
    ```c
    free(arrayPtr);
    ```

- Summary
    + This statement will deallocate the memory previously allocated. 
    - C does not come with a garbage collector like some other languages, such as Java. 
        + As a result, memory not properly freed will continue to be allocated after the program is closed.

#### Usage Examples

## Wiki

## Resources

## References
+ [FreeCodeCamp - malloc in C: Dynamic Memory Allocation in C Explained](https://www.freecodecamp.org/news/malloc-in-c-dynamic-memory-allocation-in-c-explained)

## Remarks
