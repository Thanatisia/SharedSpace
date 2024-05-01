# Python Library - threading

## Table of Contents
* [Documentation](#documentation)

## Information
### DESCRIPTION
+ threading is a built-in python library for Multithreading and Parallel programming using multiple threads
- Multi-threading is a technique for decomposing tasks into sub-tasks that can be processed simultaneously.
    - Pros
        - This is particularly useful in applications that require heavy I/O operations,
            - i.e.
                + web scraping
                + reading from a database.
    - Limitations
        - The Global Interpreter Lock (GIL) in Python restricts one thread to execute Python bytecodes at a time, even in a multi-core processor environment. 
            + Therefore, multi-threading in Python is not suitable for CPU-bound tasks. 
            + For such tasks, Python offers another method of parallel processing: [multiprocessing](../multiprocessing/manual.md).

## Documentation

### Packages
- threading

### Modules
- threading : The primary multithreading core library module

### Classes
- threading
    - `.Thread(target, ...)` : Initializes and constructs a new Thread object for multithreading and processing simultaneously. Initialize a new class for every thread you want to use for parallel execution
        - Parameter Header/Signatures
            - target : Specify a new target function to attach to this thread to be executed
                + Type: Function

### Functions
- threading.Thread()
    + `.start()` : Start/Initiate the thread(s)
    + `.join()` : The main program will wait for the thread(s) to be completed before proceeding past that point

### Data Types and Objects

### Attributes/Variables

### Usage
- Initializing and creating Threads for each task
    ```python
    import threading

    def print_numbers():
       for i in range(10):
           print(f”  {i}”)

    def print_letters():
       for letter in 'abcdefghij':
           print(f”  {letter}”)

    # Initialize Processes
    t1 = threading.Thread(target=print_numbers)
    t2 = threading.Thread(target=print_letters)

    # Start each processes
    t1.start()
    t2.start()

    # Join the processes when completed
    t1.join()
    t2.join()
    ```

### Operational Workflow
- Import package and modules
    ```python
    from threading import Thread
    ```

- Create/Instantiate a new thread for executing functions
    - Explanation
        - This will create a new Thread object holding to the target function you wish to execute.
            + For each Thread object you create, you are assigning 1 more thread from your CPU/GPU
            + Every task assigned to the threads will be ran in parallel
    - Related:
        + Multicore GPU Programming
        + CUDA
        + OpenCL
        + OpenGL
    ```python
    thread = Thread(target=<function-to-execute>)
    ```

- Start the thread
    ```python
    thread.start()
    ```

- Join the thread and wait for the thread(s) to be completed before proceeding past that point
    ```python
    thread.join()
    ```

## Wiki

### Terminologies
- Thread : A thread (also known as a 'core') refers to individual 'bridges' or 'routing lanes' on a CPU/GPU that can be used to execute programs.
- multiprocessing : Performing 'multiple tasks' in an iterable/list concurrently/parallely until the last element in the iterable. Multiprocessing is a form of concurrent execution model
- multithreading : Performing multiple threads concurrently to perform multiple tasks at the same time. Multithreading is a form of concurrent execution model
- tasks : basically each task is also known as the individual elements within an iterable/list

## References

## Resources
+ [Python Docs - threading (for multithreading)](https://docs.python.org/3/library/threading.html)
+ [run.ai - deep learning for computer vision - python parallel programming](https://www.run.ai/guides/deep-learning-for-computer-vision/python-parallel-processing)

## Remarks

