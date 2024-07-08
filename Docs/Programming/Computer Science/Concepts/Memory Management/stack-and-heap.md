# Computer Science - Operating System and Memory Management - Stack and Heap

## Introduction

### Basics
- In computer science/software development
    - The stack (in general) is a component of the category known as memory management and system programming,
        + and typically tied to another component known as the heap (together - they are called the 'stack & heap')
    + The stack and heap are both located in the computer's Random Access Memory (RAM)
- In an Operating System context
    + the stack and heap are essentially still software/pieces of programs that executes the functionality required of a stack and heap

### The Stack
+ The stack is a memory space set aside for function executions to occur
- When a function is called, the block is reserved on the top of the stack for local variables to have a place to be stored when necessary
    + When that function is returned on completion, the block becomes unset and it can be used by another function call.
- The stack contains elements arranged in a LIFO (Last-in-First-Out) model, where the last element (i.e. the node/branches of a tree data structure to traverse through) that goes in will be the first to be processed out
    + The most-recently reserved block is always the next block to be freed
    - This makes keeping track of the stack simple
        + To free a block from the stack, just adjust one pointer 

### The Heap
+ The heap is a memory space set aside for dynamic memory allocation.

## Resources

## References

## Remarks

